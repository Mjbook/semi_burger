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


#button {
	text-align: right;
}
th div{
	height:0px;
	border-bottom:20px solid #DFDFDF;
	border-right: 00px solid white;
}
td{

	padding-left:0px;
	padding-top:1px;
	padding-bottom:2px;

	
}
#textarea{
	height : 250px;
	border-bottom:1px solid black;
	border-top:1px solid black;
	border-left:1px solid black;
	border-right:1px solid black;
	
}
</style>
<script>
function listgo(){
	location.href='knowhowList.jsp';
}
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<%@include file="/header.jsp"%>
		</div>
		<div style="background:url(/semi_burger/introduce/img/sub_top_bg02.jpg) 50% 50% no-repeat;opacity: 0.85;">
			<br>
			<h2 style="color:white;" id="burgerevent">&nbsp;&nbsp;My Burger</h2>
			<br>
			</div>
		<%@include file="../sideMenuBar.jsp" %>
		<br>
		
   		<form action="knowhowUpdate_ok.jsp"  method="post" enctype="multipart/form-data" >
 		<table>
			<tr>
				<th><div>제목</div></th>
				<td colspan="3" align="left" >
				<input type="text" name="subject" value="<%=sub %>" placeholder="제목을 입력하세요." />
				</td>
			</tr>
			<tr height="250">
					<td colspan="4" align="left" valign="top">
						<textarea rows="15" cols="110"  placeholder="내용을 입력하세요."><%=con %></textarea>
					</td>
			</tr>
			<tr>
				<td id="file" colspan="2" align="left" ><input type="file" name="upLoad"></td>
			</tr>
			<tr>
			<td colspan="4">
			<div align="center">
				<input type="hidden" name="name" value="<%=sname %>" />
				<input type="hidden" name="url" value="<%=url %>" />
				<input type="hidden" name="knowhow_no" value=<%=idx%> />
				<input type="button" value="취소" onclick="listgo()"> <input type="submit" value="완료">
				
			</div>
			</td>
			</tr>
			</table>
			
   
  </form>
		</div>

		<div id="footer">
		<br>
			<%@include file="/footer.jsp"%>
		</div>
	</div>


</body>
</html>				
