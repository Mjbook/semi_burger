<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.net.*" %> 
<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yong Burger</title>
</head>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("passwd");
	
	int result = mdao.pwdfind(pwd, id);
%>
<body>
	<form name="pwdfind">
	  <table>
	  	<tr>
	  		<th> 새로운 비밀번호 입력 : </th>
	  		<td> <input type="text" name="pwd"> </td>
	  	</tr>
	  	<tr>
	  		<th> 비밀번호 확인: </th>
	</form>
</body>
</html>