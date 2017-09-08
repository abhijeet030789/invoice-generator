package org.raiabhij.resource;

import dwiveddi.ui.resource.annotation.CRUDResource;
import org.raiabhij.ConnectionFactory;
import org.raiabhij.dto.Party;
import raiabhij.miniHibernate.repository.CRUDRepository;

import javax.ws.rs.Path;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by raiabhij on 8/15/2017.
 */
@Path("/party")
public class PartyResource extends CRUDResource<Party> {

    private static final CRUDRepository<Party> crudRepository = new CRUDRepository<Party>() {
        @Override
        protected Connection getConnection() throws SQLException {
            return ConnectionFactory.getInstance().getConnection();
        }
    };

    public static CRUDRepository<Party> getCRUDRepository(){
        return crudRepository;
    }

    public PartyResource() {
        super(crudRepository);
    }
}
