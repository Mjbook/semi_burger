<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<style type="text/css">
table {
	width: 100%;
	margin: 0px auto;
	border-spacing: 0px;
	border: 1px #5b0d14;
}

table td {
	text-align: center;
}

table textarea {
	width: 100%;
}

#sub {
	width: 100%;
}

#button {
	text-align: right;
}
 </style>
</head>
<body>
	<div id="container">
		<div id="header">
			<%@include file="/header.jsp"%>
		</div>
		<div id="sideMenu">

			<h2 align="center">커뮤니티</h2>
			<ul>
				<li><a href="/semi_burger/board/notice/notice.jsp">공지사항</a></li>
				<li><a href="/semi_burger/board/QnA/QAList.jsp">QnA</a></li>
				<li><a href="#">내가 만든 햄버거</a></li>
				<li><a href="javascript:game()">게임하기</a></li>
			</ul>

		</div>
		<div id="container">
		<h2> 답 변 글</h2>
   <div id="content">	
			<form name="QAReWrite" action="QAReWrite_ok.jsp">
			<%
				String subject = request.getParameter("subject");
				String ref = request.getParameter("ref");
				String lev = request.getParameter("lev");
				String sunbun = request.getParameter("sunbun");
			%>
			<input type="hidden" name="ref" value="<%=ref%>">
			<input type="hidden" name="lev" value="<%=lev%>">
			<input type="hidden" name="sunbun" value="<%=sunbun%>">
			<table id="table2">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" id="na"></td>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" id="pw"> </td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3" align="left">
					<input type="text" name="subject" id="sub" value="답변:)<%=subject%>">
					</td>
				</tr>
				<tr>
					<td colspan="4" >
					<textarea rows="15" cols="50" name="content"></textarea>
					</td>
				</tr>
			</table>
				<div align="right">
						<input type="submit" value="완료"> 
						<input type="reset" value="다시작성">
					</div>
			
			</form>
		</div>
		</div>

	<div id="footer">
		<%@include file="/footer.jsp"%>
	</div>
</body>
</html>