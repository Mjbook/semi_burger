<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
</head>
<h2>토핑 추가</h2>
<body>
	<form name="addToping" action="addToping_ok.jsp">
	<table>
		<tbody>
			<tr>
				<th>토핑 사진</th>
				<td><input type="file" name="toping_img" required="required"></td>
			</tr>
			<tr>
				<th>토핑 이름</th>
				<td><input type="text" name="toping_name" required="required"></td>
			</tr>
			<tr>
				<th>토핑 가격</th>
				<td><input type="text" name="toping_pay" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"></td>
			</tr>
		</tbody>
	</table>
	</form>
</body>
</html>