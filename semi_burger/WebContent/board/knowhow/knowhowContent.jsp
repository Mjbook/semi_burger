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
	
<h2>공지 사항</h2>
<div id="container">
   <div id="content">	
 <table border="1" bordercolor="blue" width="550" cellspacing="0">
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
					<td colspan="4" align="left" valign="top">
						<%=dto.getContent().replaceAll("\n", "<br>") %>
					</td>
			</tr>
			<tr>
			<td>
				<% if("관리자".equals(sname)) { %>
				<a href="noticeUpdate.jsp?idx=<%=dto.getKnowhow_no()%>&sub=<%=dto.getSubject()%>&con=<%=dto.getContent().replaceAll("\n", "<br>") %>">수정</a>
				<a href="noticeDelete.jsp?idx=<%=dto.getKnowhow_no()%>">삭제</a>
				<%} %>
				<a href="notice.jsp">목록</a>
		    </td>
			</tr>
			</table>
   
   </div>
</div>

	<%@include file="/footer.jsp" %>

</body>
</html>				
