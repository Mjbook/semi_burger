package board.knowhow;

import java.io.File;
import java.util.Date;

public class knowhowDTO {
	
	public static final String USERS_HOME="E:/semi_burger/.metadata/.plugins/"
			+ "org.eclipse.wst.server.core/tmp0/wtpwebapps/semi_burger/knowhow_img";
	
	private String user;
	private String crpath;
	private int imgname;

	private int 	knowhow_no;
	private String  name;
	private String  subject;
	private String  content;
	private Date  insert_date;
	private int 	board_count;
	private String my_img_url;
	
	
	public int getKnowhow_no() {
		return knowhow_no;
	}
	public void setKnowhow_no(int knowhow_no) {
		this.knowhow_no = knowhow_no;
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
	public String getMy_img_url() {
		return my_img_url;
	}
	public void setMy_img_url(String my_img_url) {
		this.my_img_url = my_img_url;
	}
	
	/**getter and setter*/
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getCrpath() {
		return crpath;
	}
	public void setCrpath(String crpath) {
		this.crpath = crpath;
	}

	public int getImgname() {
		return imgname;
	}

	public void setImgname(int imgname) {
		this.imgname = imgname;
	}
	
	public void userFolderExists(){
		File f=new File(USERS_HOME+"/"+user);
		
		if(!f.exists()){//파일이 있냐?
			f.mkdir();//없으면 폴더를 만들어라
		}		
		
	}

	/**사용자가 가지고 있는 파일 및 폴더 확인*/
	public File[] getUsedList(){
		File f=new File(USERS_HOME+"/"+user);
		
		File files[]=f.listFiles();
		
		return files;
	}

	

	
	
}
