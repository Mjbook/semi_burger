<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<style type="text/css">
 <!--
  #container {min-height: 80%; maring-top: -100px; }
   * html #container {height: 100%;}
  #container #content {padding: 100px 0 ; }
  
table {
	width: 100%;
	margin: 0px auto;
	border-top: 2px double darkblue;
	border-bottom: 2px double darkblue;
	border-spacing: 0px;
}

table th {
	background: skyblue;
}

table td {
	text-align: center;
	
}
table textarea {
	width: 100%;

}


#sub {
	width:100%;
}
#na {
	width:100%;
}
#pw {
	width:100%;
}

#button {
	text-align: right;
	width="100%"
}

  
  
 </style>
</head>
<body>
	<%@include file="/header.jsp" %>
	<div id="container">
   <div id="content">	
			<h2> 문 의 사 항 </h2>
			<form name="QAWrite" action="QAWrite_ok.jsp">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" id="na"></td>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" id="pw"> </td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3" align="left">
					<input type="text" name="subject" id="sub">
					</td>
				</tr>
				<tr>
					<td colspan="4" >
					<textarea rows="15" cols="50" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					
				</tr>
			</table>
			
			</form>
</div>
</div>

	<%@include file="/footer.jsp" %>
</body>
</html>