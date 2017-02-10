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
<title>Yong Burger</title>
<script>
	function init() {
		alert(1);
	}
</script>
<style>
th div{
	height:0px;
	border-bottom:20px solid #DFDFDF;
	border-right: 00px solid white;
}
td{
	text-align:center;
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
					<div style="background:url(/semi_burger/introduce/img/sub_top_bg02.jpg) 50% 50% no-repeat;opacity: 0.85;">
			<br>
			<h2 style="color:white;" id="burgerevent">&nbsp;&nbsp;Q & A</h2>
			<br>
			</div>
			
		<%@include file="../sideMenuBar.jsp" %>

<div id="content">

<br>
				<table>
				<thead>
					<tr>
						<th><div style="width:80px">순번</div></th>
						<th><div style="width:440px">제목</div></th>
						<th><div style="width:140px">작성자</div></th>
						<th><div style="width:90px">조회수</div></th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="3" align="center">
							<%
						if(userGroup!=0) {
							%><a href="QAList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>" class="a">&lt;&lt;</a>
							<%
							 }
						for(int i=userGroup*pageSize+1; i<=userGroup*pageSize+pageSize; i++) {
							%> &nbsp;&nbsp;<a href="QAList.jsp?cp=<%=i%>" class="a"><%=i%></a>&nbsp;&nbsp;<%
							if(i==totalPage) {
								break;
								}
							}
						if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))) {
							%> <a href="QAList.jsp?cp=<%=((userGroup+1)*pageSize+1)%>" class="a">&gt;
								&gt;</a> <%
							}
						%>
						</td>

					</tr>
				</tfoot>
				<tbody class="a">
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
						<a class="a" href="QAContent.jsp?idx=<%=arr.get(i).getQna_no()%>" class="a"><%=arr.get(i).getSubject() %></a>
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
			<div align="right" style="width:768px;">
<<<<<<< HEAD
			<div class="ol_div" style="width:70px; text-align: center;"><a href="QAWrite.jsp">글쓰기</a></div>
				
=======
				<div class="ol_div" style="width:70px;text-align: center;"><a href='QAWrite.jsp'>글쓰기</a></div>
>>>>>>> branch 'master' of https://github.com/yongburger/semi_burger.git
			</div>

		</div>

<div id="footer">
<%@include file="/footer.jsp" %>
</div>
</div>
	

</body>
</html>