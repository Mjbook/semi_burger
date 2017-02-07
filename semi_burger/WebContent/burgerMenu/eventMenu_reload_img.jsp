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
			<legend align="center">이벤트 메뉴 수정하기</legend>
			<form name="burger_reload" action="eventMenu_reload_img_ok.jsp" method="post" enctype="multipart/form-data">
			<table>
			파일명 : <input type="file" name="reLoad">
			<input type="submit" value="올리기">
			</table>
			</form>
		</fieldset>
	</article>
</section>
</body>
</html>