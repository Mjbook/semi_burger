<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<jsp:useBean id="tdto" class="yb.toping.TopingDTO" scope="session"/>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<%
String savepath=tdao.TOPING_IMG+"/temp";
File makedir=new File(savepath);
if(!makedir.exists()){
	makedir.mkdirs();
	System.out.println("경로생성");
}

try{
	MultipartRequest mr=
			new MultipartRequest(request,savepath,1024*1024*30,"utf-8");
	
	tdto.setToping_name("");
	tdto.setToping_price("");
	
	int result=tdao.addDir();
	
	if(result>0){
		%>
		<script>
		location.href="addTopingSide_img.jsp"
		</script>
		<%
	}
}catch(Exception e){
	e.printStackTrace();
	%>
	<script>
	window.alert('업로드 실패!');
	location.href='addToping.jsp';
	</script>
	<%
}

%>