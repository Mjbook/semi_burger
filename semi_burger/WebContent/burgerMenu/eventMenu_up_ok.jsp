<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*"%>
<jsp:useBean id="burger_img" class="yb.burger.Burger_upload" scope="session"/>
<jsp:useBean id="bdao" class="yb.burger.BurgerDAO"/>
<%
	String item_name = request.getParameter("item_name");

	String item_pays = request.getParameter("item_pay");
	int pay=Integer.parseInt(item_pays);
	double eventPay=pay*0.85;
	int item_payss=(int)eventPay;
	String item_pay=Integer.toString(item_payss);
	
	String item_count_s = request.getParameter("item_count");
	int item_count = Integer.parseInt(item_count_s);
	
	String item_img_src= request.getParameter("item_img_src");
	
int result=bdao.eventMenuUPLoad(item_name, item_pay, item_count, item_img_src);
String msg=result>0?"등록되었습니다.":"등록에 실패하였습니다.";
%>
<input type="hidden" name="item_pays" value="<%=item_pays%>">
<script>
window.alert('<%=msg%>');
opener.location.reload();
opener.location.href='eventMenu.jsp?item_pays=<%=item_pays%>';
window.self.close();
</script>

