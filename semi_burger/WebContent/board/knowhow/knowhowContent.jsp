<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="board.knowhow.*" %>
<jsp:useBean id="bdao" class="board.knowhow.knowhowDAO"/>
<%
String idx_s=request.getParameter("KNOWHOW_NO");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);
knowhowDTO dto=bdao.knowhowContent(idx);
if(dto==null){
	%>
	<script>
	window.alert('잘못된 접근방식 또는 삭제된 게시글 입니다.');
	location.href='knowhowList.jsp';
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
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<style type="text/css">

#img {
  width: inherit;
  max-width: 80%;
  height: auto;
}  
  
 </style>
</head>
<body>
<%
String sid=(String)session.getAttribute("sid");
String url = "";
if(dto.getMy_img_url() != null) {
url = dto.getMy_img_url();
url = url.substring(url.length()-4, url.length());
}

%>
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

		<div id="container">
			<h2>내가 만든 햄버거</h2>
   <div id="content">	
 <table id="tableList" border="1">
			<tr>
				<th>번호</th>
				<td><%=dto.getKnowhow_no()%></td>
				<th>작성 날짜</th>
				<td><%=dto.getInsert_date() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getName()%></td>
				<th>조회수</th>
				<td><%=dto.getBoard_count() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3" align="left">
				<%=dto.getSubject() %>
				</td>
			</tr>
			<tr height="250">
					<td colspan="4" align="center" valign="top">
						<%=dto.getContent().replaceAll("\n", "<br>") %>
						<br/>
						<br/>
						<% if(!"null".equals(url) && !"".equals(url)) {  %>
						<img src="<%= pageContext.getServletContext().getContextPath() %>/<%=dto.getMy_img_url() %>" id="img" />
						<% } %>
					</td>
			</tr>
			</table>
			<% if(sname.equals(dto.getName()) || "admin".equals(sid)) { %>
			<div align="center">
			<input type="button" value="수정" onclick="location.href='knowhowUpdate.jsp?idx=<%=dto.getKnowhow_no()%>&sub=<%=dto.getSubject()%>&con=<%=dto.getContent().replaceAll("\n", "<br>") %>&url=<%=dto.getMy_img_url() %>'">
			<input type="button" value="삭제" onclick="location.href='knowhowDelete.jsp?idx=<%=dto.getKnowhow_no()%>'">
				<%} %>
			<input type="button" value="목록" onclick="location.href='knowhowList.jsp'">
				</div>

  </div>

			<div id="footer">
				<%@include file="/footer.jsp"%>
			</div>
		</div>
		</div>



</body>
</html>				
