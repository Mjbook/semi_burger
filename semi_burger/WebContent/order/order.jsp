<%@page import="yb.burger.BurgerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.*" %>
<jsp:useBean id="bmdao" class="yb.burger.BurgerDAO"/>
<jsp:useBean id="bmdto" class="yb.burger.BurgerDTO"/>
<jsp:useBean id="odto" class="yb.order_list.Order_listDTO" scope="session"/>
<html>
<%	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("sid")==null){
%>
<script>
	window.alert('로그인 먼저 부탁드립니다.');
	location.href='/semi_burger/index.jsp';
</script>		
<%
	}
%>

<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css" >
<style>
#orderlist{
	position: fixed;
	top:200px;
	right:50px;
	width:250px;
}
</style>
<%
	ArrayList<BurgerDTO> arr=bmdao.burgerMenu(bmdto);
	String choice=request.getParameter("1");
	System.out.print(choice);
%>
<%
if(arr==null){
%>
<script>
	window.alert('메뉴 준비중');
	location.href='/semi_burger/index.jsp';
</script><%
	return;
}
for(int i=0;i<arr.size();i++){
%>
	<script>
	function add<%=i%>(menu){
		no=document.select.m<%=i%>.value;
		document.select.m<%=i%>.value=0;
		no=Math.trunc(no);
		if(no<=0){
			window.alert('주문 수량을 다시 확인해 주세요.');
			return;
		}
		location.href='/semi_burger/order/order.jsp?menu='+<%=i%>+'&no='+no;
	}
</script>
<%
}
%>

</head>
<body>

<%@include file="/header.jsp"%>
	<section>
		<article>
		<form name="select">
			<table>
		<%
			for(int i=0;i<arr.size();i++){
				bmdto=arr.get(i);
		%>	
				<tr>
					<td><%=bmdto.getItem_name()%></td>
					<td><%=bmdto.getItem_pay()+"원"%></td>
					<td><input name="m<%=i %>" type="number" min="0"></td>
					<td><input type="button" value="추가" onclick="add<%=i%>(<%=i%>)"></td>
				</tr>
			
		<%
			}
			
		%>
			</table>
		</form>
		</article>
		
		<article>
		<form name="order">
			<table id="orderlist">
				<thead>
				<tr>
					<th colspan="3"><%=session.getAttribute("sid")+"님의 주문서" %></th>
				</tr>
				</thead>
				
				<tfoot>
				<tr>
					<th>금액:</th>
					<td colspan="2">원</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="button" value="주문하기">
					</td>
				</tr>
				</tfoot>
				
				<tbody>
					<tr>
					</tr>
				</tbody>
			</table>
		</form>
		</article>
	</section>
<%@include file="/footer.jsp"%>
</body>
</html>