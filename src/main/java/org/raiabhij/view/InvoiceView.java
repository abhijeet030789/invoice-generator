package org.raiabhij.view;

import io.dropwizard.views.View;
import lombok.Data;
import org.raiabhij.dto.Firm;
import org.raiabhij.dto.Party;
import org.raiabhij.dto.TransactionDetail;
import org.raiabhij.service.CurrencyConvertor;

import javax.swing.text.html.InlineView;
import java.util.Date;
import java.util.List;

/**
 * Created by raiabhij on 8/11/2017.
 */
@Data
public class InvoiceView extends View {

    private final List<TransactionDetail> billedItems;
    private final Party party;
    private final String amountInWords;
    private final Firm firm;
    private final String invoiceNo;
    private final Date currentDate = new Date();
    private final double total;
    private double totalCgst = 0.0;
    private double totalSgst = 0.0;
    private long roundedTotal;

    public InvoiceView(Party party, List<TransactionDetail> billedItems, double total, Firm firm, String invoiceNo) {
        super("/view/Invoice.ftl");
        this.party = party;
        this.billedItems = billedItems;
        this.total = total;
        this.roundedTotal = getRounded(this.total);
        this.amountInWords = CurrencyConvertor.getAmountInWords(this.roundedTotal);
        this.firm = firm;
        this.invoiceNo = invoiceNo;
        for(TransactionDetail item : this.billedItems){
            this.totalCgst += item.getCgstAmount();
            this.totalSgst += item.getSgstAmount();
        }
    }

    private static long getRounded(double d){
        double fPart = d - ((long)d);
        return fPart > 0.5 ? (long)d+1 : (long)d;
    }

    public static void main(String[] args) {
        System.out.println(getRounded(1.55));
        System.out.println(getRounded(155.45));
        System.out.println(getRounded(155.50));
        System.out.println(getRounded(155.51));
    }
}
