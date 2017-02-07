<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="board.QA.*"%>
<jsp:useBean id="bdao" class="board.QA.QADAO" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<title>Insert title here</title>
<script>
	function init() {
		alert(1);
	}
</script>
</head>
<%
int totalCnt=bdao.getTotalCnt(); //총 게시물 수 
int listSize=10; //보여줄 리스트 수
int pageSize=4; // 보여줄 페이지 수
String cp_s=request.getParameter("cp");
if(cp_s==null || cp_s.equals("")) {
	cp_s="1";
}
int cp=Integer.parseInt(cp_s); // 현재 위치
int totalPage= totalCnt/listSize+1;
if(totalCnt%listSize==0){
	totalPage--;
}

int userGroup=cp/pageSize;
if(cp%pageSize==0) {
	userGroup--;
}
%>
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
				<li><a href="/semi_burger/board/knowhow/knowhowList.jsp">내가 만든 햄버거</a></li>
				<li><a href="javascript:game()">게임하기</a></li>
			</ul>

</div>
<div id="content">
		<h2>창업문의</h2>
				<table id="tableList">
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
							%><a href="QAList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
							<%
							 }
						for(int i=userGroup*pageSize+1; i<=userGroup*pageSize+pageSize; i++) {
							%> &nbsp;&nbsp;<a href="QAList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
							if(i==totalPage) {
								break;
								}
							}
						if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))) {
							%> <a href="QAList.jsp?cp=<%=((userGroup+1)*pageSize+1)%>">&gt;
								&gt;</a> <%
							}
						%>
						</td>

					</tr>
				</tfoot>
				<tbody>
					<%
						ArrayList<QADTO> arr = bdao.QAList(cp,listSize);
						if (arr == null || arr.size() == 0) {
							%>
					<tr>
						<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
					</tr>
					<%
						}else {
							for(int i=0; i<arr.size(); i++){
								%>
					<tr>
						<td><%=arr.get(i).getQna_no()%></td>
						<td>
						<div align="left">
						<%
							for(int z=0; z<arr.get(i).getLev(); z++) {
								out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
							}
						%>
						<a href="QAContent.jsp?idx=<%=arr.get(i).getQna_no()%>"><%=arr.get(i).getSubject() %></a>
						</div></td>
						<td><%=arr.get(i).getName()%></td>
						<td><%=arr.get(i).getBoard_count()%></td>
					</tr>
					<%
							}
						}
					%>
				</tbody>

			</table>
			<div align="right">
				<input type="button" value="글쓰기" onclick="location.href='QAWrite.jsp'">
			</div>

		</div>

<div id="footer">
<%@include file="/footer.jsp" %>
</div>
</div>
	

</body>
</html>