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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css"
	href="/semi_burger/css/mainLayout.css">
<style type="text/css">

th div{
	height:0px;
	border-bottom:20px solid #DFDFDF;

}
td{
	width: 170px;
	padding-left:0px;
	padding-top:0px;
	padding-bottom:0px;
	text-align:left;
	
}

#sub {
	
}

#button {
	text-align: right;
}
</style>
</head>
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
		
		<div id="contnet">

		
				
    <form action="knowhowWrite_ok.jsp" method="post" enctype="multipart/form-data" >
<table>	
			<tr>
				<th><div>제목</div></th>
				<td colspan="3" align="left" >
				<input type="text" name="subject" placeholder="제목을 입력하세요." />
				</td>
			</tr>
			<tr height="250">
					<td colspan="4" align="left" valign="top">
						<textarea rows="15" cols="110" name="content" placeholder="내용을 입력하세요."></textarea>
					</td>
			</tr>
			<tr>
				<td id="file" colspan="2" align="left" ><input type="file" name="upLoad"></td>
			</tr>
			<tr>
			<td  id="button" colspan ="2">
				<input type="hidden" name="name" value="<%=sname %>" />
				
		    </td>
			</tr>
			</table>
			<div align="center">
					<input type="button" value="취소"  onclick="location.href='knowhowList.jsp'"> <input type="submit" value="완료">
				</div>
</form>
 </div>
		</div>

	<div id="footer">
	<br>
		<%@include file="/footer.jsp"%>
	</div>
</body>
</html>				
