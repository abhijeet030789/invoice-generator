package org.raiabhij.resource;


import dwiveddi.ui.resource.annotation.CRUDResource;
import org.raiabhij.ConnectionFactory;
import org.raiabhij.dto.Firm;
import org.raiabhij.repo.CommonCRUDRepository;
import raiabhij.miniHibernate.repository.CRUDRepository;

import javax.ws.rs.Path;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by raiabhij on 8/19/2017.
 */
@Path("/firm")
public class FirmResource extends CRUDResource<Firm>{
    private static final CRUDRepository<Firm> crudRepository = new CommonCRUDRepository<Firm>() {
        @Override
        protected Connection getConnection() throws SQLException {
            return ConnectionFactory.getInstance().getConnection();
        }
    };

    public static CRUDRepository<Firm> getCRUDRepository(){
        return crudRepository;
    }

    public FirmResource() {
        super(crudRepository);
    }
}