<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<style type="text/css">
th div{
	height:0px;

	border-bottom:20px solid #DFDFDF;

}
td{
	width: 160px;
	padding-left:0px;
	padding-top:0px;
	padding-bottom:0px;
	text-align:left;
	
}

#button {
	text-align: right;
}
 </style>
 <script>
 function rewrite() {
	document.QAReWrite.reset();
}
 function resubmit() {
	 document.QAReWrite.submit();
}
 </script>
</head>
<%
	String sid = (String)session.getAttribute("sid");
	
	if(sid==null || !sid.equals("admin")){
		%>
		<script>
			window.alert('관리자만 작성 가능합니다');
			history.back();
		</script>
		<%
		return;
	}

%>
<body>
	<div id="container">
		<div id="header">
			<%@include file="/header.jsp"%>
		</div>
				<div style="background:url(/semi_burger/introduce/img/sub_top_bg02.jpg) 50% 50% no-repeat;opacity: 0.85;">
			<br>
			<h2 style="color:white;" id="burgerevent">&nbsp;&nbsp;Q & A</h2>
			<br>
			</div>
			
		<%@include file="../sideMenuBar.jsp" %>
		<br>
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
			<table>
				<tr>
					<th><div>작성자</div></th>
					<td><input type="text" name="name1" value="<%=sname %>" disabled="disabled"><input type="hidden" name="name" value="<%=sname %>"></td>
					<th><div>비밀번호</div></th>
					<td><input type="password" name="pwd" id="pw"> </td>
				</tr>
				<tr>
					<th><div>제목</div></th>
					<td colspan="3" align="left">
					<input type="text" name="subject" id="sub" value="답변:)<%=subject%>">
					</td>
				</tr>
				<tr>
					<td colspan="4" >
					<textarea rows="15" cols="110" name="content"></textarea>
					</td>
				</tr>
			</table>
				<div align="center">
				<br>
				<div class="ol_div" style="width:70px; text-align: center;"><a href="javascript:rewrite()">다시작성</a></div>
				<div class="ol_div" style="width:70px; text-align: center;"><a href="javascript:resubmit()">완료</a></div>
						
					</div>
			
			</form>
		</div>
		</div>

	<div id="footer">
	<br>
		<%@include file="/footer.jsp"%>
	</div>
</body>
</html>