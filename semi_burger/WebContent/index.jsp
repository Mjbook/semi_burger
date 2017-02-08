<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@page import="board.notice.*"%>
<jsp:useBean id="bdao" class="board.notice.noticeDAO" />
<%@ page import="board.knowhow.*" %>
<jsp:useBean id="cdao" class="board.knowhow.knowhowDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<%
	int totalCnt = bdao.getTotalCnt();//총 게시물 수
	int listSize = 6;//보여줄 리스트 수
	int pageSize = 3;//보여줄 페이지 수
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
<style>
 @keyframes slidy {
0% { left: 0%; }
20% { left: 0%; }
25% { left: -100%; }
45% { left: -100%; }
50% { left: -200%; }
70% { left: -200%; }
75% { left: -300%; }
95% { left: -300%; }
100% { left: -400%; }
}
#slider { overflow: hidden; }
#slider figure img { 
width: 20%;
float: left; 
padding-bottom: 15px;
}
#slider figure { 
  position: relative;
  width: 500%;
  margin: 0;
  top:0;
  left: 0;
  text-align: left;
  font-size: 0;
  -webkit-animation: 20s slidy ease-in-out infinite;
  animation: 20s slidy ease-in-out infinite; 
}
#S_menu ing{
width: 20%;
height: 350px;
float: left; 
padding-bottom: 15px;
}
</style>
</head>
<body>

<div id="container">
<div id="header">
<%@include file="header.jsp" %>	
</div>	
<div id="slider">
	<figure>
		<img src="img/event1.png">
		<img src="img/event2.png">
		<img src="img/event3.png">
		<img src="img/event4.png">
		<img src="img/event5.png">
	</figure>
</div>
	<div>
			<div id="mainFont" align="left">
			   <img src="introduce/img/hat.png" width="25px;"> YongBurger Menu
			   <br>
			</div>
			
			<div>
				<div id="S_menu" align="center"><a href="/semi_burger/burgerMenu/burgerMenu.jsp"> <img src="img/burger.png"></a> <br> 햄버거	</div>
				<div id="S_menu" align="center"><a href="/semi_burger/burgerMenu/burgerMenu.jsp#side"> <img src="img/side.png"></a> <br> 사이드메뉴	</div>
				<div id="S_menu" align="center"><a href="/semi_burger/self/selfBurger.jsp"><img src="img/miniburger.jpg"></a> <br> 시그니처</div>
				<div id="S_menu1" align="center"><a href="/semi_burger/burgerMenu/burgerMenu.jsp#event"> <img src="img/1.png"></a>  <br> 이벤트메뉴   </div>
				<br>
			<br>		
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			</div>	
			
			<div id="mainFont" align="left">
			  <img src="introduce/img/hat.png" width="25px;"> YongBurger News
			</div>			
				<div id ="mainnotice">
			 	<div id="tableFont" align="center"> NOTICE
				</div>
					<table>
						<tbody>
							<%
					ArrayList<noticeDTO> adto = bdao.noticeList(cp, listSize);
					if (adto == null || adto.size() == 0) {
							%>
							<tr>
								<td colspan="3" align="center">등록된 게시글이 없습니다.</td>
							</tr>
							<%
					} else {
						for (int i = 0; i < adto.size(); i++) {
								%>
							<tr>
								<td><%=adto.get(i).getNotice_no()%></td>
								<td colspan="1" align="center"><a
									href="./board/notice/noticeContent.jsp?NOTICE_NO=<%=adto.get(i).getNotice_no()%>"><%=adto.get(i).getSubject() %></a></td>
							</tr>
							<%
							}
						}
					%>
						</tbody>
					</table>
					</div>
					<%
					ArrayList<knowhowDTO> cdto = cdao.knowhowList(cp, 3);
					%>
				<div id="maincenter">
							 	<div id="tableFont" align="center" > USER BURGERS </div>
							 	<table> 
							 	<%

						if (cdto == null || cdto.size() == 0) {
						%>
							<br>
								<center>등록된 게시물이 없습니다</center>
							<br>
							</table>
						<%
						} else {
							%>
													</table>
							<div id="slider">
								<figure>
								<%
									for( int i =0; i <cdto.size(); i++) {
										%>
									<a href="board/knowhow/knowhowList.jsp" style="cursor:pointer;"><img src="<%= pageContext.getServletContext().getContextPath() %>/<%=cdto.get(i).getMy_img_url() %>" width="50%" height="50%" onclick="onView('<%=cdto.get(i).getKnowhow_no()%>');" /></a>
										<%	
									}
						}
						%>
								</figure>
						</div>	

						</div>
					
					
					
				<div id="maincenter1">
					<div id="tableFont" align="center"> BURGER STORE</div>
					<a href="introduce/road.jsp"><img src="img/location.png"></a>
					<a href="#"><img src="img/gameimg.png" onclick="javascript:game()"></a>
				</div>
				</div>
				<div id="footer">
					<%@include file="footer.jsp"%>
				</div>
			</div>
			</body>
</html>