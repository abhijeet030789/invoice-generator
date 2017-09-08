package org.raiabhij.resource;

import dwiveddi.ui.resource.annotation.CRUDResource;
import org.raiabhij.ConnectionFactory;
import org.raiabhij.dto.Item;
import raiabhij.miniHibernate.repository.CRUDRepository;

import javax.ws.rs.Path;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by raiabhij on 8/9/2017.
 */
@Path("/item")
public class ItemResource extends CRUDResource<Item> {

    private static final CRUDRepository<Item> crudRepository = new CRUDRepository<Item>() {
        @Override
        protected Connection getConnection() throws SQLException {
            return ConnectionFactory.getInstance().getConnection();
        }
    };

    public static CRUDRepository<Item> getCRUDRepository(){
        return crudRepository;
    }

    public ItemResource() {
        super(crudRepository);
    }
}
