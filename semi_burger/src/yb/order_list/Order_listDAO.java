package yb.order_list;

import java.sql.*;
import java.util.*;

public class Order_listDAO {
	
	public static final int ORDER_ERROR=-100;
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public Order_listDAO(){
		
	}
	
	/**Connection 가져오기*/
	public void getConn(){
		try {
			conn=yb.db.YB_DB.getConn();
		} catch (Exception e) {
			System.out.println("Connection failure");
		}
	}
	
	/**주문 추가시 중복되는 메뉴 번호 반환 메서드*/
	public int checkMenu(String menu_name,Order_listDTO odto){
		ArrayList<Order_listDTO> arr=odto.getOdtos();
		if(arr!=null){
			for(int i=0;i<arr.size();i++){
				Order_listDTO temp=arr.get(i);
				if(menu_name.equals(temp.getItem_name())){
					return i;
				}
			}
		}
			return -1;
	}
	
	/**고객 최종 주문 메서드*/
	public int orderMenu(Order_listDTO odto,String sid, String addr, Calendar c){
		try {
			getConn();
			
			int year=c.get(Calendar.YEAR);
			int month=c.get(Calendar.MONTH)+1;
			int date=c.get(Calendar.DATE);
			int hour=c.get(Calendar.HOUR_OF_DAY);
			int min=c.get(Calendar.MINUTE);
			int sec=c.get(Calendar.SECOND);
			String date_s=year+"-"+month+"-"+date+"-"+hour+"-"+min+"-"+sec;
			
			ArrayList<Order_listDTO> arr=odto.getOdtos();
			if(arr.size()<=0)return ORDER_ERROR;
			
			int count=0;
			for(int i=0;i<arr.size();i++){
				String sql="insert into order_list values(order_list_seq.nextval,?,?,to_date('"+date_s+"','yyyy-mm-dd-hh24-mi-ss'),?,?,?)";
				ps=conn.prepareStatement(sql);
				
				Order_listDTO temp=arr.get(i);
				String item_name=temp.getItem_name();
				int item_count=temp.getItem_count();
				String price=temp.getTotal_pay();//1개당 가격
				int total_price=Integer.parseInt(price)*item_count;
				String total_pay=Integer.toString(total_price);
				
				ps.setString(1, item_name);
				ps.setInt(2, item_count);
				ps.setString(3, addr);
				ps.setString(4, sid);
				ps.setString(5, total_pay);
				
				count+=ps.executeUpdate();
				
			}
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return ORDER_ERROR;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**날짜별 주문 갯수 조회 메서드*/
	public ArrayList<Integer> getOrderMenuNumber(String sid){
		try {
			getConn();
			String sql="";
			if(sid.equals("admin")){
				sql="select count(order_user) as menu_count from order_list group by order_date,order_user,order_shop order by order_date desc";
				ps=conn.prepareStatement(sql);
			}else{
				sql="select count(order_user) as menu_count from order_list where order_user=? group by order_date,order_user,order_shop order by order_date desc";
				ps=conn.prepareStatement(sql);
				ps.setString(1, sid);
			}
			rs=ps.executeQuery();
			
			ArrayList<Integer> arr=new ArrayList<Integer>();
			if(rs.next()){
				do{
					int temp=rs.getInt("menu_count");
					arr.add(temp);
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
	
	/**주문 조회*/
	public ArrayList<Order_listDTO> getOrderList(String sid){
		try {
			getConn();
			String sql="";
			if(sid.equals("admin")){
				sql="select a.*,to_char(a.order_date,'hh24:mi') as hm from (order_list)a order by order_date desc,order_user,order_no";
				ps=conn.prepareStatement(sql);	
			}else{
				sql="select a.*,to_char(a.order_date,'hh24:mi') as hm from (order_list)a where order_user=? order by order_date desc,order_no";
				ps=conn.prepareStatement(sql);	
				ps.setString(1, sid);
			}
			
			rs=ps.executeQuery();
			
			ArrayList<Order_listDTO> odtos=new ArrayList<Order_listDTO>();
			if(rs.next()){
				do{
					int order_no=rs.getInt("order_no");
					String item_name=rs.getString("item_name");
					int item_count=rs.getInt("item_count");
					String order_place=rs.getString("order_shop");//주문자 주소
					String total_pay=rs.getString("total_pay");
					java.sql.Date date=rs.getDate("order_date");
					String hm=rs.getString("hm");
					
					Order_listDTO temp=new Order_listDTO(item_name, item_count, date, order_place, sid, total_pay);
					temp.setOrder_no(order_no);
					temp.setDate_hm(hm);
					odtos.add(temp);
				}while(rs.next());
			}
			
			return odtos;
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
