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
			<li><B><a href="/semi_burger/index.jsp">HOME &nbsp;&nbsp;&nbsp;&nbsp;</a></B></li>

			<li class="firstli"><b><a href="#">소개  &nbsp;&nbsp;&nbsp;&nbsp;</a></b>

				<ul>
					<li><a href="/semi_burger/introduce/ceo.jsp">CEO 인사말</a></li>
					<li><a href="/semi_burger/introduce/story.jsp">YONG BURGER</a></li>					
					<li><a href="/semi_burger/introduce/road.jsp">찾아오시는길</a></li>
				</ul>
				</li>

			<li class="firstli"><b><a href="#">메뉴 &nbsp;&nbsp;&nbsp;&nbsp;</a></b>

				<ul>
					<li><a href="/semi_burger/burgerMenu/burgerMenu.jsp" >햄버거</a></li>
					<li><a href="/semi_burger/burgerMenu/burgerMenu.jsp#side" >사이드</a></li>
					<li><a href="/semi_burger/burgerMenu/burgerMenu.jsp#event" >이벤트 메뉴</a></li>
					<li><a href="/semi_burger/self/selfBurger.jsp">시그니처 버거</a></li>
					<li><a href="#">재료 원산지 표기</a></li>
				</ul>
				</li>
				
					<li class="firstli"><b><a href="#">My burger &nbsp;&nbsp;&nbsp;&nbsp;</a></b>

				<ul>
					<%
						String userid=(String)session.getAttribute("sid");
					
						if(userid==null){
							%>
							<li><a href="/semi_burger/order/orderList.jsp" >비회원 주문</a></li>
							<%
						} else{
							%>
							<li><a href="/semi_burger/member/updateinfo.jsp">회원정보 수정</a></li>
							<li><a href="/semi_burger/order/orderCheck.jsp">주문 조회</a></li>
							<%
						}
						%>
				</ul>
				</li>
				
					<li class="firstli"><b><a href="#">커뮤니티 &nbsp;&nbsp;&nbsp;&nbsp; </a></b>

				<ul>
					<li><a href="/semi_burger/board/notice/notice.jsp">공지사항</a></li>
					<li><a href="/semi_burger/board/QnA/QAList.jsp"> QnA</a></li>
					<li><a href="/semi_burger/board/knowhow/knowhowList.jsp">My Burger</a></li>
					<li><a href="javascript:game()">게임하기</a></li>
				</ul>
				</li>

		</ul>
		</div>
	</nav>
</header>