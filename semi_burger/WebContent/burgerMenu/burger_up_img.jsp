<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.oreilly.servlet.*"%>
    <%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="yb.burger.Burger_upload" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<%
request.setCharacterEncoding("UTF-8");
String item_img_src = request.getParameter("src");
%>
<title>Insert title here</title>
</head>
<body>
<section>
	<article>
	
		<fieldset>
			<legend align="center">버거 메뉴 등록하기</legend>
			<form name="burger_up_img" action="burger_up_img_ok.jsp">
			<table>
				<tr>
					<th>버거 이름:</th>
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
					<input type="hidden" name="item_img_src" value="<%=item_img_src%>">
					<td colspan="2"><input type="reset" value="다시작성">
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