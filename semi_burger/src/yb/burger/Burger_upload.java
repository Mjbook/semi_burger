package yb.burger;
import java.io.*;
public class Burger_upload {
	
	public static final String USERS_HOME="/semi_burger/burger_img";
	
	private String user;
	private String crpath;
	private int imgname;

	public Burger_upload(){
		
	}
	
	public Burger_upload(String user, String crpath, int imgname) {
		super();
		this.user = user;
		this.crpath = crpath;
		this.imgname = imgname;
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
	
	
	
	

