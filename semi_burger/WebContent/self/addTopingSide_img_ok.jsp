<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*"%>
<!DOCTYPE html>
<jsp:useBean id="tdto" class="yb.toping.TopingDTO" scope="session"/>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<jsp:useBean id="odao" class="yb.order_list.Order_listDAO"/>
<%
request.setCharacterEncoding("utf-8");
String savepath=tdao.TOPING_IMG+"/temp";
try{
	MultipartRequest mr=
			new MultipartRequest(request,savepath,1024*1024*10,"utf-8");
	
	tdao.saveTopImg();
	%>
	<script>
		window.alert('업로드 성공!');
		window.opener.location.reload();
		window.self.close();
	</script>
	<%
}catch(Exception e){
	e.printStackTrace();
	%>
	<script>
	window.alert('토핑 옆 사진 업로드 실패!');
	location.href='addTopingSide_img.jsp';
	</script>
	<%
}

%>
