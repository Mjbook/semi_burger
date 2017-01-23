<%@page import="yb.burger.BurgerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.*" %>
<jsp:useBean id="bmdao" class="yb.burger.BurgerDAO"/>
<jsp:useBean id="bmdto" class="yb.burger.BurgerDTO"/>
<html>
<%
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
</head>
<body>
<%
	ArrayList<BurgerDTO> arr=bmdao.burgerMenu(bmdto);
%>
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
					<td><input type="number" min="0"></td>
					<td><input type="button" value="추가" onclick="addMenu()"></td>
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
					<th colspan="3"><%=session.getAttribute("sid")+"님 주문서" %></th>
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
				
				</tbody>
			</table>
		</form>
		</article>
	</section>
<%@include file="/footer.jsp"%>
</body>
</html>