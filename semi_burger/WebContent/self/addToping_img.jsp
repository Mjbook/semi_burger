<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
</head>
<body>
<form name="addToping_img" action="addToping_img_ok.jsp" method="post" enctype="multipart/form-data">
	<h2 align="center">토핑 메뉴 사진 등록</h2>
	<fieldset>
	<legend>예시</legend>
	<img src="/semi_burger/self/toping_img/frontTop.JPG">
	</fieldset>
	<br>
	<div align="center"><input type="file" name="toping_img"><input type="submit" value="올리기"></div>
</form>
</body>
</html>