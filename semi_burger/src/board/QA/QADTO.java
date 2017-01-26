package board.QA;

import java.sql.*;

public class QADTO {
	
	private int qna_no;
	private String name;
	private String subject;
	private String content;
	private Date insert_date;
	private int board_count;
	private int ref;
	private int lev;
	private int sunbun;
	private String pwd;
	
	
	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	
	public QADTO() {
	}

	public QADTO(int qna_no, String name, String subject, String content, Date insert_date, int board_count, int ref,
			int lev, int sunbun) {
		super();
		this.qna_no = qna_no;
		this.name = name;
		this.subject = subject;
		this.content = content;
		this.insert_date = insert_date;
		this.board_count = board_count;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}
	
	
	
	
	

}
