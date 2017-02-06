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

#file {
	text-align: left;
	width="100%"
}

  
  
 </style>
</head>
<body>
	<%@include file="/header.jsp" %>
	
<h2>내가 만든 햄버거</h2>
<div id="container">
   <div id="content">	
    <form action="knowhowWrite_ok.jsp" method="post" enctype="multipart/form-data" >
 <table border="1" bordercolor="blue" width="550" cellspacing="0">
			<tr>
				<th>제목</th>
				<td colspan="3" align="left" >
				<input id="sub" type="text" name="subject" placeholder="제목을 입력하세요." />
				</td>
			</tr>
			<tr height="250">
					<td colspan="4" align="left" valign="top">
						<textarea rows="15" cols="100" name="content" placeholder="내용을 입력하세요."></textarea>
					</td>
			</tr>
			<tr>
				<td id="file" colspan="2" align="left" ><input type="file" name="upLoad"></td>
			</tr>
			<tr>
			<td  id="button" colspan ="2">
				<input type="hidden" name="name" value="<%=sname %>" />
				<a href="img.jsp">취소</a> <input type="submit" value="완료">
		    </td>
			</tr>
			</table>
   
   </div>
</div>

	<%@include file="/footer.jsp" %>

</body>
</html>				
