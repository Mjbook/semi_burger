package yb.order_list;
import java.sql.*;//DATE위해서 import함
import java.sql.Date;
import java.util.*;
public class Order_listDTO {
	
	private int order_no;
	private String item_name;
	private int item_count;
	private java.sql.Date order_date;
	private String date_hm;
	private String order_shop; //고객 주문 주소로 사용함
	private String order_user;
	private String total_pay;
	private ArrayList<Order_listDTO> odtos;//db에 없는 변수
	 
	public Order_listDTO(){
	}
	
	
	
	public Order_listDTO(String item_name, int item_count, Date order_date, String order_shop, String order_user,
			String total_pay) {
		super();
		this.item_name = item_name;
		this.item_count = item_count;
		this.order_date = order_date;
		this.order_shop = order_shop;
		this.order_user = order_user;
		this.total_pay = total_pay;
		odtos=new ArrayList<Order_listDTO>();
	}



	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
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
	public void addItem_count(int item_count) {
		this.item_count += item_count;
	}
	public java.sql.Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(java.sql.Date order_date) {
		this.order_date = order_date;
	}
	public String getDate_hm() {
		return date_hm;
	}
	public void setDate_hm(String date_hm) {
		this.date_hm = date_hm;
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
		if(odtos==null)odtos=new ArrayList<Order_listDTO>();
		odtos.add(odto);
	}
	
	public void clearOdtos(){
		this.odtos.clear();
	}
	
}
