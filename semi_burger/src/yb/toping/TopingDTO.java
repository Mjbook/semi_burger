package yb.toping;

public class TopingDTO {
	private int toping_key;
	private int toping_num;
	private String toping_name;
	private String toping_pay;
	
	public TopingDTO() {

	}
	
	public TopingDTO(int toping_num,String toping_name) {
		this.toping_num=toping_num;
		this.toping_name=toping_name;
	}

	public int getToping_key() {
		return toping_key;
	}

	public void setToping_key(int toping_key) {
		this.toping_key = toping_key;
	}

	public int getToping_num() {
		return toping_num;
	}

	public void setToping_num(int toping_num) {
		this.toping_num = toping_num;
	}

	public String getToping_name() {
		return toping_name;
	}

	public void setToping_name(String toping_name) {
		this.toping_name = toping_name;
	}

	public String getToping_pay() {
		return toping_pay;
	}

	public void setToping_pay(String toping_pay) {
		this.toping_pay = toping_pay;
	}
	
	
}
