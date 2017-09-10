package org.raiabhij.dto;

import dwiveddi.ui.resource.annotation.ViewableEntity;
import lombok.Data;
import raiabhij.miniHibernate.repository.JDBCParam.Type;
import raiabhij.miniHibernate.repository.annotation.Column;
import raiabhij.miniHibernate.repository.annotation.Entity;
import raiabhij.miniHibernate.repository.annotation.Id;

import java.io.Serializable;

/**
 * Created by raiabhij on 8/19/2017.
 */
@ViewableEntity
@Entity(value="Firm", autoCreate = true)
@Data
public class Firm implements Serializable {

    @Id
    @Column(dbType = Type.STRING, nullable = false)  private String gstNo;
    @Column(dbType = Type.STRING, nullable = false)  private String firmName;
    @Column(dbType = Type.STRING, nullable = false)  private String addressLineOne;
    @Column(dbType = Type.STRING, nullable = false)  private String state;
    @Column(dbType = Type.STRING, nullable = false)  private String stateCode;
    @Column(dbType = Type.STRING, nullable = false)  private String phoneNumber;
    @Column(dbType = Type.STRING, nullable = false)  private String emailId;

    @Column(dbType = Type.STRING, nullable = false)  private String bankName;
    @Column(dbType = Type.STRING, nullable = false)  private String accountNumber;
    @Column(dbType = Type.STRING, nullable = false)  private String ifscCode;
    @Column(dbType = Type.STRING, nullable = false)  private String bankBranch;
    @Column(dbType = Type.STRING, nullable = false)  private String gstEnabled = "Y";
    @Column(dbType = Type.STRING, nullable = false)  private String invoicePrefix;
    @Column(dbType = Type.INTEGER, nullable = false) private Integer invoiceStartIndex = 1;
    @Column(dbType = Type.INTEGER, nullable = false) private Integer invoiceCurrentIndex;

    public boolean isGst(){
        return "Y".equalsIgnoreCase(gstEnabled);
    }


}
