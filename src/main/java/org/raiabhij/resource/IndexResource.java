package org.raiabhij.resource;

import dwiveddi.ui.view.Response;
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

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import java.util.ArrayList;
import java.util.List;

import static org.raiabhij.transfomer.BilledItemToTransactionDetailsTransformer.getTransaction;

/**
 * Created by raiabhij on 8/11/2017.
 */
@Path("/")
public class IndexResource {

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
            TransactionDetail transactionDetail = item.getTransactionDetail(firm.isGst(), invoiceNumber, count++, itemQuantity.getQuantity(), party.getStateCode() != firm.getStateCode());
            transactionDetails.add(transactionDetail);
            total += transactionDetail.getAmount();
        };
        TransactionResource.getCrudRepository().insert(getTransaction(party, firm, total, invoiceNumber));
        TransactionDetailResource.getCrudRepository().insert(transactionDetails);
        return Response.contructSuccessResponse(invoiceNumber);
    }

    private String getInvoiceNumber(final Firm  firm, boolean isCash){
        return firm.getInvoicePrefix()+"-17/18"+ (isCash ? "-CA-" : "-CR-")+firm.getInvoiceCurrentIndex();
    }

}
