package org.raiabhij.dto;

import dwiveddi.ui.resource.annotation.ViewableEntity;
import lombok.Data;
import raiabhij.miniHibernate.repository.JDBCParam.Type;
import raiabhij.miniHibernate.repository.annotation.Column;
import raiabhij.miniHibernate.repository.annotation.Entity;
import raiabhij.miniHibernate.repository.annotation.Id;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by raiabhij on 8/21/2017.
 */

@Entity(value = "Transaction", autoCreate = true, defaultOrder = "order by billingDate desc")
@ViewableEntity @Data
public class Transaction implements Serializable{
    @Id @Column(dbType = Type.STRING, nullable = false) private String invoiceNo;
    @Column(dbType = Type.STRING, nullable = false) private String firmGstNo;
    @Column(dbType = Type.STRING, nullable = false) private String firmName;
    @Column(dbType = Type.STRING, nullable = false) private String partyGstNo;
    @Column(dbType = Type.STRING, nullable = false) private String partyName;
    @Column(dbType = Type.DOUBLE, nullable = false) private double totalAmount;
    @Column(dbType = Type.DATE, nullable = false) private Date billingDate;
    @Column(dbType = Type.DOUBLE, nullable = true) private double labourCharge;
}
