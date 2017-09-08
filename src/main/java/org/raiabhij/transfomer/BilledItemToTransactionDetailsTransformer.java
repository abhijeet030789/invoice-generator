package org.raiabhij.transfomer;

import org.raiabhij.dto.Firm;
import org.raiabhij.dto.Party;
import org.raiabhij.dto.Transaction;

/**
 * Created by raiabhij on 8/21/2017.
 */
public class BilledItemToTransactionDetailsTransformer {

    public static Transaction getTransaction(Party party, Firm firm, double total, String invoiceNumber) {
        Transaction transaction = new Transaction();
        transaction.setFirmGstNo(firm.getGstNo());
        transaction.setFirmName(firm.getFirmName());
        transaction.setPartyGstNo(party.getGstNo());
        transaction.setPartyName(party.getGstNo());
        transaction.setInvoiceNo(invoiceNumber);
        transaction.setTotalAmount(total);
        return transaction;
    }
}
