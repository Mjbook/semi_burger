<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yong Burger</title>
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
		border-spacing: 0px;
		border-collapse: 0px;
	}
	th{
		float: right;
	}
	td{
		width: 170px;
	}
	.button{
		text-align:center;
	}
	
</style>
<script>
	function idcheck(){
		window.open('idcheck.jsp','idcheck','width=340, height=50, left=420, top=250');
	}
</script>
</head>
<body>
<%@ include file="/header.jsp" %>

<section style="padding-top: 20px;">
	<form name="join" action="join_ok.jsp" method="post">
		<h1> 회원가입 </h1>
		<table>
			<thead>
			</thead>
			<tbody>
				<tr>
		  			<td> &nbsp; </td>
		  		</tr>
				<tr>
					<th> ID&nbsp; </th>
					<td> <input type="text" name="id" readonly> </td>
					<td> <input type="button" value="중복확인" onclick="idcheck()"> </td>
				</tr>
				<tr>
					<th> Password&nbsp; </th>
					<td> <input type="password" name="passwd" required="required"> </td>
					<td> </td>
				</tr>
				<tr>
					<th> 이름&nbsp; </th>
					<td> <input type="text" name="name" required="required"> </td>
					<td> </td>
				</tr>
				<tr>
					<th> 생년월일&nbsp; </th>
					<td> <input type="text" name="birth" maxlength="6" placeholder=" ex: 170123" required="required"> </td>
					<td> </td>
				</tr>
				<tr>
					<th> 전화번호&nbsp; </th>
					<td> <input type="text" name="cellphone" maxlength="11" placeholder=" ex: 01012345678" required="required"> </td>
					<td> </td>
				</tr>
				<tr>
					<th> E-mail&nbsp; </th>
					<td> <input type="text" name="email" required="required"> </td>
					<td> </td>
				</tr>
				<tr>
					<th> 주소&nbsp; </th>
					<td> <input type="text" name="address" required="required"> </td>
					<td> </td>
				</tr>
				<tr>
		  			<td> &nbsp; </td>
		  		</tr>
				<tr>
					<td class="button" colspan="3"> <input type="reset" value="다시작성"> <input type=submit value="가입하기"> </td>
				</tr>
				<tr>
		  			<td> &nbsp; </td>
		  		</tr>		
			</tbody>
		</table>
		<br>
		<br>
	</form>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>