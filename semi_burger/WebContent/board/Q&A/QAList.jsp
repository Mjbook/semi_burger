<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="board.board.notice.QA.*"%>
<jsp:useBean id="bdao" class="board.board.notice.QA.QADAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	text-align: center;
}

table {
	width: 550px;
	margin: 0px auto;
	border-top: 2px double darkblue;
	border-bottom: 2px double darkblue;
	border-spacing: 0px;
}

table th {
	background: skyblue;
}
</style>
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
	<section>
		<article>
			<h2>자 유 게 시 판</h2>
			<table>
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
						<td><a href="QAWrite.jsp">글쓰기</a></td>
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
						<%
							for(int z=0; z<arr.get(i).getLev(); z++) {
								out.print("&nbsp;&nbsp;");
							}
						%>
						<a href="QAContent.jsp?idx=<%=arr.get(i).getQna_no()%>"><%=arr.get(i).getSubject() %></a></td>
						<td><%=arr.get(i).getName()%></td>
						<td><%=arr.get(i).getBoard_count() %></td>
					</tr>
					<%
							}
						}
					%>
				</tbody>
			</table>

		</article>

	</section>
	<%@ include file="../../footer.jsp"%>
</body>
</html>