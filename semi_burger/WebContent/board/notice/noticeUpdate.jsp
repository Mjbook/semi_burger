<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="board.notice.*"%>
<jsp:useBean id="bdao" class="board.notice.noticeDAO" />
<!DOCTYPE html>
<html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String sub = request.getParameter("sub"); //제목
	String con = request.getParameter("con"); //내용
	int totalCnt = bdao.getTotalCnt();//총 게시물 수
	int listSize = 10;//보여줄 리스트 수
	int pageSize = 5;//보여줄 페이지 수
	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}
	int cp = Integer.parseInt(cp_s); //현재 위치 
	int totalPage = totalCnt / listSize + 1;
	if (totalCnt % listSize == 0)
		totalPage--;

	int userGroup = cp / pageSize;
	if (cp % pageSize == 0)
		userGroup--;
%>
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css"
	href="/semi_burger/css/mainLayout.css">
<style type="text/css">
#table1 table {
	width: 1000px;
	margin: 15px 0;
}

#table1 th {
	color: #ffffff;
	background-color: #aae1fe;
	background: -o-linear-gradient(90deg, #800000, #ffffff);
	background: -moz-linear-gradient(center top, #800000 100%, #ffffff  5%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #800000
		), color-stop(1, #ffffff ));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#800000',
		endColorstr='#ffffff ');
	}

#table1, #table1 th, #table1 td {
	width: 800px;
	font-size: 12px;
	text-align: center;
	padding: 4px;
	border-collapse: collapse
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
				<li><a href="/semi_burger/board/QnA/QAList.jsp">창업문의</a></li>
				<li><a href="#">내가 만든 햄버거</a></li>
				<li><a href="javascript:game()">게임하기</a></li>
			</ul>

		</div>
		<div id="content">
			<h2>공지사항</h2>
			<form action="noticeUpdate_ok.jsp">
				<table id="table1" border="1">
					<tr>
						<th>제목</th>
						<td colspan="3" align="left">
						<input type="text" name="subject" value=<%=sub%> placeholder="제목을 입력하세요." /></td>
					</tr>
					<tr height="250">
						<td colspan="4" align="left" valign="top">
						<textarea id="textarea_test" rows="15" cols="100" name="content" placeholder="내용을 입력하세요."><%=con%></textarea></td>
					</tr>
				</table>
				<div align="center">
				<input type="hidden" name="notice_no" value=<%=idx%> />
				<input type="button" value="취소" onclick="location.href='notice.jsp'">
				 <input	type="submit" value="완료">
		</div>
		</form>
		</div>

		<div id="footer">
			<%@include file="/footer.jsp"%>
		</div>
	</div>

</body>
</html>
