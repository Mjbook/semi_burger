<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="board.notice.*"%>
<jsp:useBean id="bdao" class="board.notice.noticeDAO" />
<%
String idx_s=request.getParameter("NOTICE_NO");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);
noticeDTO dto=bdao.noticeContent(idx);
if(dto==null){
	%>
<script>
	window.alert('잘못된 접근방식 또는 삭제된 게시글 입니다.');
	location.href='notice.jsp';
	</script>
<%
	return;
}
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css"
	href="/semi_burger/css/mainLayout.css">
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
				<li><a href="/semi_burger/board/QnA/QAList.jsp">창업문의</a></li>
				<li><a href="#">내가 만든 햄버거</a></li>
				<li><a href="javascript:game()">게임하기</a></li>
			</ul>

		</div>
		<div id="contnet">

			<form action="noticeWrite_ok.jsp">
				<h2>공지사항</h2>
				<table id="table2">
					<tr>
						<th>제목</th>
						<td colspan="3" align="left"><input type="text"	name="subject" placeholder="제목을 입력하세요." /></td>
					</tr>
					<tr height="100%">
						<td colspan="4" align="left" valign="top"><textarea rows="15" cols="100" name="content" placeholder="내용을 입력하세요."></textarea></td>
					</tr>
				</table>
				<div align="right">
					<input type="button" value="취소"  onclick="location.href='notice.jsp'"> <input type="submit" value="완료">
				</div>
			</form>
		</div>
		</div>

	<div id="footer">
		<%@include file="/footer.jsp"%>
	</div>
</body>
</html>
