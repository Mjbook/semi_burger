package yb.burger;

import java.util.*;

public class SideDTO {
	
	private int sideitem_key;
	private String sideitem_name;
	private String sideitem_pay;
	private int sideitem_count;
	private Date sideitem_event_start;
	private Date sideitem_event_finish;
	private String sideitem_img_src;
	
	public SideDTO() {
		
	}

	public SideDTO(int sideitem_key, String sideitem_name, String sideitem_pay, int sideitem_count,
			Date sideitem_event_start, Date sideitem_event_finish, String sideitem_img_src) {
		super();
		this.sideitem_key = sideitem_key;
		this.sideitem_name = sideitem_name;
		this.sideitem_pay = sideitem_pay;
		this.sideitem_count = sideitem_count;
		this.sideitem_event_start = sideitem_event_start;
		this.sideitem_event_finish = sideitem_event_finish;
		this.sideitem_img_src = sideitem_img_src;
	}

	public int getSideitem_key() {
		return sideitem_key;
	}

	public void setSideitem_key(int sideitem_key) {
		this.sideitem_key = sideitem_key;
	}

	public String getSideitem_name() {
		return sideitem_name;
	}

	public void setSideitem_name(String sideitem_name) {
		this.sideitem_name = sideitem_name;
	}

	public String getSideitem_pay() {
		return sideitem_pay;
	}

	public void setSideitem_pay(String sideitem_pay) {
		this.sideitem_pay = sideitem_pay;
	}

	public int getSideitem_count() {
		return sideitem_count;
	}

	public void setSideitem_count(int sideitem_count) {
		this.sideitem_count = sideitem_count;
	}

	public Date getSideitem_event_start() {
		return sideitem_event_start;
	}

	public void setSideitem_event_start(Date sideitem_event_start) {
		this.sideitem_event_start = sideitem_event_start;
	}

	public Date getSideitem_event_finish() {
		return sideitem_event_finish;
	}

	public void setSideitem_event_finish(Date sideitem_event_finish) {
		this.sideitem_event_finish = sideitem_event_finish;
	}

	public String getSideitem_img_src() {
		return sideitem_img_src;
	}

	public void setSideitem_img_src(String sideitem_img_src) {
		this.sideitem_img_src = sideitem_img_src;
	}

	
	
}
