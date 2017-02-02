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
	<form name="pwdfind" action="pwdfind_ok.jsp" method="post">
		<div> 아이디를 입력해주세요 </div>
		<br>
			<fieldset>
		<table>
		  <tr>
		  	<th> &nbsp;아이디 :&nbsp;</th>
		  	<td> <input type="text" name="id"> </td>
		  	<td> <input type="submit" value="검색"> </td>
		  </tr>
		</table>
			</fieldset>
	</form>
  
</section>

</body>
</html>