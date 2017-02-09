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
	bdao.qaCount(idx);
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
	
		<div id="content" align="center">	
	

			<table class="tableList">
			<tr>
				<th><div >번호</div></th>
				<td><%=dto.getQna_no()%></td>
				<th><div>작성 날짜</div></th>
				<td><%=dto.getInsert_date() %></td>
			</tr>
			<tr>
				<th><div>작성자</div></th>
				<td><%=dto.getName()%></td>
				<th><div>조회수</div></th>
				<td><%=dto.getBoard_count() %></td>
			</tr>
			<tr>
				<th><div>제목</div></th>
				<td colspan="3" align="left">
				<%=dto.getSubject() %>
				</td>
			</tr>
			<tr>
					<td colspan="4" id="textarea" align="left" valign="top" >
						<br><%=dto.getContent().replaceAll("\n", "<br>") %>
					</td>
			</tr>
			</table>
			<table align="center">
			<div align="center">
			<br>
			<input type="button" value="목록보기" onclick="location.href='QAList.jsp'">
			<input type="button" value="답변쓰기" onclick="location.href='QAReWrite.jsp?subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>'">
			</div>
			</table>
			</div>
			</div>
		
			<div id="footer">
				<br>
				<%@include file="/footer.jsp"%>
			</div>
</body>
</html>