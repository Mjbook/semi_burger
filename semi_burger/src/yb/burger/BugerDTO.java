package yb.burger;
import java.util.*;
public class BugerDTO {
	
	private int item_key;
	private int item_num;
	private String item_name;
	private String item_pay;
	private int item_count;
	private Date item_event_start;
	private Date item_event_finish;
	private String item_img_src;
	
	public BugerDTO() {
		System.out.println("burgerDTO »ı¼º");
	}

	public BugerDTO(int item_key, int item_num, String item_name, String item_pay, int item_count,
		Date item_event_start, Date item_event_finish, String item_img_src) {
		super();
		this.item_key = item_key;
		this.item_num = item_num;
		this.item_name = item_name;
		this.item_pay = item_pay;
		this.item_count = item_count;
		this.item_event_start = item_event_start;
		this.item_event_finish = item_event_finish;
		this.item_img_src = item_img_src;
	}



	public int getItem_key() {
		return item_key;
	}

	public void setItem_key(int item_key) {
		this.item_key = item_key;
	}

	public int getItem_num() {
		return item_num;
	}

	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_pay() {
		return item_pay;
	}

	public void setItem_pay(String item_pay) {
		this.item_pay = item_pay;
	}

	public int getItem_count() {
		return item_count;
	}

	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}

	public Date getItem_event_start() {
		return item_event_start;
	}

	public void setItem_event_start(Date item_event_start) {
		this.item_event_start = item_event_start;
	}

	public Date getItem_event_finish() {
		return item_event_finish;
	}

	public void setItem_event_finish(Date item_event_finish) {
		this.item_event_finish = item_event_finish;
	}

	public String getItem_img_src() {
		return item_img_src;
	}

	public void setItem_img_src(String item_img_src) {
		this.item_img_src = item_img_src;
	}
	
	
}
