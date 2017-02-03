<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*"%>
<jsp:useBean id="burger_img" class="yb.burger.Side_upload" scope="session"/>
<jsp:useBean id="bdao" class="yb.burger.SideDAO"/>
<%

	String s=request.getParameter("sideitem_key");
	int sideitem_key = Integer.parseInt(s);
	
	String sideitem_name = request.getParameter("sideitem_name");
	String sideitem_pay = request.getParameter("sideitem_pay");
	
	String sideitem_count_s = request.getParameter("sideitem_count");
	int sideitem_count = Integer.parseInt(sideitem_count_s);
	
	String sideitem_img_src=request.getParameter("sideitem_img_src");
	
int result=bdao.sideReLoad(sideitem_key, sideitem_name, sideitem_pay, sideitem_count, sideitem_img_src);
String msg=result>0?"수정되었습니다.":"수정에 실패하였습니다.";
%>

<script>
window.alert('<%=msg%>');
opener.location.reload();
opener.location.href='burgerMenu.jsp';
window.self.close();
</script>

