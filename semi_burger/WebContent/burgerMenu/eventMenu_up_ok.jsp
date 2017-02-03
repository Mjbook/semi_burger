<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*"%>
<jsp:useBean id="burger_img" class="yb.burger.Burger_upload" scope="session"/>
<jsp:useBean id="bdao" class="yb.burger.BurgerDAO"/>
<%
	String item_name = request.getParameter("item_name");
	String item_pay = request.getParameter("item_pay");
	
	String item_count_s = request.getParameter("item_count");
	int item_count = Integer.parseInt(item_count_s);
	
	String item_img_src= request.getParameter("item_img_src");
	
int result=bdao.eventMenuUPLoad(item_name, item_pay, item_count, item_img_src);
String msg=result>0?"등록되었습니다.":"등록에 실패하였습니다.";
%>

<script>
window.alert('<%=msg%>');
window.self.close();
opener.opener.opener.location.reload();

</script>

