<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.QA.*" %>
<jsp:useBean id="bdao" class="board.QA.QADAO" scope="page"/>
<%
	String idx_s=request.getParameter("idx");
	if(idx_s==null || idx_s.equals("")) {
		idx_s = "0";
	}
	int idx=Integer.parseInt(idx_s);
	QADTO dto = bdao.QAContent(idx);
	
	if(dto==null) {
		%>
		<script>
			window.alert('잘못된 접근방식 또는 삭제된 게시글입니다.');
			location.href='QAList.jsp';
		</script>
		<%
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
</head>
<body>
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
		<div id="container">
		<h2>자유게시판 본문</h2>
		<div id="content">	
	

			<table id="tableList">
			<tr>
				<th>번호</th>
				<td><%=dto.getQna_no()%></td>
				<th>작성 날짜</th>
				<td><%=dto.getInsert_date() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getName()%></td>
				<th>조회수</th>
				<td><%=dto.getContent() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3" align="left">
				<%=dto.getSubject() %>
				</td>
			</tr>
			<tr height="250">
					<td colspan="4" align="left" valign="top">
						<%=dto.getContent().replaceAll("\n", "<br>") %>
					</td>
			</tr>
			</table>
			<div align="center">
			<input type="button" value="목록보기" onclick="location.href='QAList.jsp'">
			<input type="button" value="답변쓰기" onclick="location.href='QAReWrite.jsp?subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>'">
			</div>
			</div>
			</div>

			<div id="footer">
				<%@include file="/footer.jsp"%>
			</div>
</body>
</html>