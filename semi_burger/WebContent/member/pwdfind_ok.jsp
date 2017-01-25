<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.net.*" %> 
<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("passwd");
	//pwd 값을 받은게 없으므로 오류남
	
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
	  		<td> <input type="text" name="pwd2"> </td>
	  	</tr>
	  </table>	
	</form>
</body>
</html>