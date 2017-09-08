package org.raiabhij.repo;

import dwiveddi.ui.DBConnection;
import raiabhij.miniHibernate.repository.CRUDRepository;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by raiabhij on 8/21/2017.
 */
public class CommonCRUDRepository<T extends Serializable> extends CRUDRepository<T> {

    @Override
    protected Connection getConnection() throws SQLException {
        return DBConnection.getConnection();
    }
}
