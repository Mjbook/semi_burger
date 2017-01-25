<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th{
		float: right;
	}
	.noti{
		text-size: 11px;
		text-align: center;
	}
</style>
</head>
<body>

<section>
	<form name="idfind" action="idfind_ok.jsp">
		<table>
		  <tr>
		  	<td colspan="3" class="noti"> 이름과 전화번호를 입력해주세요 </td>
		  </tr>
		  <tr>
		  	<td> &nbsp; </td>
		  </tr>
		  <tr>
		  	<th> &nbsp;이름 :&nbsp;</th>
		  	<td colspan="2"> <input type="text" name="name"> </td>
		  </tr>
		  <tr>
		  	<th> &nbsp;전화번호 :&nbsp;</th>
		  	<td> <input type="text" name="cellphone" placeholder=" ex: 01012345678"> </td>
			<td> <input type="submit" value="검색"> </td>
		  </tr>
		</table>
	</form>
</section>

</body>
</html>