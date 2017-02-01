package board.img;

import java.util.Date;

public class imgDTO {

	private int 	img_board_no;
	private String  name;
	private String  subject;
	private String  content;
	private Date  insert_date;
	private int 	board_count;
	private String img_src;
	
	
	
	public int getImg_board_no() {
		return img_board_no;
	}
	public void setImg_board_no(int img_board_no) {
		this.img_board_no = img_board_no;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}

	
	
	
	
}
