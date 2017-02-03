<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@page import="board.notice.*"%>
<jsp:useBean id="bdao" class="board.notice.noticeDAO" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<style type="text/css">

#table1 table {
	width: 1000px;
	margin: 15px 0;
}

#table1 th {
	background-color: #00A5FF;
	background: -o-linear-gradient(90deg, #00A5FF, #6dcbfe);
	background: -moz-linear-gradient(center top, #00A5FF 5%, #6dcbfe 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #00A5FF
		), color-stop(1, #6dcbfe));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00A5FF',
		endColorstr='#6dcbfe');
	color: #FFFFFF;
	}

#table1, #table1 th, #table1 td {
	width: 800px;
	font-size: 0.95em;
	text-align: center;
	padding: 4px;
	border: 1px solid #efefef;
	border-collapse: collapse
}

#table1 tr:nth-child(odd) {
	background-color: #aae1fe;
	background: -o-linear-gradient(90deg, #aae1fe, #eef9fe);
	background: -moz-linear-gradient(center top, #aae1fe 5%, #eef9fe 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #aae1fe
		), color-stop(1, #eef9fe));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#aae1fe',
		endColorstr='#eef9fe');
}

#table1 tr:nth-child(even) {
	background-color: #fdfdfd table{ 
	width: 100%;
	margin: 0px auto;
	border-top: 2px double darkblue;
	border-bottom: 2px double darkblue;
	border-spacing: 0px;
}


</style>
<%
String sid=(String)session.getAttribute("sid");
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


</head>
<body>

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
<div id="content">
			<h2>공지사항</h2>
			<table id="table1">
					<thead>
						<tr>
							<th>순번</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="3" align="center">
								<%
						if(userGroup!=0) {
							%><a href="noticeList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
								<%
							 }
						for(int i=userGroup*pageSize+1; i<=userGroup*pageSize+pageSize; i++) {
							%> &nbsp;&nbsp;<a href="noticeList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
							if(i==totalPage) {
								break;
								}
							}
						if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))) {
							%> <a href="noticeList.jsp?cp=<%=((userGroup+1)*pageSize+1)%>">&gt;
									&gt;</a> <%
							}
						%>
							</td>
							<% if("admin".equals(sid)) { %>
							<td><input type="button" value="글쓰기" onclick="location.href='noticeWrite.jsp'"></td>
							<% } %>
						</tr>
					</tfoot>
					<tbody>
						<%
					ArrayList<noticeDTO> adto = bdao.noticeList(cp, listSize);
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
							<td><a
								href="noticeContent.jsp?NOTICE_NO=<%=adto.get(i).getNotice_no()%>"><%=adto.get(i).getSubject() %></a></td>
							<td><%=adto.get(i).getInsert_date()%></td>
							<td><%=adto.get(i).getBoard_count() %></td>
						</tr>
						<%
							}
										}
						%>
					</tbody>
				</table>

</div>

<div id="footer">
<%@include file="/footer.jsp" %>
</div>
</div>

</body>
</html>				