<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">

<%
request.setCharacterEncoding("UTF-8");
String item_num = request.getParameter("item_num");
String item_name = request.getParameter("item_name");
String item_pay = request.getParameter("item_pay");
String item_count = request.getParameter("item_count");
%>
<title>Insert title here</title>
</head>

<body>
<section>
	<article>
	
		<fieldset>
			<legend align="center">버거 메뉴 등록하기</legend>
			<form name="burger_up_img" action="burger_up_img_ok.jsp" method="post" enctype="multipart/form-data">
			<table>
				<tr>
				<input type="text" name="item_num" value="<%=item_num%>">
				<input type="hidden" name="item_name" value="<%=item_name%>">
				<input type="hidden" name="item_pay" value="<%=item_pay%>">
				<input type="hidden" name="item_count" value="<%=item_count%>">
				<input type="file" name="item_img_src">
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="이미지등록">
					</td>
				</tr>
			</table>
			</form>
		</fieldset>
	</article>
</section>
</body>
</html>