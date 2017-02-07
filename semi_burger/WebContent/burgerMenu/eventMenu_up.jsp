<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">

<%
request.setCharacterEncoding("UTF-8");
String item_img_src = request.getParameter("src");
System.out.println("123");
%>
<title>Yong Burger</title>
</head>
<body>
<section>
	<article>
	
		<fieldset>
			<legend align="center">이벤트 메뉴 등록하기</legend>
			<form name="eventMenu_up" action="eventMenu_up_ok.jsp">
			<table>
				<tr>
					<th>버거이름:</th>
					<td><input type="text" name="item_name"></td>
				</tr>
				<tr>
					<th>가격:</th>
					<td><input type="text" name="item_pay"></td>
				</tr>
				<tr>
					<th>수량:</th>
					<td><input type="text" name="item_count"></td>
				</tr>
				<tr>
					<th>판매종료일자:</th>
					<td>등록일로부터 14일</td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="hidden" name="item_img_src" value="<%=item_img_src%>">
					<input type="reset" value="다시작성">
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