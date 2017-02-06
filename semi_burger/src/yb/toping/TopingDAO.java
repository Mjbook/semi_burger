package yb.toping;

import java.sql.*;
import java.io.*;
import java.util.*;

public class TopingDAO {
	
	//img 저장할 경로
	public static final String TOPING_IMG="E:/semi_burger/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/semi_burger/self/toping_img";
	//"C:/Users/user1/git/semi_burger/semi_burger/WebContent/self/toping_img";
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TopingDAO() {

	}
	
	/**토핑 추가 step1 이름,가격 저장 메서드*/
	public int addToping(String name, String price){
		try {
			conn=yb.db.YB_DB.getConn();
			
			String sql="insert into toping values(toping_seq.nextval, 0,?,?,'show')";
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
			File makedir1=new File(TOPING_IMG);
			if(!makedir1.exists()){
				makedir1.createNewFile();
				System.out.println("경로생성");
			}
			File makedir2=new File(TOPING_IMG+"/temp");
			if(!makedir2.exists()){
				makedir2.createNewFile();
			}
			
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
				
				return name;
				
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
	
	/**토핑 보여주기 관련 메서드*/
	public int showToping(String name,String show){
		try {
			conn=yb.db.YB_DB.getConn();
			/*//파일 삭제
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
			ps.close();*/
			
			//db 변경
			
			String sql="update toping set show='"+show+"' where toping_name=?";
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
	
	/**토핑 옆 사진 저장,이름 바꾸기 메서드*/
	public void saveTopImg(){
		try {

			conn=yb.db.YB_DB.getConn();
			
			String sql="select max(toping_key) from toping";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			int maxidx=0;
			if(rs.next()){
				
				maxidx=rs.getInt("max(toping_key)");
				File f=new File(TOPING_IMG+"/temp");
				File temp[]=f.listFiles();
				
				if(temp.length>1){
					for(int i=0;i<temp.length;i++){
						File del=temp[i];
						del.delete();
					}
				}
	
				f=temp[0];
				String name=f.getName();
				int idx=name.lastIndexOf('.');
				int length=name.length();
				name="ts"+maxidx+name.substring(idx, length);
				name=name.toLowerCase();
				f.renameTo(new File(TOPING_IMG+"/"+name));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	/**토핑메뉴 가져오는 메서드*/
	public ArrayList<TopingDTO> getInfo(String show){
		try {
			String sql="";
			if(show.equals("show")){
				sql="select * from toping where show='show' order by toping_key";
			}else{
				sql="select * from toping where show!='show' order by toping_key";
			}
			
			conn=yb.db.YB_DB.getConn();
			
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<TopingDTO> arr=new ArrayList<TopingDTO>();
			if(rs.next()){
				do{
					int key=rs.getInt("toping_key");
					String dir=rs.getString("toping_img");
					String name=rs.getString("toping_name");
					String price=rs.getString("toping_price");
					TopingDTO tdto=new TopingDTO(key,dir,name,price);
					arr.add(tdto);
				}while(rs.next());
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**toping_key로 토핑 테이블 column가져오기 메서드*/
	public String getToping(String column,int toping_key){
		try {
			conn=yb.db.YB_DB.getConn();
			String sql="select "+column+" from toping where toping_key=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, toping_key);
	
			rs=ps.executeQuery();
			
			String toping="";
			if(rs.next()){
				toping=rs.getString(column);
			}
			
			return toping;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**토핑 메뉴 목록(key,String) 가져오기 메서드*/
	public HashMap<Integer, String> getTopings(){
		try {
			conn=yb.db.YB_DB.getConn();
			String sql="select * from toping";
			ps=conn.prepareStatement(sql);
			
			rs=ps.executeQuery();
			HashMap<Integer, String> hm=new HashMap<Integer,String>();
			if(rs.next()){
				do{
					int key=rs.getInt("toping_key");
					String name=rs.getString("toping_name");
					hm.put(key, name);
				}while(rs.next());
			}
			return hm;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
		
		
		
		
		
			
		
	}
}
