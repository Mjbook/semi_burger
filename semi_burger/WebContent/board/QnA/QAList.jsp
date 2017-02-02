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
<style>
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

#su{
	text-align: left;

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
<%@include file="/header.jsp" %>

			<h2>QNA</h2>
	<div id="sideMenu">
		<h2 align="center">커뮤니티</h2>
		<ul>
			<li><a href="/semi_burger/board/notice/notice.jsp">공지사항</a></li>
			<li><a href="/semi_burger/board/QnA/QAList.jsp">창업문의</a></li>
			<li><a href="#">내가 만든 햄버거</a></li>
			<li><a href="javascript:game()">게임하기</a></li>
		</ul>
	</div>

	<div id="container">
   <div id="content">
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
						<td id="su">
						<%
							for(int z=0; z<arr.get(i).getLev(); z++) {
								out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
							}
						%>
						<a href="QAContent.jsp?idx=<%=arr.get(i).getQna_no()%>"><%=arr.get(i).getSubject() %></a></td>
						<td><%=arr.get(i).getName()%></td>
						<td><%=arr.get(i).getBoard_count()%></td>
					</tr>
					<%
							}
						}
					%>
				</tbody>
			</table>
   
   </div>
</div>
	
	<%@include file="/footer.jsp" %>
</body>
</html>