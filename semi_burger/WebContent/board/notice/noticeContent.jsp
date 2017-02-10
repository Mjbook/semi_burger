<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="board.notice.*"%>
<jsp:useBean id="ddao" class="board.notice.noticeDAO" />
<%
	String idx_s = request.getParameter("NOTICE_NO");
	if (idx_s == null || idx_s.equals("")) {
		idx_s = "0";
	}
	int idx = Integer.parseInt(idx_s);
	noticeDTO dto = ddao.noticeContent(idx);
	if (dto == null) {
%>
<script>
	window.alert('잘못된 접근방식 또는 삭제된 게시글 입니다.');
	location.href = 'notice.jsp';
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
<%
String sid=(String)session.getAttribute("sid");

%>
<style>
th div{
	height:0px;
	width:140px;
	border-bottom:20px solid #DFDFDF;
}
td{
	width: 160px;
	padding-left:28px;
	padding-top:0px;
	padding-bottom:0px;
	text-align:left;
	border-bottom:1px solid black;
}
#textarea{
	height : 250px;
	border-bottom:1px solid black;
	border-top:1px solid black;
	border-left:1px solid black;
	border-right:1px solid black;
	
}

</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<%@include file="/header.jsp"%>
		</div>
			<div style="background:url(/semi_burger/introduce/img/sub_top_bg02.jpg) 50% 50% no-repeat; opacity: 0.85;">
			<br>
			<h2 style="color:white;" id="burgerevent">&nbsp;&nbsp;공 지 사 항</h2>
			<br>
			</div>
		
			<%@include file="../sideMenuBar.jsp" %>

		<div id="container">
			
			<div id="content" align="center">
				<br>
				<table>
					<tr>
						<th><div>번호</div></th>
						<td><%=dto.getNotice_no()%></td>
						<th><div>작성 날짜</div></th>
						<td><%=dto.getInsert_date()%></td>
					</tr>
					<tr>
						<th><div>작성자</div></th>
						<td><%=dto.getName()%></td>
						<th><div>조회수</div></th>
						<td><%=dto.getBoard_count()%></td>
					</tr>
					<tr>
						<th><div>제목</div></th>
						<td colspan="3" align="left"><%=dto.getSubject()%></td>
					</tr>
					<tr height="250">
						<td colspan="4" id="textarea"><%=dto.getContent().replaceAll("\n", "<br>")%>
						</td>
					</tr>
				</table>
				<table align="center">
				<br>
					<div align="center">
							<%
							if ("admin".equals(sid)) {
							%> 
							<div class="ol_div" style="width:70px; text-align: center;"><a href="noticeUpdate.jsp?idx=<%=dto.getNotice_no()%>&sub=<%=dto.getSubject()%>&con=<%=dto.getContent().replaceAll("\n", "<br>")%>">수정</a></div>
							
							<input type="button" value="삭제" onclick="location.href='noticeDelete.jsp?idx=<%=dto.getNotice_no()%>'">
							 <%
							}
							 %>
							 <input type="button" value="목록" onclick="location.href='notice.jsp'">
							 </div>
							 <br>
				</table>
			</div>
			<br>	
		</div>
			<div id="footer">
				<%@include file="/footer.jsp"%>
			</div>
		</div>
</body>
</html>
