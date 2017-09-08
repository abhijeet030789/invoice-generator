package org.raiabhij.dto;

import dwiveddi.ui.resource.annotation.ViewableEntity;
import lombok.Data;
import raiabhij.miniHibernate.repository.JDBCParam.Type;
import raiabhij.miniHibernate.repository.annotation.Column;
import raiabhij.miniHibernate.repository.annotation.Entity;
import raiabhij.miniHibernate.repository.annotation.Id;

import java.io.Serializable;

/**
 * Created by raiabhij on 8/9/2017.
 */

@ViewableEntity
@Data
@Entity(value = "Item", autoCreate = true)
public class Item implements Serializable {
    @Id
    @Column(dbType = Type.STRING, nullable=false)  private String code;
    @Column(dbType = Type.STRING, nullable=false)  private String name;
    @Column(dbType = Type.STRING, nullable=false)  private String hsnCode;
    @Column(dbType = Type.STRING, nullable=false)  private String unit;
    @Column(dbType = Type.DOUBLE, nullable=false)  private Double rate;
    @Column(dbType = Type.DOUBLE, nullable=false) private Double gstRate;


    public TransactionDetail getTransactionDetail(final String invoiceNo, final int slNo, final Double quantity, final boolean isIgst){
        final TransactionDetail transactionDetail = new TransactionDetail(invoiceNo, slNo);
        transactionDetail.setItemName(this.getName());
        transactionDetail.setHsnCode(this.getHsnCode());
        transactionDetail.setUnit(this.unit);
        transactionDetail.setQuantity(quantity);
        transactionDetail.setRate(this.rate);
        transactionDetail.setTotal(this.rate * quantity);
        transactionDetail.setDiscount(0.00);
        transactionDetail.setTaxableAmount(transactionDetail.getTotal() - transactionDetail.getDiscount());
        if(!isIgst) {
            transactionDetail.setCgstRate(this.gstRate / 2);
            transactionDetail.setCgstAmount(transactionDetail.getCgstRate() * transactionDetail.getTaxableAmount() * 0.01);
            transactionDetail.setSgstRate(this.gstRate / 2);
            transactionDetail.setSgstAmount(transactionDetail.getSgstRate() * transactionDetail.getTaxableAmount() * 0.01);
        }else {
            transactionDetail.setIgstRate(this.gstRate);
            transactionDetail.setIgstAmount(transactionDetail.getIgstRate() * transactionDetail.getTaxableAmount() * 0.01);
        }
        transactionDetail.setAmount(transactionDetail.getTaxableAmount()
                + transactionDetail.getCgstAmount()
                + transactionDetail.getSgstAmount()
                + transactionDetail.getIgstAmount()
        );
        return transactionDetail;
    }
}
