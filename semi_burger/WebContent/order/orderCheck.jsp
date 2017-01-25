<%@page import="yb.order_list.Order_listDTO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="yb.order_list.Order_listDAO"/>
<jsp:useBean id="odto" class="yb.order_list.Order_listDTO" scope="session"/>
<!DOCTYPE html>
<html>
<%
	String sid=(String)session.getAttribute("sid");
	if(sid==null||sid.equals("")){
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
</head>
<body>
<%@include file="/header.jsp"%>
	<section>
		<article>
			<table>
				<tbody>
					<tr>
						<th>주문 번호</th>
						<th>메뉴</th>
						<th>주문 수량</th>
						<th>메뉴 가격</th>
						<th>주문 일시</th>
					</tr>
					<%
					ArrayList<Order_listDTO> arr_odto=odao.getOrderList(sid);
					int total_price=0;
					for(int i=0;i<arr_odto.size();i++){
						Order_listDTO temp=arr_odto.get(i);
						
						String menu=temp.getItem_name();
						int num=temp.getItem_count();
						String price=temp.getTotal_pay();
						java.sql.Date date=temp.getOrder_date();
						int m=date.getMonth()+1;
						int d=date.getDate();
						int h=date.getHours();
					%>
					<tr>
						<th>주문번호</th>
						<th><%=menu %></th>
						<th><%=num %></th>
						<th><%=price %></th>
						<th><%=m+"-"+d+"\n"+h+"시"%></th>
					</tr>
					
					<%		
					}
					
					%>
				</tbody>
			</table>
		</article>
	</section>
<%@include file="/footer.jsp"%>
</body>
</html>