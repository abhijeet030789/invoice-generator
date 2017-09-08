package org.raiabhij.view;

import io.dropwizard.views.View;
import lombok.Data;
import org.raiabhij.dto.Firm;
import org.raiabhij.dto.Party;
import org.raiabhij.dto.TransactionDetail;
import org.raiabhij.service.CurrencyConvertor;

import java.util.Date;
import java.util.List;

/**
 * Created by raiabhij on 8/11/2017.
 */
@Data
public class InvoiceView extends View {

    private final List<TransactionDetail> billedItems;
    private final Party party;
    private final double total;
    private final String amountInWords;
    private final Firm firm;
    private final String invoiceNo;
    private final Date currentDate = new Date();

    public InvoiceView(Party party, List<TransactionDetail> billedItems, double total, Firm firm, String invoiceNo) {
        super("/view/Invoice.ftl");
        this.party = party;
        this.billedItems = billedItems;
        this.total = total;
        this.amountInWords = CurrencyConvertor.getAmountInWords(this.total);
        this.firm = firm;
        this.invoiceNo = invoiceNo;
    }
}
