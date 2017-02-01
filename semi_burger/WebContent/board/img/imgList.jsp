<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@page import="board.img.*"%>
<jsp:useBean id="bdao" class="board.img.imgDAO" />
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
  
  #bmenu{
	position: fixed;
	top:200px;
	left:100px;
	width:250px;
	text-align:center;
}
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
  
 </style>
<%
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

	<%@include file="/header.jsp" %>
	
	<div id="bmenu">
			<h2>커뮤니티</h2>
			<ul>
				<li><a href="#"><img src="/semi_burger/img/notice.jpg" /></a></li>
				<li><a href="#">창업문의</a></li>
				<li><a href="#">고객의 소리</a></li>
				<li><a href="#">내가 만든 햄버거</a></li>
				<li><a href="#">이벤트</a></li>
			</ul>
	</div>
	
	
<h2>내가 만든 햄버거</h2>
<div id="container">
	


   <div id="content">
   
   <table >
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
							%><a href="imgList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
							<%
							 }
						for(int i=userGroup*pageSize+1; i<=userGroup*pageSize+pageSize; i++) {
							%> &nbsp;&nbsp;<a href="imgList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
							if(i==totalPage) {
								break;
								}
							}
						if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))) {
							%> <a href="imgList.jsp?cp=<%=((userGroup+1)*pageSize+1)%>">&gt;
								&gt;</a> <%
							}
						%>
						</td>
						<% if("관리자".equals(sname)) { %>
							<td><a href="imgWrite.jsp">글쓰기</a></td>
						<% } %>
					</tr>
				</tfoot>
				<tbody>
					<%
					ArrayList<imgDTO> adto = bdao.imgList(cp, listSize);
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
						<td><%=adto.get(i).getImg_board_no()%></td>
						<td>
						
						<a href="imgContent.jsp?IMG_BOARD_NO=<%=adto.get(i).getImg_board_no()%>"><%=adto.get(i).getSubject() %></a></td>
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
</div>

	<%@include file="/footer.jsp" %>

</body>
</html>				