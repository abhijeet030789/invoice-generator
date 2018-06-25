package org.raiabhij.transfomer;

import org.raiabhij.dto.Firm;
import org.raiabhij.dto.Party;
import org.raiabhij.dto.Transaction;

import java.util.Date;

/**
 * Created by raiabhij on 8/21/2017.
 */
public class BilledItemToTransactionDetailsTransformer {

    public static Transaction getTransaction(Party party, Firm firm, double total, String invoiceNumber, double labourCharge) {
        Transaction transaction = new Transaction();
        transaction.setFirmGstNo(firm.getGstNo());
        transaction.setFirmName(firm.getFirmName());
        transaction.setPartyGstNo(party.getGstNo());
        transaction.setPartyName(party.getName());
        transaction.setInvoiceNo(invoiceNumber);
        transaction.setTotalAmount(total+labourCharge);
        transaction.setBillingDate(new Date());
        transaction.setLabourCharge(labourCharge);
        return transaction;
    }
}
