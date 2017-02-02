<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<%
request.setCharacterEncoding("UTF-8");
%>
<title>Insert title here</title>
</head>
<body>
<section>
	<article>
	
		<fieldset>
			<legend align="center">버거 메뉴 수정하기</legend>
			<form name="side_reload" action="side_reload_ok.jsp" method="post" enctype="multipart/form-data">
			<table>
			파일명 : <input type="file" name="sideReload">
			<input type="submit" value="올리기">
			</table>
			</form>
		</fieldset>
	</article>
</section>
</body>
</html>