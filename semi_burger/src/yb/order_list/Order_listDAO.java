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
	public int orderMenu(Order_listDTO odto,String sid){
		try {
			getConn();
			ArrayList<Order_listDTO> arr=odto.getOdtos();
			
			String sql="insert into order_list values(order_list_seq.nextval,?,?,sysdate,?,?,?)";
			ps=conn.prepareStatement(sql);
			
			if(arr.size()<=0)return ORDER_ERROR;
			int count=0;
			for(int i=0;i<arr.size();i++){
				Order_listDTO temp=arr.get(i);
				
				String item_name=temp.getItem_name();
				int item_count=temp.getItem_count();
				String price=temp.getTotal_pay();//1개당 가격
				int total_price=Integer.parseInt(price)*item_count;
				String total_pay=Integer.toString(total_price);
				
				ps.setString(1, item_name);
				ps.setInt(2, item_count);
				ps.setString(3, "본점");
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
				
			} catch (Exception e2) {}
		}
	}
}
