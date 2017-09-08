package org.raiabhij.dto;

import dwiveddi.ui.resource.annotation.ViewableEntity;
import lombok.Data;
import raiabhij.miniHibernate.repository.JDBCParam.Type;
import raiabhij.miniHibernate.repository.annotation.Column;
import raiabhij.miniHibernate.repository.annotation.Entity;
import raiabhij.miniHibernate.repository.annotation.Id;

import java.io.Serializable;

/**
 * Created by raiabhij on 8/15/2017.
 */

@ViewableEntity
@Entity(value="Party", autoCreate = true)
@Data
public class Party implements Serializable {


    @Id
    @Column(dbType = Type.STRING, nullable = false) private String gstNo;

    @Column(dbType = Type.STRING, nullable = false) private String name;

    @Column(dbType = Type.STRING, nullable = false) private String address;

    @Column(dbType = Type.STRING, nullable = false) private String state;

    @Column(dbType = Type.STRING, nullable = false) private String stateCode;

    @Column(dbType = Type.STRING, nullable = false) private String phoneNumber;

    @Column(dbType = Type.STRING, nullable = false) private String email;

}
