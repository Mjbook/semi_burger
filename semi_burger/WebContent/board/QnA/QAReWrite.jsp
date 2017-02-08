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
				<div style="background:url(/semi_burger/introduce/img/sub_top_bg02.jpg) 50% 50% no-repeat;">
			<br>
			<h2 style="color:white;" id="burgerevent">&nbsp;&nbsp;Q & A</h2>
			<br>
			</div>
			
		<%@include file="../sideMenuBar.jsp" %>
		
		<div id="container">
	
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
					<td><input type="text" name="name1" value="<%=sname %>" disabled="disabled"><input type="hidden" name="name" value="<%=sname %>"></td>
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
						<input type="reset" value="다시작성">
						<input type="submit" value="완료"> 
					</div>
			
			</form>
		</div>
		</div>

	<div id="footer">
		<%@include file="/footer.jsp"%>
	</div>
</body>
</html>