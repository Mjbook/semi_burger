<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.net.*" %> 
<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yong Burger</title>
<style>
	.button{
		text-align: center;
	}
</style>
</head>
<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("id");
	
	int result = mdao.getId(userid);
	
	if(result<=0){
		%>
		<script>
			window.alert('존재하지 않는 ID입니다');
			history.back();
		</script>
		<%
	}
%>
<body>
	<form name="pwdset" action="pwdset_ok.jsp" method="post">
	<input type="hidden" name="id" value="<%= userid%>">
		<fieldset>
		<legend> 새 비밀번호 설정 </legend>
		  <table>
		  	<tr>
		  		<th> 비밀번호 입력 : </th>
		  		<td> <input type="password" name="pwd1"> </td>
		  	</tr>
		  	<tr>
		  		<th> 비밀번호 확인 : </th> 
		  		<td> <input type="password" name="pwd2"> </td>
		  	</tr>
		  </table>
	 	</fieldset>
	 	<br>
	 	<div class="button">
			<input type="button" value="돌아가기" onclick="javascript:history.back()">
			<input type="submit" value="설정하기">
		</div>
	</form>
</body>
</html>