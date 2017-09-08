package org.raiabhij;

import org.apache.commons.dbcp2.BasicDataSource;
import raiabhij.helper.PropertyHelper;

import javax.sql.DataSource;
import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import static raiabhij.helper.PropertyHelper.getTrimmedValue;

/**
 * Created by raiabhij on 8/9/2017.
 */
public class ConnectionFactory {
    private static final ConnectionFactory INSTANCE = new ConnectionFactory();
    public static ConnectionFactory getInstance(){
        return INSTANCE;
    }
    private final DataSource DATA_SOURCE;

    private ConnectionFactory(){
        PropertyHelper.load("conf/config.properties");
        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName(getTrimmedValue("db.driver"));
        basicDataSource.setUrl(getTrimmedValue("db.url"));
        basicDataSource.setUsername(getTrimmedValue("db.username"));
        basicDataSource.setPassword(getTrimmedValue("db.password"));
        basicDataSource.setInitialSize(Integer.parseInt(getTrimmedValue("db.pool.initialSize")));
        basicDataSource.setMaxIdle(Integer.parseInt(getTrimmedValue("db.pool.maxIdle")));
        basicDataSource.setMinIdle(Integer.parseInt(getTrimmedValue("db.pool.minIdle")));
        DATA_SOURCE = basicDataSource;
    }

    private static final String[] CREATE_TABLE_STATEMENTS = new String[]{};


    public Connection getConnection(){
        try {
            return DATA_SOURCE.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Unable to establish the connection",e);
        }
    }

    public void runSeedSqls(){
        try (Connection connection = getConnection(); Statement st1 = connection.createStatement();) {
            /*if(CREATE_TABLE_STATEMENTS.length != 0) {
                for (String string : CREATE_TABLE_STATEMENTS) {
                    st1.execute(string);
                }
            }*/
            try(BufferedReader br = new BufferedReader(new FileReader("conf/seed.sql"))){
                String line;
                while((line = br.readLine()) != null){
                    line = line.trim();
                    System.out.println("DEBUG : seed sql =  " + line);
                    if(!("".equals(line.trim()) || line.startsWith("--"))) {
                        st1.execute(line);
                    }
                }
            }catch (Exception e){
                e.printStackTrace();
                throw new RuntimeException("", e);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("", e);
        }
    }
}
