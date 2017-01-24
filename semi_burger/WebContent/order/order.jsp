<%@page import="yb.burger.BurgerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.*" %>
<%@page import="yb.order_list.*" %>
<jsp:useBean id="bdao" class="yb.burger.BurgerDAO"/>
<jsp:useBean id="bdto" class="yb.burger.BurgerDTO"/>
<jsp:useBean id="odao" class="yb.order_list.Order_listDAO"/>
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
	text-align:center;
}
</style>
<script>
function resetMenu(){
	location.href="order.jsp?re=1"
}
</script>
<%	
if(request.getParameter("re")!=null){
	odto.clearOdtos();
}
if(request.getParameter("delorder")!=null){
	String temp_s=request.getParameter("delorder");
	int temp=Integer.parseInt(temp_s);
	odto.getOdtos().remove(temp);
}
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
	if(num_s!=null){
	%>
		<script>
		document.select.m<%=i%>.value=<%=num_s%>;
		</script>	
	<%
	}
	if(select_menu!=null&&select_menu.equals("true")){
		bdto=arr_bdto.get(i);
		String name=bdto.getItem_name();
		int num=Integer.parseInt(num_s);
		String price=bdto.getItem_pay();
		Order_listDTO temp=new Order_listDTO();
		temp.setItem_name(name);
		int check_menu=odao.checkMenu(name,odto);
		if(check_menu>=0){
			odto.getOdtos().get(check_menu).addItem_count(num);
		}else{
			temp.setItem_count(num);
			temp.setTotal_pay(price);
			odto.addOdtos(temp);
		}
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
		<form name="orderlist" action="orderList_ok.jsp">
			<table id="orderlist">
				<thead>
				<tr>
					<th colspan="4"><%=session.getAttribute("sid")+"님의 주문서" %></th>
				</tr>
				</thead>

				<tbody>
				<%
					ArrayList<Order_listDTO> arr_odto=odto.getOdtos();
					int total_price=0;
					if(arr_odto!=null&&(arr_odto.size()>0)){
						%>
						<tr>
						<td>메뉴</td>
						<td>수량</td>
						<td>합계</td>
						</tr>
						<%
						for(int i=0;i<arr_odto.size();i++){
							String menu=arr_odto.get(i).getItem_name();
							int num=arr_odto.get(i).getItem_count();
							String price=arr_odto.get(i).getTotal_pay();
							int order_price=Integer.parseInt(price)*num;
							total_price+=order_price;
							%> 
							<tr>
								<td><%=menu%></td>
								<td><%=num %></td>
								<td><%=order_price%></td>
								<td><a href="order.jsp?delorder=<%=i%>">취소</a></td>
							</tr>
							<%
						}
					}
				%>
				</tbody>
				
				<tfoot>
				<tr>
					<th colspan="3">금액:</th>
					<td><%=""+total_price%>원</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input type="submit" value="주문하기">
						<input type="button" value="다시 담기" onclick="javascript:resetMenu()">
					</td>
				</tr>
				</tfoot>
			</table>
		</form>
		</article>
	</section>
<%@include file="/footer.jsp"%>
<%
for(int i=0;i<arr_bdto.size();i++){
	String select_menu=request.getParameter("m"+i+"_check");
	String num_s=request.getParameter("m"+i);
	if(num_s!=null){
	%>
		<script>
		document.select.m<%=i%>.value=<%=num_s%>;
		</script>	
	<%
	}
	if(select_menu!=null&&select_menu.equals("true")){
	%>
		<script>
		document.select.m<%=i%>.value="0";
		</script>	
	<%
		
	}
}
%>
</body>
</html>