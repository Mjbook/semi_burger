package yb.order_list;

import java.sql.*;
import java.util.*;

public class Order_listDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public Order_listDAO(){
		
	}
	
	/**Connection �޼���*/
	public void getConn(){
		try {
			conn=yb.db.YB_DB.getConn();
		} catch (Exception e) {
			System.out.println("Connection failure");
		}
	}
	
	/**�ֹ��� �޴� ���� �߰��� �޴� �̸� Ȯ�� �޼���*/
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
	
	/**�� �ֹ� �Է� �޼���*/
	public void orderMenu(Order_listDTO odto){
		try {
			getConn();
			String sql="insert into order_list values(order_list_seq.nextval,?,?,sysdate,'����',?,?)";
			ps=conn.prepareStatement(sql);
			ps.set
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				
			} catch (Exception e2) {}
		}
	}
}
