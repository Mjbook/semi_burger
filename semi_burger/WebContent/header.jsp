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

#newMenu {
	float: right;
	padding: 15px 0 8px 0;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, .3);
	border-radius: 3px;
	width: 1000px;
	height: 30px;
}


#newMenu ul li {
	float: left;
	list-style-type: none;
}

#newMenu a {
	height: 30px;
	color: #990033;
	font-family: 'Malgun Gothic';
	font-size: 16px;
	padding: 10px 10px 0 10px;
	text-decoration: none;

}
#bi {

	text-align: center;
	font-size:12px;

}

#newMenu a:hover {
	color: #cc3300;
	border-bottom: 3px solid;
	text-aling: center;
}

#newMenu ul ul {
	display: none;
	position: absolute;
	background-color: #FFFFCC;
}

#newMenu ul li:hover ul {
	display: block;
	width: 18%;
}

#newMenu ul ul li {
	float: none;
	font-size:12px;
}
</style>
<script>
	function game() {
		window.open('/semi_burger/burgerGame/index.html','gameopoup','width=1000,height=700');
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
		<div id="newMenu">
		<ul>
			<li class ="menu"><a href="/semi_burger/index.jsp">HOME &nbsp;&nbsp;&nbsp;&nbsp;</a></li>

			<li><a href="#">소개  &nbsp;&nbsp;&nbsp;&nbsp;</a>

				<ul>
					<li><a href="/semi_burger/introduce/ceo.jsp">CEO 인사말</a></li>
					<li><a href="/semi_burger/introduce/story.jsp">YONG BURGER</a></li>					
					<li><a href="/semi_burger/introduce/road.jsp">찾아오시는길</a></li>
				</ul>
				</li>

			<li><a href="#">메뉴 &nbsp;&nbsp;&nbsp;&nbsp;</a>

				<ul>
					<li><a href="/semi_burger/burgerMenu/burgerMenu.jsp" >햄버거</a></li>
					<li><a href="/semi_burger/burgerMenu/burgerMenu.jsp#side">사이드</a></li>
					<li><a href="/semi_burger/self/selfBurger.jsp">내맘대로 햄버거</a></li>
					<li><a href="/semi_burger/burgerMenu/eventMenu.jsp">이벤트 메뉴</a></li>
					<li><a href="#">재료 원산지 표기</a></li>
				</ul>
				</li>
				
					<li><a href="#">My burger &nbsp;&nbsp;&nbsp;&nbsp;</a>

				<ul>
					<li><a href="/semi_burger/member/updateinfo.jsp">회원정보 수정</a></li>
					<li><a href="/semi_burger/order/orderCheck.jsp">주문 조회</a></li>
				</ul>
				</li>
				
					<li><a href="#">커뮤니티 &nbsp;&nbsp;&nbsp;&nbsp; </a>

				<ul>
					<li><a href="/semi_burger/board/notice/notice.jsp">공지사항</a></li>
					<li><a href="/semi_burger/board/QnA/QAList.jsp">창업문의</a></li>
					<li><a href="#">내맘대로 햄버거 자랑</a></li>
					<li><a href="javascript:game()">게임하기</a></li>
				</ul>
				</li>

		</ul>
		</div>
	</nav>
</header>