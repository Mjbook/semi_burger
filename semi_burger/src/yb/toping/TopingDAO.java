package yb.toping;

import java.sql.*;
import java.io.*;

public class TopingDAO {
	
	//img 저장할 경로
	public static final String TOPING_IMG="E:/semi_burger/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/semi_burger/self/toping_img";
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TopingDAO() {

	}
	
	/**토핑 추가 step1 이름,가격 저장 메서드*/
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
	
	/**마지막으로 저장한 파일 경로 찾는 메서드*/
	private String findDir(){
		try {
			conn=yb.db.YB_DB.getConn();
			
			String sql="select toping_key,toping_img from toping where toping_key=(select max(toping_key) from toping)";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			int maxidx=0;
			if(rs.next()){
				String name=rs.getString("toping_img");
			
				maxidx=rs.getInt("toping_key");
				File f=new File(TOPING_IMG+"/temp");
				File temp[]=f.listFiles();
				if(!(name.equals("0")))return null;
				if(temp.length>1){
					for(int i=0;i<temp.length;i++){
						File del=temp[i];
						del.delete();
					}
					return null;
				}
	
				f=temp[0];
				name=f.getName();
				int idx=name.lastIndexOf('.');
				int length=name.length();
				name=maxidx+name.substring(idx, length);
				f.renameTo(new File(TOPING_IMG+"/"+name));
				
				return TOPING_IMG+"/"+name;
				
			}else{
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {				
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) {}
		}
	}
	
	/**토핑 추가 step2 경로 저장 메서드*/
	public int addDir(){
		try {
			String dir=findDir();
			
			String sql="update toping set toping_img=? where toping_key=(select max(toping_key) from toping)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dir);
			
			int result=ps.executeUpdate();
			if(ps!=null)ps.close();
			
			delTrash();
			
			return result;
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
	
	/**토핑 오류 주소 db 삭제 메서드*/
	private void delTrash(){
		try {
			
			String sql="delete toping where toping_img='0'";
			ps=conn.prepareStatement(sql);
		
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	public int delToping(String name){
		try {
			//파일 삭제
			conn=yb.db.YB_DB.getConn();
			
			String sql="select toping_img from toping where toping_name=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			
			if(rs.next()){
				do{
					String dir=rs.getString("toping_img");
					File temp=new File(dir);
					temp.delete();

				}while(rs.next());
			}
			rs.close();
			ps.close();
			
			//db삭제
			
			sql="delete toping where toping_name=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
		
			int result=ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
}
