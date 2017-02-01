<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
<script>
	function game() {
		window.open('/semi_burger/game/test/index.html','gameopoup','width=1000,height=700');
	}

</script>
<div id="headerback">
<%
	String sname = (String)session.getAttribute("sname");
	
	if(sname==null){
		%><!-- 로그인 전 -->
		<p><a href="/semi_burger/member/login.jsp">로그인</a> | <a href="/semi_burger/member/join.jsp"> 회원가입</a> </p> 						
		<%
	} else {
		%> <!-- 로그인 후 -->
		<p><a> <%=sname %> 님 로그인 중</a> | <a href="/semi_burger/member/logout.jsp"> 로그아웃</a></p>			
		<%
	}
%>
	<nav>
		<ol class="bigmenu">
			<li><a href="/semi_burger/index.jsp">Home</a></li>
			<li><a>소개</a>
			<ul class="menu">
				<li> <a href="/semi_burger/story.jsp">YONG STORY</a> </li>
				<li> <a>CEO 인사말</a> </li>
				<li>찾아오시는 길</li>
				<li><a href="javascript:game()">매장 검색</a></li>
			</ul>
			</li>
			<li>메뉴<ul class="menu">
				<li><a href="/semi_burger/burgerMenu/burgerMenu.jsp">햄버거</a></li>
				<li><a href="/semi_burger/burgerMenu/burgerMenu.jsp#side">사이드</a></li>
				<li>이벤트 메뉴</li>
				<li>내가 만드는 햄버거</li>
				<li>재료 원산지 표기</li>
			</ul></li>
			<li>My Burger<ul class="menu">
				<li><a href="/semi_burger/order/orderCheck.jsp">주문 조회</a></li>
				<li>myB</li>
			</ul></li>	
				<li>커뮤니티<ul class="menu">
				<li><a href="/semi_burger/board/notice/notice.jsp">공지사항</a></li>
				<li><a href="">창업 문의</a></li>
				<li><a href="/semi_burger/board/QnA/QAList.jsp">Q&A</a></li>
				<li><a href="/semi_burger/board/img/imgList.jsp">내가 만든 햄버거</a></li>
				<li><a href="">이벤트</a></li>
			</ul></li>
			<%	if(sname==null){
					%>
					<li> &nbsp;&nbsp;<ul class="menu">
					<%
				}else{
					%>			
					<li> <%= sname%>님<ul class="menu">
					<%
				}
				if(sname==null){
				%>				
				<li> <a href="/semi_burger/member/login.jsp">로그인</a> </li>
				<li> <a href="/semi_burger/member/join.jsp"> 회원가입</a> </li>
				<li> <a> ID/PW 찾기 </a> </li>
				<%
				} else{
				%>
				<li> <a href="/semi_burger/member/updateinfo.jsp?"> 정보수정</a> </li>
				<li> <a href="/semi_burger/member/delete.jsp"> 탈퇴하기</a> </li>
				<li> <a href="/semi_burger/member/logout.jsp"> 로그아웃</a> </li>
			</ul></li>
				<%
				}
			%>
				
				
				
			
		</ol>
	</nav>
	</div>
</header>