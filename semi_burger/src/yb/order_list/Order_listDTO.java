package yb.order_list;
import java.sql.*;
import java.util.*;
public class Order_listDTO {
	
	private int order_no;
	private int order_group;//db에는 없는 변수
	private String item_name;
	private int item_count;
	private java.sql.Date order_date;
	private String order_shop;
	private String order_user;
	private String total_pay;
	private ArrayList<Order_listDTO> odtos;//db에는 없는 변수
	 
	public Order_listDTO(){
		odtos=new ArrayList<Order_listDTO>();
	}
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	
	public int getOrder_group() {
		return order_group;
	}

	public void setOrder_group(int order_group) {
		this.order_group = order_group;
	}

	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public java.sql.Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(java.sql.Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_shop() {
		return order_shop;
	}
	public void setOrder_shop(String order_shop) {
		this.order_shop = order_shop;
	}
	public String getOrder_user() {
		return order_user;
	}
	public void setOrder_user(String order_user) {
		this.order_user = order_user;
	}
	public String getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(String total_pay) {
		this.total_pay = total_pay;
	}

	public ArrayList<Order_listDTO> getOdtos() {
		return odtos;
	}

	public void addOdtos(Order_listDTO odto) {
		odtos.add(odto);
	}
	
}
