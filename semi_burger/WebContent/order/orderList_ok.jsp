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
	sid="guest_";
}
int result=0;
for(int i=0;i<arr.size();i++){
	Order_listDTO temp=arr.get(i);
	result=odao.orderMenu(temp, sid, request.getParameter("addr"));
}
%>
<%
if(result>0){
	odto.clearOdtos();
%>
	<script>
		window.alert('주문이 완료 되었습니다.');
		location.href="/semi_burger/order/orderCheck.jsp"
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




