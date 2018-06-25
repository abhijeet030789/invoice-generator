package org.raiabhij.resource;

import com.google.common.net.HttpHeaders;
import dwiveddi.ui.view.Response;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.raiabhij.dto.Firm;
import org.raiabhij.dto.InvoiceGenerationInput;
import org.raiabhij.dto.Item;
import org.raiabhij.dto.ItemQuantity;
import org.raiabhij.dto.Party;
import org.raiabhij.dto.Transaction;
import org.raiabhij.dto.TransactionDetail;
import org.raiabhij.view.IndexPageView;
import org.raiabhij.view.InvoiceView;
import raiabhij.miniHibernate.repository.JDBCParam;

import javax.validation.constraints.NotNull;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import static org.apache.poi.ss.usermodel.HorizontalAlignment.CENTER;
import static org.apache.poi.ss.usermodel.HorizontalAlignment.LEFT;
import static org.raiabhij.transfomer.BilledItemToTransactionDetailsTransformer.getTransaction;
import static raiabhij.helper.PropertyHelper.getTrimmedValue;

/**
 * Created by raiabhij on 8/11/2017.
 */
@Path("/")
public class IndexResource {

    private final String EXCEL_FILE_DIR = getTrimmedValue("excelFileDirectory");


    @GET
    public IndexPageView getIndexPage(){
        return new IndexPageView(
                ItemResource.getCRUDRepository().findAll(),
                PartyResource.getCRUDRepository().findAll(),
                FirmResource.getCRUDRepository().findAll());
    }

    @GET
    @Path("/invoice")
    public InvoiceView getInvoice(@QueryParam("invoiceNumber") String invoiceNumber){
        List<TransactionDetail> transactionDetail = TransactionDetailResource.getCrudRepository().findAll(new JDBCParam("invoiceNo", invoiceNumber));
        Transaction transaction = TransactionResource.getCrudRepository().findOne(new JDBCParam("invoiceNo", invoiceNumber));
        Party party = PartyResource.getCRUDRepository().findOne(new JDBCParam("gstNo",transaction.getPartyGstNo()));
        Firm firm = FirmResource.getCRUDRepository().findOne(new JDBCParam("gstNo",transaction.getFirmGstNo()));
        return new InvoiceView(party, transactionDetail, transaction.getTotalAmount(), firm, invoiceNumber);
    }

