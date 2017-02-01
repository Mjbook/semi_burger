<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String item_num = request.getParameter("item_num");
	String item_name = request.getParameter("item_name");
	String item_pay = request.getParameter("item_pay");
	String item_count = request.getParameter("item_count");
%>
<script>
	window.close();
	window.open("burger_up_img.jsp?'item_num=<%=item_num%>,item_name=<%=item_name%>,item_pay=<%=item_pay%>,item_count=<%=item_count%>","burger_up_img","top=300,left=400,width=350,height=250");
</script>
<%
	
%>




