package yb.burger;
import java.util.*;
import java.util.Date;
import java.sql.*;

public class SideDAO {
	private ResultSet rs;
	private PreparedStatement ps;
	private Connection conn;
	
	public SideDAO() {
		System.out.println("SideDAO");
	}
	
	/**메뉴 출력관련 메서드*/
	public ArrayList<SideDTO> SideMenu(SideDTO sdto){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="select * from side";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<SideDTO> al=new ArrayList<SideDTO>();
			
			while(rs.next()){
				int item_key=rs.getInt("item_key");
				int item_num=rs.getInt("item_num");
				String item_name=rs.getString("item_name");
				String item_pay=rs.getString("item_pay");
				int item_count=rs.getInt("item_count");
				Date item_event_start=rs.getDate("item_event_start");
				Date item_event_finish=rs.getDate("item_event_finish");
				String item_img_src=rs.getString("item_img_src");
				
				SideDTO sidedto= new SideDTO(item_key, item_num, item_name, item_pay, item_count, item_event_start, item_event_finish, item_img_src);
				al.add(sidedto);
			}	
			return al;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){

			}
		}
	}
	
	/**메뉴등록관련 메서드*/
	public int sideUPLoad(int item_num,String item_name,String item_pay,int item_count,String item_img_src){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="insert into side values(side_seq.nextval,?,?,?,?,sysdate,sysdate+14,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, item_num);
			ps.setString(2, item_name);
			ps.setString(3, item_pay);
			ps.setInt(4, item_count);
			ps.setString(5, item_img_src);
			
			int count=ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				
			}
		}
	}
	
	/**메뉴수정 메서드*/
	public int sideReLoad(int item_num,String item_name,String item_pay,int item_count,String item_img_src){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="update side set item_name=?,item_pay=?,item_count=?,item_img_src=? where item_num=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, item_name);
			ps.setString(2, item_pay);
			ps.setInt(3, item_count);
			ps.setString(4, item_img_src);
			ps.setInt(5, item_num);
			int count=ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				
			}
		}
	}
	
	/**메뉴삭제 메서드*/
	public int sideDelete(int item_num){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="delete from side where item_num=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, item_num);
			int count=ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				
			}
		}
	}
	
	
	
}