    @GET
    @Path("/invoiceExcel")
    public javax.ws.rs.core.Response getInvoiceExcel(@NotNull @QueryParam("invoiceNumber") String invoiceNumber) throws FileNotFoundException {
        String fileName = invoiceNumber.replaceAll("/", ",")+".xlsx";
        String filePath = EXCEL_FILE_DIR +"/"+fileName;
        createExcel(invoiceNumber, filePath);
        InputStream is = new FileInputStream(filePath);
        return javax.ws.rs.core.Response.ok(is)
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=\""+fileName+"\"")
                .build();
    }


    @POST
    @Path("/invoice")
    public Response generateInvoice(InvoiceGenerationInput input) {
        Party party = PartyResource.getCRUDRepository().findOne(new JDBCParam("gstNo",input.getPartyGstNo()));
        Firm firm = null;
        synchronized (this) {
            firm = FirmResource.getCRUDRepository().findOne(new JDBCParam("gstNo", input.getFirmGstNo()));
            System.out.println("Before = "+ firm.getInvoiceCurrentIndex());
            firm.setInvoiceCurrentIndex(firm.getInvoiceCurrentIndex() + 1);
            FirmResource.getCRUDRepository().update(firm);
            System.out.println("After = "+ firm.getInvoiceCurrentIndex());
        }
        String invoiceNumber = getInvoiceNumber(firm, input.isCash());
        List<TransactionDetail> transactionDetails = new ArrayList<>();
        int count = 1;
        double total = 0.0;
        for(ItemQuantity itemQuantity : input.getItemQuantities()){
            Item item = ItemResource.getCRUDRepository().findOne(new JDBCParam("code", itemQuantity.getItemCode()));
            TransactionDetail transactionDetail = item.getTransactionDetail(firm.isGst(), invoiceNumber, count++, itemQuantity, party.getStateCode() != firm.getStateCode());
            transactionDetails.add(transactionDetail);
            total += transactionDetail.getAmount();
        };
        TransactionResource.getCrudRepository().insert(getTransaction(party, firm, total, invoiceNumber, input.getLabourCharge()));
        TransactionDetailResource.getCrudRepository().insert(transactionDetails);
        return Response.contructSuccessResponse(invoiceNumber);
    }

    private String getInvoiceNumber(final Firm  firm, boolean isCash){
        return firm.getInvoicePrefix()+"-18/19"+ (isCash ? "-CA-" : "-CR-")+firm.getInvoiceCurrentIndex();
    }


    private void createExcel(String invoiceNumber, String filePath){
        List<TransactionDetail> transactionDetails = TransactionDetailResource.getCrudRepository().findAll(new JDBCParam("invoiceNo", invoiceNumber));
        Transaction transaction = TransactionResource.getCrudRepository().findOne(new JDBCParam("invoiceNo", invoiceNumber));
        Party party = PartyResource.getCRUDRepository().findOne(new JDBCParam("gstNo",transaction.getPartyGstNo()));
        Firm firm = FirmResource.getCRUDRepository().findOne(new JDBCParam("gstNo",transaction.getFirmGstNo()));
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet();
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,3));
        Row firmNameRow = sheet.createRow(0);
        Cell firmNameRowCell  = firmNameRow.createCell(0);
        firmNameRowCell.setCellValue(firm.getFirmName());
        XSSFCellStyle firmNameRowStyle = workbook.createCellStyle();
        XSSFFont firmNameRowFont = workbook.createFont();
        firmNameRowFont.setFontName(null);
        firmNameRowFont.setFontHeight(22);
        firmNameRowFont.setUnderline(FontUnderline.SINGLE);
        firmNameRowFont.setBold(true);
        firmNameRowStyle.setFont(firmNameRowFont);
        firmNameRowStyle.setAlignment(CENTER);
        firmNameRowCell.setCellStyle(firmNameRowStyle);
        populateDateBuyerAndPhoneRows(workbook, sheet, transaction, party);
        populateItems(workbook, sheet, transaction, transactionDetails);
        try {
            FileOutputStream outputStream = new FileOutputStream(filePath);
            workbook.write(outputStream);
            workbook.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    private void populateDateBuyerAndPhoneRows(XSSFWorkbook workbook, Sheet sheet, Transaction transaction, Party party){
        String[][] values = {{}, {"Date", "", new SimpleDateFormat("dd/MM/yyyy").format(transaction.getBillingDate()), ""},
                {"Buyer", "",party.getName(),""},
                {"Phone", "", party.getPhoneNumber(),""}};
        XSSFCellStyle style = getStyle(workbook, 22, LEFT, false, false);
        for(int rowIndex = 1; rowIndex < 4; rowIndex++){
            createRow(sheet, rowIndex, 4, values[rowIndex], style);
            sheet.addMergedRegion(new CellRangeAddress(rowIndex,rowIndex,0,1));
            sheet.addMergedRegion(new CellRangeAddress(rowIndex,rowIndex,2,3));
        }
    }
    private void populateItems(XSSFWorkbook workbook, Sheet sheet, Transaction transaction, List<TransactionDetail> transactionDetails){
        int rowIndex = 4;
        XSSFCellStyle withOutBorder = getStyle(workbook, 22, CENTER, false, false);
        XSSFCellStyle withBorder = getStyle(workbook, 22, CENTER, false, false, true);

        XSSFCellStyle boldStyle = getStyle(workbook, 22, CENTER, true, false, true);
        createRow(sheet, rowIndex++, 4, new String[]{"", "", "", ""}, withOutBorder);
        createRow(sheet, rowIndex++, 4, new String[]{"Item", "Rate", "Quatity",	"Amount"}, boldStyle);
        for(TransactionDetail transactionDetail : transactionDetails){

            createRow(sheet, rowIndex++, 4, new String[]{
                    transactionDetail.getItemName(),
                    String.valueOf(transactionDetail.getRate()),
                    String.valueOf(transactionDetail.getQuantity()),
                    String.valueOf(transactionDetail.getTotal())
            }, withBorder);
        }
        createRow(sheet, rowIndex++, 4, new String[]{"", "", "", ""}, withBorder);
        createRow(sheet, rowIndex++, 4, new String[]{"Labour Charge","","",String.valueOf(transaction.getLabourCharge())}, withBorder);
        sheet.addMergedRegion(new CellRangeAddress(rowIndex-1,rowIndex-1,0,2));
        createRow(sheet, rowIndex++, 4, new String[]{"TOTAL","","",String.valueOf(transaction.getTotalAmount())}, boldStyle);
        sheet.addMergedRegion(new CellRangeAddress(rowIndex-1,rowIndex-1,0,2));
    }

    private XSSFCellStyle getStyle(XSSFWorkbook workbook, int fontHeight, HorizontalAlignment horizontalAlignment, boolean isBold, boolean isUnderline, boolean isBorderAll){
        XSSFCellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(fontHeight);
        if(isUnderline) {
            font.setUnderline(FontUnderline.SINGLE);
        }
        font.setBold(isBold);
        style.setFont(font);
        if(isBorderAll) {
            style.setAlignment(horizontalAlignment);
            style.setBorderLeft(BorderStyle.MEDIUM);
            style.setBorderRight(BorderStyle.MEDIUM);
            style.setBorderTop(BorderStyle.MEDIUM);
            style.setBorderBottom(BorderStyle.MEDIUM);
        }

        return style;
    }
    private XSSFCellStyle getStyle(XSSFWorkbook workbook, int fontHeight, HorizontalAlignment horizontalAlignment, boolean isBold, boolean isUnderline){
        return getStyle(workbook, fontHeight, horizontalAlignment, isBold, isUnderline, false);
    }

    private void createRow(Sheet sheet, int rowIndex, int noOfColumns, String[] columnValues, XSSFCellStyle style){
        final Row row = sheet.createRow(rowIndex);
        int columnIndex = 0;
        while(columnIndex < noOfColumns){
            Cell cell = row.createCell(columnIndex);
            cell.setCellValue(columnValues[columnIndex]);
            cell.setCellStyle(style);
            columnIndex++;
        }
    }
}
