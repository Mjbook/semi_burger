<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="yb.burger.*" %>
<%@ page import="yb.order_list.*"  %>
<jsp:useBean id="burgerdto" class="yb.burger.BurgerDTO"/>
<jsp:setProperty property="*" name="burgerdto"/>
<jsp:useBean id="burgerdao" class="yb.burger.BurgerDAO"/>
<jsp:useBean id="odao" class="yb.order_list.Order_listDAO"/>
<jsp:useBean id="odto" class="yb.order_list.Order_listDTO" scope="session"/>
<jsp:useBean id="sidedto" class="yb.burger.SideDTO"/>
<jsp:setProperty property="*" name="sidedto"/>
<jsp:useBean id="sidedao" class="yb.burger.SideDAO"/>


<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<script>
function eventMenu_up(){
	window.open("eventMenu_img_up.jsp","eventMenu_up","top=300,left=400,width=350,height=250");
}
function eventMenu_reload(){
	window.open("eventMenu_reload_img.jsp","eventMenu_reload_img","top=300,left=400,width=350,height=250");
}
function eventMenu_delete(){
	window.open("eventMenu_delete.jsp","eventMenu_delete","top=300,left=400,width=350,height=250");
}
</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
ArrayList<BurgerDTO> al=burgerdao.eventMenu(burgerdto);
String sid=(String)session.getAttribute("sid");

%>
<%@include file="../header.jsp" %>

<section>
	<h2>이벤트 메뉴</h2>
		<form name="eventMenu" method="post">
			<table border="0" cellspacing="0">
				<tr>
				<%
				for(int i=0;i<al.size();i++){
					if(i%2==0&&i!=al.size()&&i!=0){
					%>
						</tr><tr>
					<%
					}
					%>
					<th><img src="../burger_img/<%=al.get(i).getItem_img_src()%>" width="300" height="260"></th>
					<td align="center" width="200" height="260">
					<%
					if(sid!=null){
					if(sid.equals("admin")){
						%>
						<span style="font-style: italic; color:red;">Key : <%=al.get(i).getItem_key() %></span>
						<br><br><br>
						<% 
					}	
					}
					 %>
					<span style="font-size:20px ; color:gray;"><b><%=al.get(i).getItem_name()%></b></span>
					<br><br><br>
					
					<span style="text-decoration: line-through; color: red;">
					<%	
					int epay=Integer.parseInt(al.get(i).getItem_pay());
					double pay=epay/0.85;
					int epays=(int)pay;
					%>
					<b><%=epays %>원</b>
					</span>		
					<br>
					<span style="font-size:15px ; color:black;"><b><%=	al.get(i).getItem_pay()%>원</b></span>
					</td>
					
				<%
				}
				%>
				
				<%
				
				if(sid!=null){
					if(sid.equals("admin")){
						%>
						<tr>
						<td colspan="4" align="right" width="600">
						<input type="button" value="메뉴등록" onclick="eventMenu_up()">
						<input type="button" value="메뉴수정" onclick="eventMenu_reload()">
						<input type="button" value="메뉴삭제" onclick="eventMenu_delete()">
						</td>
						</tr>
						<% 
					}	
				}
				 %>
				 
			</table>
			<hr>
		</form>
</section>

<%@include file="../footer.jsp" %>
</body>
</html>