<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="yb.order_list.*" %>
<!DOCTYPE html>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<jsp:useBean id="odao" class="yb.order_list.Order_listDAO"/>
<jsp:useBean id="odto" class="yb.order_list.Order_listDTO" scope="session"/>

<%
String num_s=request.getParameter("item_count");
int num=0;
try{
	num=Integer.parseInt(num_s);
	if(num<1){
		Exception ex=new Exception();
		throw ex;
	}
}catch(Exception e){
	%>
	<script>
		window.alert('수량을 다시 입력해주세요.');
		location.href='selfBurger.jsp';
	</script>
	<%
	return;
}

String count=(String)session.getAttribute("toping_count");
int count_i=0;

if(count==null||count.equals("")){
%>
<script>
	window.alert('토핑을 선택해 주세요.');
	location.href='selfBurger.jsp';
</script><%
return;
}

count_i=Integer.parseInt(count);
String menu_name="signature";
int price=0;

for(int i=0;i<count_i;i++){
	//메뉴 이름 ex)signature.토핑idx.토핑idx.....
	String top=(String)session.getAttribute("t"+i);
	session.removeAttribute("t"+i);
	menu_name+="."+top;
	
	//가격 구하기
	int temp=Integer.parseInt(top);
	String tp_price=tdao.getToping("toping_price", temp);
	price+=Integer.parseInt(tp_price);
}
session.removeAttribute("toping_count");

Order_listDTO sig=new Order_listDTO();
sig.setItem_name(menu_name);
sig.setItem_count(num);
sig.setTotal_pay(Integer.toString(price));

odto.addOdtos(sig);

%>
<script>
	location.href='/semi_burger/self/selfburger.jsp';
</script>

