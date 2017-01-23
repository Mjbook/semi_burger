<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link rel="stylesheet" type="text/css"
href="/semi_burger/css/mainLayout.css"> 
<style>
	h1{
		text-align: center;
	}
	table{
		width: 550px;
		margin: 0px auto;
		border: 1px double darkgray;
	}
	th{
		float: right;
	}
	.button{
		text-align:center;
	}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String sid = (String)session.getId();
%>

<section>
	<form name="join" action="join_ok.jsp" method="post">
		<h1> 회원가입 </h1>
		<table>
			<thead>
			</thead>
			<tbody>
				<tr>
					<th> ID </th>
					<td> <input type="text" name="id" value="<%= sid%>" readonly > </td>
				</tr>
				<tr>
					<th> Password </th>
					<td> <input type="password" name="passwd"> </td>
				</tr>
				<tr>
					<th> 이름 </th>
					<td> <input type="text" name="name"> </td>
				</tr>
				<tr>
					<th> 생년월일 </th>
					<td rowspan="2"> <input type="text" name="birth"> </td>
				</tr>
				<tr>
					<th> (ex: 170123) </th>
					<td> </td>
				</tr>
				<tr>
					<th> 핸드폰 번호 </th>
					<td rowspan="2"> <input type="text" name="cellphone"> </td>
				</tr>
				<tr>
					<th> (ex: 01012345678) </th>
					<td> </td>
				</tr>
				<tr>
					<th> E-mail </th>
					<td> <input type="text" name="email"> </td>
				</tr>
				<tr>
					<th> 주소 </th>
					<td> <input type="text" name="address"> </td>
				</tr>
				<tr>
					<td class="button" colspan="2"> <input type=submit value="가입하기"> <input type="reset" value="다시작성"> </td>
				</tr>			
			</tbody>
		</table>
		<br>
	</form>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>