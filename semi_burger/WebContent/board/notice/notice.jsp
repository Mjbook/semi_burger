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
th div{
	height:0px;
	border-bottom:20px solid #DFDFDF;
	border-right: 10px solid white;
}
td{

	padding-left:28px;
	padding-top:0px;
	padding-bottom:0px;
	text-align:left;
	
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
<body>

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
						<th ><div style="width:90px;">순번</div></th>
						<th><div>제목</div></th>
						<th><div>작성자</div></th>
						<th><div>조회수</div></th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="3" align="center">
							<%
								if (userGroup != 0) {
							%><a
							href="noticejsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
							<%
								}
								for (int i = userGroup * pageSize + 1; i <= userGroup * pageSize + pageSize; i++) {
							%> &nbsp;&nbsp;<a href="notice.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
 	if (i == totalPage) {
 			break;
 		}
 	}
 	if (userGroup != ((totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0))) {
 %> <a href="notice.jsp?cp=<%=((userGroup + 1) * pageSize + 1)%>">&gt;
								&gt;</a> <%
 	}
 %>
						
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
						<td><%=adto.get(i).getNotice_no()%></td>
						<td >
						<a href="noticeContent.jsp?NOTICE_NO=<%=adto.get(i).getNotice_no()%>"><p align="left"><%=adto.get(i).getSubject()%></p></a></td>
						<td><%=adto.get(i).getName()%></td>
						<td><%=adto.get(i).getBoard_count()%></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
			<div align="right">
				<%
					if ("admin".equals(sid)) {
				%>
				<input type="button" value="글쓰기"
					onclick="location.href='noticeWrite.jsp'">
				<%
					}
				%>
			</div>

		</div>

		<div id="footer">
			<%@include file="/footer.jsp"%>
		</div>
	</div>

</body>
</html>
