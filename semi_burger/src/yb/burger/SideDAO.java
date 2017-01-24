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
				int sideitem_key=rs.getInt("sideitem_key");
				int sideitem_num=rs.getInt("sideitem_num");
				String sideitem_name=rs.getString("sideitem_name");
				String sideitem_pay=rs.getString("sideitem_pay");
				int sideitem_count=rs.getInt("sideitem_count");
				Date sideitem_event_start=rs.getDate("sideitem_event_start");
				Date sideitem_event_finish=rs.getDate("sideitem_event_finish");
				String sideitem_img_src=rs.getString("sideitem_img_src");
				
				SideDTO sidedto= new SideDTO(sideitem_key, sideitem_num, sideitem_name, sideitem_pay, sideitem_count, sideitem_event_start, sideitem_event_finish, sideitem_img_src);
						
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
	public int sideUPLoad(int sideitem_num,String sideitem_name,String sideitem_pay,int sideitem_count,String sideitem_img_src){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="insert into side values(side_seq.nextval,?,?,?,?,sysdate,sysdate+14,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, sideitem_num);
			ps.setString(2, sideitem_name);
			ps.setString(3, sideitem_pay);
			ps.setInt(4, sideitem_count);
			ps.setString(5, sideitem_img_src);
			
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
	public int sideReLoad(int sideitem_num,String sideitem_name,String sideitem_pay,int sideitem_count,String sideitem_img_src){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="update side set sideitem_name=?,sideitem_pay=?,sideitem_count=?,sideitem_img_src=? where sideitem_num=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, sideitem_name);
			ps.setString(2, sideitem_pay);
			ps.setInt(3, sideitem_count);
			ps.setString(4, sideitem_img_src);
			ps.setInt(5, sideitem_num);
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
	public int sideDelete(int sideitem_num){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="delete from side where sideitem_num=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, sideitem_num);
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
