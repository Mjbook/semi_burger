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
	<fieldset>
	<legend>토핑 사진 올리기</legend>
	파일명:<input type="file" name="toping_img">
	<input type="submit" value="올리기">
	</fieldset>
</form>
</body>
</html>