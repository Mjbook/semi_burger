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
  
 </style>
</head>
<body>
	<%@include file="/header.jsp" %>
<div id="container">
   <div id="content">	
	
			<h2>자유게시판 본문</h2>
			<table border="1" bordercolor="blue" width="550" cellspacing="0">
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
			<tr>
				<td colspan="4" align="center"><a href="QAList.jsp" >목록보기 | </a>
				 <a href="QAReWrite.jsp?subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>">답변쓰기</a>
			</tr>
			</table>
</div>
</div>
	
	<%@include file="/footer.jsp" %>
</body>
</html>