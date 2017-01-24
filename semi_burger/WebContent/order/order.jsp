<%@page import="yb.burger.BurgerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.*" %>
<%@page import="yb.order_list.*" %>
<jsp:useBean id="bdao" class="yb.burger.BurgerDAO"/>
<jsp:useBean id="bdto" class="yb.burger.BurgerDTO"/>
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
	ArrayList<BurgerDTO> arr_bdto=bdao.burgerMenu(bdto);
	
%>
<%
if(arr_bdto==null){
%>
<script>
	window.alert('메뉴 준비중');
	location.href='/semi_burger/index.jsp';
</script><%
	return;
}
for(int i=0;i<arr_bdto.size();i++){
%>
<script>
	function add<%=i%>(menu){
		no=document.select.m<%=i%>.value;
		if(no<=0){
			window.alert('주문 수량을 다시 확인해 주세요.');
			return;
		}
		document.select.m<%=i%>_check.value="true";
		document.select.submit();
	}
</script>
<%
}
%>
<%
for(int i=0;i<arr_bdto.size();i++){
	String select_menu=request.getParameter("m"+i+"_check");
	String num_s=request.getParameter("m"+i);
	if(select_menu!=null&&select_menu.equals("true")){
		bdto=arr_bdto.get(i);
		String name=bdto.getItem_name();
		int num=Integer.parseInt(num_s);
		int price=Integer.parseInt(bdto.getItem_pay());
		int total=num*price;
		Order_listDTO temp=new Order_listDTO();
		temp.setItem_name(name);
		temp.setItem_count(num);
		temp.setTotal_pay(Integer.toString(total));
		odto.addOdtos(temp);
	}
	
}


%>
</head>
<body>

<%@include file="/header.jsp"%>
	<section>
		<article>
		<form name="select" action="order.jsp" method="post">
			<table>
		<%
			for(int i=0;i<arr_bdto.size();i++){
				bdto=arr_bdto.get(i);
		%>		<tr>
					<td><%=bdto.getItem_name()%></td>
					<td><%=bdto.getItem_pay()+"원"%></td>
					<td><select name="m<%=i %>">
					<%
						for(int j=0;j<=100;j++){
							%>
							<option value="<%=j%>"><%=j %></option>
							<%
						}
					%>
					</select></td>
					<td>
						<input type="hidden" name="m<%=i %>_check" value="false">
						<input type="button" value="추가" onclick="javascript:add<%=i%>(<%=i%>)">
					</td>
				</tr>
			
		<%
			}
			
		%>
			</table>
		</form>
		</article>
		
		<article>
		<form name="orderlist">
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
				<%
					ArrayList<Order_listDTO> arr_odto=odto.getOdtos();
					if(arr_odto!=null&&(arr_odto.size()>0)){
						for(int i=0;i<arr_odto.size();i++){	
						String menu=arr_odto.get(i).getItem_name();
						int num=arr_odto.get(i).getItem_count();
						String price=arr_odto.get(i).getTotal_pay();
						%> 
						<tr>
							<td><%=menu%></td>
							<td><%=num %></td>
							<td><%=price%></td>
						</tr>
						<%
						}
					}
				%>
				</tbody>
			</table>
		</form>
		</article>
	</section>
<%@include file="/footer.jsp"%>
</body>
</html>