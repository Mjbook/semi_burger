package member;

import java.sql.*;

public class MemberDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public static final int NOT_ID = 1; 
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1;
		
	/** �α��� ���� �޼���*/
	public int memberLogin(String userid, String userpwd){
		try{
			conn = yb.db.YB_DB.getConn();
			
			String sql = "select passwd from member where id=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				String db_pwd = rs.getString("passwd");
				
				if(userpwd.equals(db_pwd)){
					return LOGIN_OK;
				} else {
					return NOT_PWD;
				}				
			} else {
				return NOT_ID;				
			}					
			
		} catch(Exception e){
			e.printStackTrace();
			return ERROR;			
		} finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				
				if(conn!=null) conn.close();
			} catch(Exception e2){}
		}
	}
	
	/** �α��� ���� �� ���� ���� �������� �޼��� */
	public String getUserInfo(String userid){
		try{
			conn = yb.db.YB_DB.getConn();
			
			String sql = "select * from member where id=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			rs.next();
			
			return rs.getString("name");		
			
		} catch(Exception e){
			e.printStackTrace();
			return null;			
		} finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				
				if(conn!=null) conn.close();				
			} catch(Exception e2){ }
		}
		
	}

}