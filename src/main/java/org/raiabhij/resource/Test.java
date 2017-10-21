package org.raiabhij.resource;

import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import java.util.concurrent.TimeUnit;

/**
 * Created by raiabhij on 9/18/2017.
 */
@Path("/test")
public class Test {

    @GET
    public String getTest(@QueryParam("timeOutInSecs") @DefaultValue("1") final int timeOutInSecs){
        try {
            TimeUnit.SECONDS.sleep(timeOutInSecs);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return "Hiiii Haaaa, returning after "  + timeOutInSecs +" secs";
    }
}
