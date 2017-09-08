package org.raiabhij.resource;

import dwiveddi.ui.resource.annotation.CRUDResource;
import dwiveddi.ui.view.EntityListView;
import org.raiabhij.ConnectionFactory;
import org.raiabhij.dto.Transaction;
import raiabhij.miniHibernate.repository.CRUDRepository;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by raiabhij on 8/21/2017.
 */
@Path("/transaction")
public class TransactionResource extends CRUDResource<Transaction>{

    private static final CRUDRepository<Transaction> crudRepository = new CRUDRepository<Transaction>() {
        @Override
        protected Connection getConnection() throws SQLException {
            return ConnectionFactory.getInstance().getConnection();
        }
    };

    public TransactionResource() {
        super(crudRepository);
    }

    public static CRUDRepository<Transaction> getCrudRepository() {
        return crudRepository;
    }

    @Override
    @GET
    @Path("/list")
    @Produces(MediaType.TEXT_HTML)
    public EntityListView<Transaction> getAll(){
        return new EntityListView<Transaction>(crudRepository.findAll(), Transaction.class);
    }
}
