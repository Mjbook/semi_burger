<%@page import="org.omg.PortableInterceptor.USER_EXCEPTION"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.io.File, java.io.IOException, com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="bdto" class="board.knowhow.knowhowDTO" scope="page"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="board.knowhow.knowhowDAO" scope="session"/>
<jsp:useBean id="wf" class="board.knowhow.knowhow_upload" scope="session"/>


<%
	String savepath=wf.USERS_HOME+"/"+wf.getCrpath();
	String msg = "";
	int result = 0;
	String savepath_end="";
	int sizeLimit=1*1024*1024;    //1메가

		

try{
	
	//MultipartRequest mr=new MultipartRequest(request,savepath,1024*1024*10,"utf-8");
	 MultipartRequest multi=new MultipartRequest(request, savepath, sizeLimit, "utf-8" ,new DefaultFileRenamePolicy());
		%>
		<script>
alert(1);
</script>
	<%
	
	
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
			
			
			String name=files[i].getName();
			f=files[0];
			name=f.getName();
			int idx=name.lastIndexOf('.');
			int length=name.length();
			f.renameTo(new File(wf.USERS_HOME+"/"+name));
			
			
			result=bdao.knowhowWrite(bdto);
			msg =result>0?"작성완료!":"작성실패!";
			
		}
	}
}catch(Exception e){
	%>
	<script>
		window.alert('업로드 실패!');
		window.self.close();
	</script>
<%
	msg =result>0?"작성완료!":"작성실패!";
}
%>

<script>
window.alert('<%=msg %>');
location.href='knowhowList.jsp';
</script>