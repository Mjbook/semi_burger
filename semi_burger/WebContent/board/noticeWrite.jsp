<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="board.notice.*"%>
<jsp:useBean id="bdao" class="board.notice.noticeDAO" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<div>

		<div>
			<div>
				<form action="noticeWrite_ok.jsp">
					<h1>공지사항 상세 페이지</h1>
					<div class="notice_view">
						<div>

							<p>
								<input type="text" name="subject" placeholder="제목을 입력하세요." />
							</p>
						</div>
						<div class="notice_cts">
							<textarea name="content" placeholder="내용을 입력하세요."></textarea>
						</div>
					</div>
					<div>
						<a href="notice.jsp">취소</a> <input type="submit" value="완료">
					</div>
				</form>
			</div>
		</div>
	</div>
<%@include file="../footer.jsp"%>
</body>
</html>