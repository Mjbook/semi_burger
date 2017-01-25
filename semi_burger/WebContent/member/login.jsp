<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="/semi_burger/css/mainLayout.css">
<style>
	fieldset{
		width: 250px;
		margin: 0px auto;
		border-spacing: 0px;
	}
	td{
		font-size: 14px;
	}

</style>
</head>
<body>
<%@ include file="/header.jsp" %>
 
<section>
<br>
	<fieldset>
	<form name="login" action="login_ok.jsp" method="post">
		<table>
		  <tr>	
			<td> <input type="text" name="id" placeholder="아이디"> </td>
			<td rowspan="2"> <input type="submit" value="로그인" style="height:48px;"> </td>
		  </tr>
		  <tr>
		  	<td> <input type="password" name="pwd" placeholder="비밀번호"> </td>
		  	<td> </td>
		  </tr>	
		  <tr>
		  	<td colspan="2"> <input type="checkbox" value="on" style="float:left;"> ID 기억하기 
		  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  					<a href="#">ID,PW 찾기</a> </td>	  	
		  </tr>		
		</table>
	</form>
	</fieldset>
	<fieldset>
		<table>
		  <tr>
			<td style="height:200px;"> ABCD </td>
		  </tr>
		</table>
	</fieldset>
<br>
</section>	

<%@ include file="/footer.jsp" %>
</body>
</html>