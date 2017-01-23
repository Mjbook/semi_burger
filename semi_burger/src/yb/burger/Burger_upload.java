package yb.burger;
import java.io.*;
public class Burger_upload {
	
	public static final String USERS_HOME="E:/semi_burger/.metadata/.plugins/"
			+ "org.eclipse.wst.server.core/tmp0/wtpwebapps/semi_burger/burger_img";
	
	private String user;
	private String crpath;
	private int totalsize,usedsize,freesize;
			
	private String fileName;
	private String fileGroup;
	
	/**珥앹슜�웾 �꽕�젙*/
	public Burger_upload(){
		totalsize=1024*1024*10;//10MB
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
	public int getTotalsize() {
		return totalsize;
	}
	public void setTotalsize(int totalsize) {
		this.totalsize = totalsize;
	}
	public int getUsedsize() {
		return usedsize;
	}
	public void setUsedsize(int usedsize) {
		this.usedsize = usedsize;
	}
	public int getFreesize() {
		return freesize;
	}
	public void setFreesize(int freesize) {
		this.freesize = freesize;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileGroup() {
		return fileGroup;
	}
	public void setFileGroup(String fileGroup) {
		this.fileGroup = fileGroup;
	}

	/**�궗�슜�옄�쓽 怨듦컙�씠 �엳�뒗吏� �솗�씤*/
	public void userFolderExists(){
		File f=new File(USERS_HOME+"/"+user);
		
		if(!f.exists()){//�뙆�씪�씠 �엳�깘?
			f.mkdir();//�뾾�쑝硫� �뤃�뜑瑜� 留뚮뱾�뼱�씪
		}
		usedsize=0; //珥덇린�깮�꽦�떆 �궗�슜�웾
		settingUsedSize(f);//�궗�슜�옄媛� �벖 �슜�웾�씠 �뼹留덈굹 �릺�뒗吏�
		freesize=totalsize-usedsize;//�궓���궗�슜�웾=珥앹궗�슜�웾-�궗�슜�웾
		
		
	}
	
	/**�궗�슜�옄媛� �궗�슜�븳 怨듦컙�씠 �뼹留덈굹 �릺�뒗吏�*/
	public void settingUsedSize(File f){
		File files[]=f.listFiles();
		if(files!=null){
			for(int i=0;i<files.length;i++){
				if(files[i].isFile()){
					usedsize+=files[i].length();
				}else{
					settingUsedSize(files[i]);
				}
			}
		}
	}
	
	
	public File[] getUsedList(){
		File f=new File(USERS_HOME+"/"+user);
		
		File files[]=f.listFiles();
		
		return files;
		}
	
	

	
	
	
	
}
	
	
	
	

