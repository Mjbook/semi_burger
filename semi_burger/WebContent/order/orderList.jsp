<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="burgerdto" class="yb.burger.BurgerDTO"/>
<jsp:useBean id="burgerdao" class="yb.burger.BurgerDAO"/>
<jsp:useBean id="odao" class="yb.order_list.Order_listDAO"/>
<jsp:useBean id="odto" class="yb.order_list.Order_listDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css" >
</head>
<%
	String sid=(String)session.getAttribute("sid");
	String addr="";
	if(sid!=null){
		
	}
%>
<body>
<%@include file="/header.jsp"%>
	<section>
		<article>
			<table>
				<thead>
					<tr>
						<th>배달 수령 주소</th>
						<td colspan="3"></td>
					</tr>
					<tr>
						<th>메뉴</th>
						<th>수량</th>
						<th>매장</th>
						<th>주문 일시</th>
					</tr>
				</thead>
			</table>
		</article>
	</section>
<%@include file="/footer.jsp"%>
</body>
</html>