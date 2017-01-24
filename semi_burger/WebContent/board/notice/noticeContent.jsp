<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="board.notice.*" %>
<jsp:useBean id="bdao" class="board.notice.noticeDAO"/>
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
<title>Insert title here</title>
</head>
<body>
	
<div>
	<div class="notice_grp">
	<br>
		<div class="notice_view">
			<div class="notice_tit">
				<p class="tit"><%=dto.getSubject() %></p>
				<span class="date"><%=dto.getInsert_date() %></span>
			</div>
			<div class="notice_cts">
				<p>
				<%=dto.getContent() %>
				</p>
			</div>
		</div>	
		<div class="btn_align_02">
			<a href="noticeUpdate.jsp?idx=<%=dto.getNotice_no()%>">수정</a>
			<a href="noticeDelete.jsp?idx=<%=dto.getNotice_no()%>">삭제</a>
			<a href="notice.jsp">목록</a>
		</div>	
	</div>
</div>
<%@include file="../../footer.jsp" %>
</body>
</html>