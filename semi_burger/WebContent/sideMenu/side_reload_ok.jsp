<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="org.omg.PortableInterceptor.USER_EXCEPTION"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="yb.burger.Burger_upload" scope="session"/>
<%
	String savepath=wf.USERS_HOME+"/"+wf.getCrpath();
	
	String savepath_end="";
try{
	MultipartRequest mr=new MultipartRequest(request,savepath,1024*1024*10,"utf-8", new DefaultFileRenamePolicy());
	
	File f=new File(wf.USERS_HOME+"/"+wf.getCrpath());
	File files[]=f.listFiles();
	
	if(files==null||files.length==0){
		
	}else{
		for(int i=0;i<files.length;i++){
			if(files.length>1){
				for(int j=0;j<files.length;j++){
					File del=files[j];
					del.delete();
				}
			}
			files[i].getName();
			savepath_end=files[i].getName();
			%>
			<script>
			
			location.href="side_reload_up.jsp?src=<%=savepath_end%>";
			
			</script>
			<%
			
			String name=files[i].getName();
			
			if(files.length>1){
				for(int j=0;j<files.length;j++){
					File del=files[j];
					del.delete();
				}
			}
			
			f=files[0];
			name=f.getName();
			int idx=name.lastIndexOf('.');
			int length=name.length();
			
			f.renameTo(new File(wf.USERS_HOME+"/"+name));
			
		}
	}
	
}catch(Exception e){
	%>
	<script>
		window.alert('업로드 실패!');
		window.self.close();
	</script>
	
	<%
}
	
%>




