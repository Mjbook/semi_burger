<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
<style>
div, ul, li {
	margin: 0;
	padding: 0;
}

nav ul {
	float: right;
}

</style>
<script>
	function game() {
		window.open('/semi_burger/burgerGame/index.html','gameopoup','width=1000,height=700');
	}

</script>
<div id="headerback" style="cursor:pointer;">
<style>
	a:link{
		text-decoration: none;
	}	
	a:active{
		text-decoration: none;
	}
	a:visited{
		text-decoration: none;
	}
	a:hover{
		text-decoration: none;
		color: gray;
	}
</style>


	<nav>
		<div id="newMenu">
		<%
		String sname = (String)session.getAttribute("sname");
		if(sname==null){
		%><!-- 로그인 전 -->
		<p><a href="/semi_burger/member/login.jsp">로그인</a> | <a href="/semi_burger/member/agree.jsp"> 회원가입&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> </p> 						
		<%
		} else {
		%> <!-- 로그인 후 -->
		<p><%=sname %> 님 로그인 중 | <a href="/semi_burger/member/logout.jsp"> 로그아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></p>		
		<%
		}
		%>
		<ul>
			<li><a href="/semi_burger/index.jsp">HOME &nbsp;&nbsp;&nbsp;&nbsp;</a></li>

			<li class="firstli"><a href="#">소개  &nbsp;&nbsp;&nbsp;&nbsp;</a>

				<ul>
					<li><a href="/semi_burger/introduce/ceo.jsp">CEO 인사말</a></li>
					<li><a href="/semi_burger/introduce/story.jsp">YONG BURGER</a></li>					
					<li><a href="/semi_burger/introduce/road.jsp">찾아오시는길</a></li>
				</ul>
				</li>

			<li class="firstli"><a href="#">메뉴 &nbsp;&nbsp;&nbsp;&nbsp;</a>

				<ul>
					<li><a href="/semi_burger/burgerMenu/burgerMenu.jsp" >햄버거</a></li>
					<li><a href="javascript:go_scroll(1200)" onclick="/semi_burger/burgerMenu/burgerMenu.jsp">사이드</a></li>
					<li><a href="javascript:go_scrollevent(2400)" onclick="/semi_burger/burgerMenu/burgerMenu.jsp">이벤트 메뉴</a></li>
					<li><a href="/semi_burger/self/selfBurger.jsp">내맘대로 햄버거</a></li>
					<li><a href="#">재료 원산지 표기</a></li>
				</ul>
				</li>
				
					<li class="firstli"><a href="#">My burger &nbsp;&nbsp;&nbsp;&nbsp;</a>

				<ul>
					<li><a href="/semi_burger/member/updateinfo.jsp">회원정보 수정</a></li>
					<li><a href="/semi_burger/order/orderCheck.jsp">주문 조회</a></li>
				</ul>
				</li>
				
					<li class="firstli"><a href="#">커뮤니티 &nbsp;&nbsp;&nbsp;&nbsp; </a>

				<ul>
					<li><a href="/semi_burger/board/notice/notice.jsp">공지사항</a></li>
					<li><a href="/semi_burger/board/QnA/QAList.jsp">창업문의</a></li>
					<li><a href="/semi_burger/board/knowhow/knowhowList.jsp">내맘대로 햄버거 자랑</a></li>
					<li><a href="javascript:game()">게임하기</a></li>
				</ul>
				</li>

		</ul>
		</div>
	</nav>
</header>