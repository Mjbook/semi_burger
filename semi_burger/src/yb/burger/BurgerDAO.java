package yb.burger;
import java.util.*;
import java.util.Date;
import java.sql.*;
public class BurgerDAO {
	
	private ResultSet rs;
	private PreparedStatement ps;
	private Connection conn;
	
	public BurgerDAO() {
		System.out.println("burgerDAO");
	}
	
	/**버거메뉴 메서드*/
	public ArrayList<BurgerDTO> burgerMenu(BurgerDTO bdto){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="select * from burger";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<BurgerDTO> al=new ArrayList<BurgerDTO>();
			
			while(rs.next()){
				int item_key=rs.getInt("item_key");
				int item_num=rs.getInt("item_num");
				String item_name=rs.getString("item_name");
				String item_pay=rs.getString("item_pay");
				int item_count=rs.getInt("item_count");
				Date item_event_start=rs.getDate("item_event_start");
				Date item_event_finish=rs.getDate("item_event_finish");
				String item_img_src=rs.getString("item_img_src");
				
				BurgerDTO burgerdto= new BurgerDTO(item_key, item_num, item_name, item_pay, item_count, item_event_start, item_event_finish, item_img_src);
				al.add(burgerdto);
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
	
	/**버거등록 메서드*/
	public int burgerUPLoad(String item_name,String item_pay,int item_count,Date item_event_finish,String item_img_src){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="insert into burger values(burger_shop_seq.nextval,?,?,?,?,sysdate,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, "item_num");
			ps.setString(2, item_name);
			ps.setString(3, item_pay);
			ps.setInt(4, item_count);
			java.sql.Date item_event_finish = ps.setDate(5,item_event_finish);
		}catch(Exception e){
			
		}finally{
			try{
				
			}catch(Exception e2){
				
			}
		}
	}
	
	
}



