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
	window.open("burger_up.jsp","burger_up","top=300,left=400,width=400,height=300");
}
</script>

</head>
<body>
<%@include file="header.jsp" %>
<section>
	<article>
		<form name="burgerMenu">
			<table border="1" width="550" height="500" >
			<tbody>
				<tr>
				<%
				for(int i=0;i<al.size();i++){
					%>
					<th><img src="burger_img/<%=al.get(i).getItem_img_src()%>" width="300" height="300"></th>
					<td><%=al.get(i).getItem_name()%></td>
					<%
					if(i%4==0&&i!=16){
					%>
					</tr><tr>
					<%
					}
				}
				%>
				</tbody>
				<tfoot>
				<input type="button" value="메뉴등록" onclick="burger_up()">
				</tfoot>
			</table>
		</form>
	</article>
</section>
<hr>
<%@include file="footer.jsp" %>
</body>
</html>