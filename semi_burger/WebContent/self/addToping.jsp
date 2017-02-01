<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="tdto" class="yb.toping.TopingDTO" scope="session"/>
<html>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
</head>
<h2>토핑 추가</h2>
<%
String name=tdto.getToping_name();
String price=tdto.getToping_price();
if(name==null||name.equals("")){
	name="";
}
if(price==null||price.equals("")){
	price="";
}
%>
<body>
	<form name="addToping" action="addToping_ok.jsp">
	<table>
		<tbody>
			<tr>
				<th>토핑 이름</th>
				<td><input type="text" name="toping_name" required="required" value="<%=name%>"></td>
			</tr>
			<tr>
				<th>토핑 가격</th>
				<td><input type="text" name="toping_price" required="required" value="<%=price%>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"></td>
			</tr>
		</tbody>
	</table>
	</form>
</body>
</html>