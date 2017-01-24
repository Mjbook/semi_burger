<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
<%
	String sname = (String)session.getAttribute("sname");
	
	if(sname==null){
		%><!-- 로그인 전 -->
		<p><a href="/semi_burger/member/login.jsp">로그인</a> | <a href="/semi_burger/member/join.jsp"> 회원가입</a> </p> 						
		<%
	} else {
		%> <!-- 로그인 후 -->
		<p><a> <%=sname %> 님 로그인 중</a> | <a href="/semi_burger/member/updateinfo.jsp?"> 정보 수정</a> | <a href="/semi_burger/member/logout.jsp"> 로그아웃</a></p>			
		<%
	}
%>
	<nav>
		<ol class="bigmenu">
			<li><a href="/semi_burger/index.jsp">Home</a></li>
			<li><a>소개</a>
			<ul class="menu">
				<li>YONG STORY</li>
				<li>CEO 인사말</li>
				<li>찾아오시는 길</li>
				<li>매장 검색</li>
			</ul>
			</li>
			<li>메뉴<ul class="menu">
				<li>햄버거</li>
				<li>사이드</li>
				<li>이벤트 메뉴</li>
				<li>내가 만드는 햄버거</li>
				<li>재료 원산지 표기</li>
			</ul></li>
			<li><a href="/semi_burger/order/order.jsp">주문</a></li>	
			<li>My Burger<ul class="menu">
				<li><a href="/semi_burger/order/orderCheck.jsp">주문 조회</a></li>
				<li>myB</li>
			</ul></li>	
				<li>커뮤니티<ul class="menu">
				<li><a href="/semi_burger/board/notice.jsp">공지사항</a></li>
				<li>창업 문의</li>
				<li>고객의 소리</li>
				<li>내가 만든 햄버거</li>
				<li>이벤트</li>
			</ul></li>
		</ol>
	</nav>
</header>