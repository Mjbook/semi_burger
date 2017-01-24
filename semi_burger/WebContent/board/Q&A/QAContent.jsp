<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.board.notice.QA.*" %>
<jsp:useBean id="bdao" class="board.board.notice.QA.QADAO" scope="session"/>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<section>
		<article>
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
				<td colspan="4" align="center">
				목록보기 | <a href="QAReWrite.jsp?subject=<%=dto.getSubject()%>&rep=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>">답변쓰기</a>
			</tr>
			</table>
		</article>
	
	</section>
	
	<%@ include file="../../footer.jsp"%>
</body>
</html>