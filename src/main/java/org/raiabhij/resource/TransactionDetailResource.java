package org.raiabhij.resource;

import dwiveddi.ui.resource.annotation.CRUDResource;
import dwiveddi.ui.view.EntityListView;
import org.raiabhij.ConnectionFactory;
import org.raiabhij.dto.Party;
import org.raiabhij.dto.TransactionDetail;
import raiabhij.miniHibernate.repository.CRUDRepository;
import raiabhij.miniHibernate.repository.JDBCParam;

import javax.validation.constraints.NotNull;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by raiabhij on 8/21/2017.
 */
@Path("transactiondetail")
public class TransactionDetailResource extends CRUDResource<TransactionDetail>{

    private static final CRUDRepository<TransactionDetail> crudRepository = new CRUDRepository<TransactionDetail>() {
        @Override
        protected Connection getConnection() throws SQLException {
            return ConnectionFactory.getInstance().getConnection();
        }
    };

    @GET
    @Path("/list/filter")
    @Produces(MediaType.TEXT_HTML)
    public EntityListView<TransactionDetail> getAll(@NotNull @QueryParam("invoiceNo") String invoiceNo){
        return new EntityListView<TransactionDetail>(crudRepository.findAll(new JDBCParam("invoiceNo", invoiceNo)), TransactionDetail.class, null);
    }

    public TransactionDetailResource(){
        super(crudRepository);
    }

    public static final CRUDRepository<TransactionDetail> getCrudRepository(){
        return crudRepository;
    }

}
