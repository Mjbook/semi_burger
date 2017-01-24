package yb.burger;

public class Side_upload {
	public static final String USERS_HOME="E:/semi_burger/.metadata/.plugins/"
			+ "org.eclipse.wst.server.core/tmp0/wtpwebapps/semi_burger/side_img";
	
	private String user;
	private String crpath;
	private int imgname;
	
	public Side_upload() {
		
	}

	public Side_upload(String user, String crpath, int imgname) {
		super();
		this.user = user;
		this.crpath = crpath;
		this.imgname = imgname;
	}

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
	
	
	
	
}
