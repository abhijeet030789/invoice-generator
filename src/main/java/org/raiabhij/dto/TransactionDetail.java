package org.raiabhij.dto;

import dwiveddi.ui.resource.annotation.ViewableEntity;
import lombok.Data;
import raiabhij.miniHibernate.repository.JDBCParam.Type;
import raiabhij.miniHibernate.repository.annotation.Column;
import raiabhij.miniHibernate.repository.annotation.Entity;
import raiabhij.miniHibernate.repository.annotation.Id;

import java.io.Serializable;

/**
 * Created by raiabhij on 8/21/2017.
 */

@ViewableEntity @Entity(value = "TransactionDetail", autoCreate = true) @Data
public class TransactionDetail implements Serializable{

    @Id @Column(dbType = Type.STRING, nullable = false) private String id;
    @Column(dbType = Type.STRING, nullable = false) private String invoiceNo;
    @Column(dbType = Type.INTEGER, nullable = false)private Integer slNo;
    @Column(dbType = Type.STRING, nullable = false)  private String itemName;
    @Column(dbType = Type.STRING, nullable = false) private String hsnCode;
    @Column(dbType = Type.STRING, nullable = false) private String unit;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double quantity;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double predefinedRate;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double rate;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double total;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double discount = 0.0;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double taxableAmount;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double cgstRate = 0.0;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double cgstAmount = 0.0;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double sgstRate = 0.0;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double sgstAmount = 0.0;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double igstRate = 0.0;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double igstAmount = 0.0;
    @Column(dbType = Type.DOUBLE, nullable = false) private Double amount = 0.0;

    public TransactionDetail(){
    }

    public TransactionDetail(String invoiceNo, Integer slNo, ItemQuantity itemQuantity){
        this.setInvoiceNo(invoiceNo);
        this.setSlNo(slNo);
        this.id = invoiceNo + "-" + slNo;
        this.quantity = itemQuantity.getQuantity();
        this.rate = itemQuantity.getActualRate();
        this.predefinedRate = itemQuantity.getPredefinedRate();
        this.total = this.rate * this.quantity;
        this.discount = 0.00;
        this.taxableAmount = this.total - this.discount;
    }
}
