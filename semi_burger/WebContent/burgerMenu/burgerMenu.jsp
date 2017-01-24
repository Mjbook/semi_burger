<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="yb.burger.*" %>
<%@ page import="yb.order_list.*" %>
<jsp:useBean id="burgerdto" class="yb.burger.BurgerDTO"/>
<jsp:setProperty property="*" name="burgerdto"/>
<jsp:useBean id="burgerdao" class="yb.burger.BurgerDAO"/>
<jsp:useBean id="odao" class="yb.order_list.Order_listDAO"/>
<jsp:useBean id="odto" class="yb.order_list.Order_listDTO" scope="session"/>

<%

ArrayList<BurgerDTO> al=burgerdao.burgerMenu(burgerdto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
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
function burger_up(){
	window.open("burger_up.jsp","burger_up","top=300,left=400,width=350,height=250");
}
function burger_reload(){
	window.open("burger_reload.jsp","burger_reload","top=300,left=400,width=350,height=250");
}
function burger_delete(){
	window.open("burger_delete.jsp","burger_delete","top=300,left=400,width=350,height=250");
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
	ArrayList<BurgerDTO> arr_bdto=burgerdao.burgerMenu(burgerdto);
	
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
		no=document.burgerMenu.m<%=i%>.value;
		if(no<=0){
			window.alert('주문 수량을 다시 확인해 주세요.');
			return;
		}
		document.burgerMenu.m<%=i%>_check.value="true";
		document.burgerMenu.submit();
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
		document.burgerMenu.m<%=i%>.value=<%=num_s%>;
		</script>	
	<%
	}
	if(select_menu!=null&&select_menu.equals("true")){
		burgerdto=arr_bdto.get(i);
		String name=burgerdto.getItem_name();
		int num=Integer.parseInt(num_s);
		String price=burgerdto.getItem_pay();
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
<%@include file="../header.jsp" %>
<section>
	<article>
	<h2>햄버거 메뉴</h2>
		<form name="burgerMenu">
			<table border="1">
				<tr>
				<%
				for(int i=0;i<al.size();i++){
					if(i%2==0&&i!=al.size()&&i!=0){
					%>
						</tr><tr>
					<%
					}
					%>
					<th><img src="burger_img/<%=al.get(i).getItem_img_src()%>" width="300" height="260"></th>
					<td align="center" width="300" height="260">
					<%=al.get(i).getItem_name()%>
					<br><br><br>
					<%=al.get(i).getItem_pay()+"원" %>
					<br><br><br>
					
					<select name="m<%=i %>">
					<%
						for(int j=0;j<=100;j++){
							%>

							<option value="<%=j%>"><%=j %></option>
							<%
						}
					%>
					</select>
					<input type="hidden" name="m<%=i %>_check" value="false">
					<input type="button" value="담기" onclick="javascript:add<%=i%>(<%=i%>)">
					</td>
				<%
				}
				%>
				
				<%
				if(session.getAttribute("sid")!=null){
				String sid=(String)session.getAttribute("sid");
				
				if(sid.equals("admin")){
					%>
					<tr>
					<td colspan="4" align="right" width="600">
					<input type="button" value="메뉴등록" onclick="burger_up()">
					<input type="button" value="메뉴수정" onclick="burger_reload()">
					<input type="button" value="메뉴삭제" onclick="burger_delete()">
					</td>
					</tr>
					<% 
				}
					
				}
				 %>
			</table>
		</form>
		</article>
		<article>
		<form name="orderlist" action="/order/orderList_ok.jsp">
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
		<hr>
		<h2 id="side">사이드 메뉴</h2>
<%@include file="/sideMenu/sideMenu.jsp" %>	
</section>
<hr>
<%@include file="../footer.jsp" %>
</body>
</html>