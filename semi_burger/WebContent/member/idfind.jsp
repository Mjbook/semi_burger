<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yong Burger</title>
<style>
	div{
		text-align:center;
	}
	th{
		float: right;
		font-size: 14px;
	}
	.noti{
		text-align: center;
	}
</style>
</head>
<body>

<section>
	<form name="idfind" action="idfind_ok.jsp">
		<div> 이름과 전화번호를 입력해주세요 </div>
		<br>
			<fieldset>
		<table>
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
			</fieldset>
	</form>
  
</section>

</body>
</html>