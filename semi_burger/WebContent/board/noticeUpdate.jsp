<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="board.notice.*"%>
<jsp:useBean id="bdao" class="board.notice.noticeDAO" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
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

<body >

	<div>
		<div>
			<form action="noticeUpdate_ok.jsp">
				<h1>공지사항 상세 페이지</h1>
				<div class="notice_view">
					<div class="notice_tit">

						<p class="tit">
							<input type="text" name="subject" placeholder="제목을 입력하세요." />
						</p>
					</div>
					<div class="notice_cts">
						<textarea name="content" placeholder="내용을 입력하세요."></textarea>
					</div>
				</div>
				<div>
					<a href="notice.html">취소</a> <input type="hidden" name="notice_no"
						value=<%=idx%> /> <input type="submit" value="완료"
						class="btn_type_02" />
				</div>
			</form>
		</div>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>
