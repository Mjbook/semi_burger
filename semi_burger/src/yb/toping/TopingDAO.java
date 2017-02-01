package yb.toping;

import java.sql.*;
import java.io.*;

public class TopingDAO {
	
	public static final String TOPING_IMG="E:/semi_burger/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/semi_burger/self/toping_img";
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TopingDAO() {

	}
	
	public int addToping(String name, String price){
		try {
			conn=yb.db.YB_DB.getConn();
			
			String sql="insert into toping values(toping_seq.nextval, 0,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, price);
			
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	public int addToping(String img){
		try {
			conn=yb.db.YB_DB.getConn();
			
			String sql="insert into toping values(toping_seq.nextval, 0,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, img);
			
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
}
