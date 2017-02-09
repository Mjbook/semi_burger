<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="board.knowhow.*" %>
<jsp:useBean id="fdao" class="board.knowhow.knowhowDAO"/>
<%
String idx_s=request.getParameter("KNOWHOW_NO");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);
knowhowDTO dto=fdao.knowhowContent(idx);
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
  
th div{
	height:0px;
	
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
	width:800px;
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
		<div style="background:url(/semi_burger/introduce/img/sub_top_bg02.jpg) 50% 50% no-repeat; opacity: 0.85;">
			<br>
			<h2 style="color:white;" id="burgerevent">&nbsp;&nbsp;My Burger</h2>
			<br>
			</div>
		<%@include file="../sideMenuBar.jsp" %>
		<br>
		<div id="container">
		
   <div id="content">	
 <table >
			<tr>
				<th><div>번호</div></th>
				<td><%=dto.getKnowhow_no()%></td>
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
			<tr height="250">
					<td colspan="4" align="center" valign="top" id="textarea">
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
						<br>
			<input type="button" value="수정" onclick="location.href='knowhowUpdate.jsp?idx=<%=dto.getKnowhow_no()%>&sub=<%=dto.getSubject()%>&con=<%=dto.getContent().replaceAll("\n", "<br>") %>&url=<%=dto.getMy_img_url() %>'">
			<input type="button" value="삭제" onclick="location.href='knowhowDelete.jsp?idx=<%=dto.getKnowhow_no()%>'">
			<input type="button" value="목록" onclick="location.href='knowhowList.jsp'">
				</div>
				<%} %>

  </div>

			<div id="footer">
			<br>
				<%@include file="/footer.jsp"%>
			</div>
		</div>
		</div>



</body>
</html>				
