package org.raiabhij;

import dwiveddi.ui.Application;
import org.raiabhij.resource.*;

import java.util.Arrays;
import java.util.List;

/**
 * Created by raiabhij on 8/9/2017.
 */
public class InvoiceGeneratorApplication extends Application {
    public String getName() {
        return "Invoice Generator";
    }


    public List<Object> getResources() {
        return Arrays.asList(
                new ItemResource(),
                new IndexResource(),
                new PartyResource(),
                new FirmResource(),
                new TransactionResource(),
                new TransactionDetailResource(),
                new Test()
        );
    }

    public static void main(String[] args) throws Exception {
        //FtlAndJsGenerator.main(new String[]{Party.class.getName()});
        //FtlAndJsGenerator.main(new String[]{Firm.class.getName()});
        //FtlAndJsGenerator.main(new String[]{Transaction.class.getName()});
        //FtlAndJsGenerator.main(new String[]{TransactionDetail.class.getName()});
        ConnectionFactory.getInstance().runDDLs();
        new InvoiceGeneratorApplication().run(args);
        ConnectionFactory.getInstance().runSeedSqls();
    }




}
