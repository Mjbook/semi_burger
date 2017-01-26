<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="board.notice.*"%>
<jsp:useBean id="bdao" class="board.notice.noticeDAO" />
<!DOCTYPE html>
<html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String sub = request.getParameter("sub"); //제목
	String con = request.getParameter("con"); //내용
	int totalCnt = bdao.getTotalCnt();//총 게시물 수
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
table textarea {
	width: 100%;

}


#sub {
	width:100%;
}

#button {
	text-align: right;
	width="100%"
}

  
  
 </style>
</head>
<body>
	<%@include file="/header.jsp" %>
	
<h2>공지 사항</h2>
<div id="container">
   <div id="content">	
    <form action="noticeUpdate_ok.jsp">
 <table border="1" bordercolor="blue" width="550" cellspacing="0">

			<tr>
				<th>제목</th>
				<td colspan="3" align="left" >
				<input id="sub" type="text" name="subject" value=<%=sub %> placeholder="제목을 입력하세요." />
				</td>
			</tr>
			<tr height="250">
					<td colspan="4" align="left" valign="top">
						<textarea id="textarea_test" rows="15" cols="100" name="content" placeholder="내용을 입력하세요."><%=con %></textarea>
					</td>
			</tr>
			<tr>
			<td  id="button" colspan ="2">
				<input type="hidden" name="notice_no" value=<%=idx%> />
				<a href="notice.jsp">취소</a> <input type="submit" value="완료">
		    </td>
			</tr>
			</table>
   
   </div>
</div>

	<%@include file="/footer.jsp" %>

</body>
</html>				
