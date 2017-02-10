<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@page import="board.notice.*"%>
<jsp:useBean id="ddao" class="board.notice.noticeDAO" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css"
	href="/semi_burger/css/mainLayout.css">
<%
	String sid = (String) session.getAttribute("sid");
	int totalCnt = ddao.getTotalCnt();//총 게시물 수
	int listSize = 10;//보여줄 리스트 수
	int pageSize = 5;//보여줄 페이지 수
	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}
	int cp = Integer.parseInt(cp_s); //현재 위치 
	int totalPage = totalCnt / listSize + 1;
	if (totalCnt % listSize == 0){
		totalPage--;
	}
	int userGroup = cp / pageSize;
	if (cp % pageSize == 0){
		userGroup--;
	}
%>
<style>
.ol_div{
	display:inline-block;
	border-radius:5px;
	background: #656161;
	height:22px;
	padding-top:3px;
	border:1px solid #DFDFDF;
	
}
.ol_div a{
	color: white;
}
th div{
	height:0px;
	border-bottom:20px solid #DFDFDF;
	border-right: 00px solid white;
}
td{
	padding-left:0px;
	padding-top:5px;
	padding-bottom:0px;	
}
#textarea{
	height : 250px;
	border-bottom:1px solid black;
	border-top:1px solid black;
	border-left:1px solid black;
	border-right:1px solid black;	
}	
</style>
</head>
<body style="cursor:pointer;">

	<div id="container">
		<div id="header">
			<%@include file="/header.jsp"%>
		</div>
				<div style="background:url(/semi_burger/introduce/img/sub_top_bg02.jpg) 50% 50% no-repeat;opacity: 0.85;">
			<br>
			<h2 style="color:white;" id="burgerevent">&nbsp;&nbsp;공 지 사 항</h2>
			<br>
			</div>
			
		<%@include file="../sideMenuBar.jsp" %>
		
		<div id="content">
		<br>
			<table>
				<thead>
					<tr>
						<th><div style="width:80px;">순번</div></th>
						<th><div style="width:440px;">제목</div></th>
						<th><div style="width:140px;">작성자</div></th>
						<th><div style="width:90px;">조회수</div></th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="3" align="center">
							<%
								if (userGroup != 0) {
							%><a class="a"
							href="noticejsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
							<%
								}
								for (int i = userGroup * pageSize + 1; i <= userGroup * pageSize + pageSize; i++) {
							%> &nbsp;&nbsp;<a class="a" href="notice.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
 	if (i == totalPage) {
 			break;
 		}
 	}
 	if (userGroup != ((totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0))) {
 %> <a class="a" href="notice.jsp?cp=<%=((userGroup + 1) * pageSize + 1)%>">&gt;
								&gt;</a> <%
 	}
 %>
						</td>
						<td>
						<br>
						<div align="right">
				<%
					if ("admin".equals(sid)) {
				%>
				<div class="ol_div" style="width:70px; text-align: center;"><a href="noticeWrite.jsp">글쓰기</a></div>
				
				<%
					}
				%>
				</div>
				</td>
				</tfoot>
				<tbody>
					<%
						ArrayList<noticeDTO> adto = ddao.noticeList(cp, listSize);
						if (adto == null || adto.size() == 0) {
					%>
					<tr>
						<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for (int i = 0; i < adto.size(); i++) {
					%>
					<tr>
						<td align="center"><%=adto.get(i).getNotice_no()%></td>
						<td align="left">
						<a class="a" href="noticeContent.jsp?NOTICE_NO=<%=adto.get(i).getNotice_no()%>"><p align="left"><%=adto.get(i).getSubject()%></p></a></td>
						<td align="center"><%=adto.get(i).getName()%></td>
						<td align="center"><%=adto.get(i).getBoard_count()%></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
			<br>

		</div>

		<div id="footer">
			<%@include file="/footer.jsp"%>
		</div>
	</div>

</body>
</html>
