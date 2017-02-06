<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="yb.order_list.*"%>
<!DOCTYPE html>
<jsp:useBean id="odto" class="yb.order_list.Order_listDTO" scope="session"/>
<jsp:useBean id="odao" class="yb.order_list.Order_listDAO"/>
<%
ArrayList<Order_listDTO> arr=odto.getOdtos();
String sid=(String)session.getAttribute("sid");
if(sid==null){
	sid="guest";
}
int result=0;
String addr=request.getParameter("addr");
Calendar c=Calendar.getInstance();
result=odao.orderMenu(odto, sid, addr,c);

%>
<%
if(result>0){
	odto.clearOdtos();
%>
	<script>
		window.alert('주문이 완료 되었습니다.');
		location.href="/semi_burger/index.jsp"
	</script>	
<%
}else{
%>
	<script>
		window.alert('오류 발생. 다시 시도해 주세요');
		location.href="/semi_burger/burgerMenu/burgerMenu.jsp"
	</script>	
<%
}
%>




