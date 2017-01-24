<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="yb.burger.*" %>
<jsp:useBean id="burgerdto" class="yb.burger.BurgerDTO"/>
<jsp:setProperty property="*" name="burgerdto"/>
<jsp:useBean id="burgerdao" class="yb.burger.BurgerDAO"/>

<%
ArrayList<BurgerDTO> al=burgerdao.burgerMenu(burgerdto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<script>
function burger_up(){
	window.open("burger_up.jsp","burger_up","top=300,left=400,width=350,height=250");
}
</script>

</head>
<body>
<%@include file="header.jsp" %>
<section>
	<article>
		<form name="burgerMenu">
			<table border="1" width="300" height="250" >
				<tr>
				<%
				for(int i=1;i<al.size();i++){
					%>
					<th><img src="burger_img/<%=al.get(i).getItem_img_src()%>" width="300" height="260"></th>
					<td width="300" height="260">
					<%=al.get(i).getItem_name()%>
					<br><br>
					<%=al.get(i).getItem_pay() %>
					<br><br><br>
					<input type="button" name="order" value="주문하기">
					</td>
					
					<%
					if(i%4==0&&i!=al.size()){
					%>
					</tr><tr>
					<%
					}
				}
				%>
				<input type="button" value="메뉴등록" onclick="burger_up()">
			</table>
		</form>
	</article>
</section>
<hr>
<%@include file="footer.jsp" %>
</body>
</html>