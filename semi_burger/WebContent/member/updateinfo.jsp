<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>    

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
<%
	request.setCharacterEncoding("utf-8");
	
	String sid = (String)session.getAttribute("sid");
	String name = "A";
	
	ArrayList<MemberDTO> arr = mdao.getUserInfo(sid);
	for(int i=0;i<arr.size();i++){
		name = arr.get(i).getName();
		
	}
%>
<body>
<%@ include file="/header.jsp" %>

<section>
	<form name="updateinfo" action="updateinfo_ok.jsp" method="post">
		<h1> 회원정보 수정 </h1>
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
					<td> <input type="text" name="name" value="<%= name%>"> </td>
				</tr>
				<tr>
					<th> 생년월일 </th>
					<td> <input type="text" name="birth" placeholder=" ex: 170123"> </td>
				</tr>
				<tr>
					<th> 핸드폰 번호 </th>
					<td> <input type="text" name="cellphone" placeholder=" ex: 01012345678"> </td>
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
					<td class="button" colspan="2"> <input type=submit value="수정하기"> <input type="button" value="탈퇴하기" onclick="delete.jsp"> </td>
				</tr>			
			</tbody>
		</table>
		<br>
	</form>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>