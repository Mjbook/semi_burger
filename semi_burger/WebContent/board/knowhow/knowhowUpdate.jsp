<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="board.knowhow.*"%>
<jsp:useBean id="fdao" class="board.knowhow.knowhowDAO" />
<!DOCTYPE html>
<html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String sub = request.getParameter("sub"); //제목
	String con = request.getParameter("con"); //내용
	String url = request.getParameter("url"); //내용
	int totalCnt = fdao.getTotalCnt();//총 게시물 수
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
<link rel="stylesheet" type="text/css"	href="/semi_burger/css/mainLayout.css">
<style type="text/css">

table {
	width: 100%;
	margin: 0px auto;
	border-spacing: 0px;
	border: 1px #5b0d14;
}

table td {
	text-align: center;
}

table textarea {
	width: 100%;
}

#sub {
	width: 100%;
}

#button {
	text-align: right;
}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<%@include file="/header.jsp"%>
		</div>
		
		<%@include file="../sideMenuBar.jsp" %>
		
		<div id="content">
			<h2>내가 만든 햄버거</h2>
    <form action="knowhowUpdate_ok.jsp"  method="post" enctype="multipart/form-data" >
 <table id="table2">
			<tr>
				<th>제목</th>
				<td colspan="3" align="left" >
				<input id="sub" type="text" name="subject" value="<%=sub %>" placeholder="제목을 입력하세요." />
				</td>
			</tr>
			<tr height="250">
					<td colspan="4" align="left" valign="top">
						<textarea rows="15" cols="100" name="content" placeholder="내용을 입력하세요."><%=con %></textarea>
					</td>
			</tr>
			<tr>
				<td id="file" colspan="2" align="left" ><input type="file" name="upLoad"></td>
			</tr>
			<tr>
			
			</tr>
			</table>
			<div align="center">
				<input type="hidden" name="name" value="<%=sname %>" />
				<input type="hidden" name="url" value="<%=url %>" />
				<input type="hidden" name="knowhow_no" value=<%=idx%> />
				<a href="knowhowList.jsp">취소</a> <input type="submit" value="완료">
			</div>
   
  </form>
		</div>

		<div id="footer">
			<%@include file="/footer.jsp"%>
		</div>
	</div>


</body>
</html>				
