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
			<legend align="center">버거 메뉴 삭제하기</legend>
			<form name="burger_delete" action="burger_delete_ok.jsp">
			<table>
				<tr>
					<th>key : </th>
					<td><input type="text" name="item_key"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="다시작성">
					<input type="submit" value="메뉴삭제">
					</td>
				</tr>
			</table>
			</form>
		</fieldset>
	</article>
</section>
</body>
</html>