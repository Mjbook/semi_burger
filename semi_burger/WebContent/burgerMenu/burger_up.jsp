<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">

<%
request.setCharacterEncoding("UTF-8");
%>
<title>Yong Burger</title>
</head>

<body>
<section>
	<article>
	
		<fieldset>
			<legend align="center">버거 메뉴 등록하기</legend>
			<form name="burger_up" action="burger_up_ok.jsp" method="post" enctype="multipart/form-data">
			<table>
			파일명 : <input type="file" name="upLoad">
			<input type="submit" value="올리기">
			</table>
			</form>
		</fieldset>
	</article>
</section>
</body>
</html>