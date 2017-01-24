<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@page import="board.notice.*"%>
<jsp:useBean id="bdao" class="board.notice.noticeDAO" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	<section>
		<div>
			<h2>커뮤니티</h2>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">창업문의</a></li>
				<li><a href="#">고객의 소리</a></li>
				<li><a href="#">내가 만든 햄버거</a></li>
				<li><a href="#">이벤트</a></li>
			</ul>
		</div>
		<hr>

		<div>
			<span></span>
			<ul>
				<li>Home</li>
				<li>></li>
				<li>메뉴소개</li>
				<li>></li>
				<li>공지사항</li>
			</ul>
			<h3>공지사항</h3>
			<div>
				<div">

					<h2>제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일</h2>

					<div>
						<ul>
							<%
								ArrayList<noticeDTO> adto = bdao.noticeList(cp, listSize);
								if (adto == null || adto.size() == 0) {
							%>
							<li>조회된 결과가 없습니다.</li>
							<%
								} else {
									for (int i = 0; i < adto.size(); i++) {
							%>

							<li><a
								href="noticeContent.jsp?NOTICE_NO=<%=adto.get(i).getNotice_no()%>"><%=adto.get(i).getSubject()%></a>
								<span class="date"><%=adto.get(i).getInsert_date()%></span></li>

							<%
								}
								}
							%>
						</ul>

					</div>
					<div>
						<a href="noticeWrite.jsp">글쓰기</a>
					</div>

				</div>
			</div>
		</div>

	</section>

	<%@include file="../../footer.jsp"%>
</body>
</html>