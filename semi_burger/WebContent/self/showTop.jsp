<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<%@page import="yb.toping.*" %>   
<!DOCTYPE html>
<html>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<jsp:useBean id="tdto" class="yb.toping.TopingDTO"/>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
<script>
function popClose(){
	window.self.close();
}
</script>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<style>
body{
	margin: 0px auto;
	width:100%;
}
body table img{
	width:100px;
	height:100px;
}
body table{
	margin:0px auto;
	text-align: center;
}
.fr{
	vertical-align: bottom;
}
.sr{
	vertical-align: top;
}
</style>
</head>
<%
ArrayList<TopingDTO> tdtos=tdao.getInfo("0");
%>
<body>
	<fieldset>
		<legend>토핑 관리</legend>
		<form name="showTop" action="showTop_ok.jsp">
		<table>
		<%
		if(tdtos.size()==0||tdtos==null){
			%>
		<tr>
			<td colspan="3">숨긴 토핑 없음...</td>
		</tr>
			<%
		}else{
			for(int i=0;i<tdtos.size();i++){
				tdto=tdtos.get(i);
			%>
		<tr>
			<td rowspan="2"><img src="/semi_burger/self/toping_img/<%=tdto.getToping_img()%>"></td>
			<td class="fr"><%=tdto.getToping_name()%></td>
			<td class="fr"><a href="showTop_ok.jsp?select=<%=tdto.getToping_key()%>" class="a">-판매하기</a></td>
		</tr>
		<tr>
			<td class="sr"><%=tdto.getToping_price() %>원</td>
			<td class="sr"><a href="showTop_ok.jsp?delete=<%=tdto.getToping_key()%>" class="a">-완전 삭제</a></td>
		</tr>
		<%
			}
		}
		%>
		<tr>
			<td colspan="3"><input type="button" onclick="popClose()" value="닫기"></td>
		</tr>
		</table>
		</form>
	</fieldset>
</body>
</html>