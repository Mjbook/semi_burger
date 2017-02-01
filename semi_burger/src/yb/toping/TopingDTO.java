package yb.toping;

public class TopingDTO {
	private int toping_key;
	private String toping_img;
	private String toping_name;
	private String toping_price;
	
	public TopingDTO() {

	}
	
	public TopingDTO(String toping_name, String toping_price) {
		this.toping_name=toping_name;
		this.toping_price=toping_price;
	}

	public int getToping_key() {
		return toping_key;
	}

	public void setToping_key(int toping_key) {
		this.toping_key = toping_key;
	}

	public String getToping_img() {
		return toping_img;
	}

	public void setToping_img(String toping_img) {
		this.toping_img = toping_img;
	}

	public String getToping_name() {
		return toping_name;
	}

	public void setToping_name(String toping_name) {
		this.toping_name = toping_name;
	}

	public String getToping_price() {
		return toping_price;
	}

	public void setToping_price(String toping_price) {
		this.toping_price = toping_price;
	}
	
	
	
	
}
