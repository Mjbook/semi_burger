<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<article>
	<fieldset>
		<legend align="center">이벤트 메뉴 등록하기</legend>
		<form name="eventMenu_img_up" action="eventMenu_img_up_ok.jsp" method="post" enctype="multipart/form-data">
			<table>
				<tr>
				파일명 : <input type="file" name="eventitem_img_src">
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="메뉴등록">
					</td>
				</tr>
			</table>
		</form>
	</fieldset>
	</article>
</section>
</body>
</html>