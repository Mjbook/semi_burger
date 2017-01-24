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
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<script>
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

</head>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<form name="burgerMenu">
			<table border="1">
				<tr>
				<%
				for(int i=1;i<al.size();i++){
					%>
					<th><img src="burger_img/<%=al.get(i).getItem_img_src()%>" width="300" height="260"></th>
					<td align="center" width="300" height="260">
					<%=al.get(i).getItem_name()%>
					<br><br><br>
					<%=al.get(i).getItem_pay()+"원" %>
					<br><br><br>
					<input type="button" name="orderMenu" value="주문하기">
					<input type="button" name="savaMenu" value="담기">
					</td>
					
					<%
					if(i%2==0&&i!=al.size()){
					%>
					</tr><tr>
					<%
					}
				}
				%>
				<tr>
				<td colspan="4" align="right" width="600">
				<input type="button" value="메뉴등록" onclick="burger_up()">
				<input type="button" value="메뉴수정" onclick="burger_reload()">
				<input type="button" value="메뉴삭제" onclick="burger_delete()">
				</td>
				</tr>
			</table>
		</form>
	</article>
</section>
<hr>
<%@include file="../footer.jsp" %>
</body>
</html>