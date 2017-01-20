package yb.db;
import javax.sql.*;
import java.sql.Connection;
import javax.naming.*;

public class YB_DB {
	static DataSource ds;
	
	static{
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConn()
	throws Exception{
		return ds.getConnection();
	} 

	
}
