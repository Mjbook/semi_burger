<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	fieldset{
		width: 250px;
		border-spacing: 0px;
	}
</style>
</head>
<body>

<section>
	<fieldset>
	<form name="login" action="login_ok.jsp" method="post">
		<table>
		  <tr>	
			<td> <input type="text" name="id" placeholder="아이디"> </td>
			<td rowspan="2"> <input type="submit" value="로그인"> </td>
		  </tr>
		  <tr>
		  	<td> <input type="password" name="pwd" placeholder="비밀번호"> </td>
		  	<td> </td>
		  </tr>	
		  <tr>
		  	<td colspan="2"> 회원가입 | 아이디, 비밀번호 찾기 </td>		  	
		  </tr>		
		</table>
	</form>
	</fieldset>
</section>	

</body>
</html>