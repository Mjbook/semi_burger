<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
<style>
div, ul, li {
	margin: 0;
	padding: 0;
}

nav ul{
float:right;
}

#newMenu {
	float: right;
	margin: 0px 5px 3px 5px;
	padding: 0 0 3px 0;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, .3);
	border-radius: 3px;
	width:1000px;
}

#newMenu ul li {
	float: left;
	list-style-type: none;
}

#newMenu a {
	height: 20px;
	color: #990033;
	font-family: 'Malgun Gothic';
	font-size: 15px;
	padding: 0 10px 0 10px;
	text-decoration: none;
}

#newMenu a:hover {
	color: #cc3300;
	border-bottom: 3px solid;
}

#newMenu ul ul {
	display: none;
	position: absolute;
	background-color: #FFFFCC;
}

#newMenu ul li:hover ul {
	display: block;
}
#hie li ui {
display: none;
float: none;
list-style:none;
}

#newMenu ul ul li {
	float: none;
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
			<li class ="menu"><a href="/semi_burger/index.jsp">HOME</a></li>

			<li><a href="#">소개 </a>

				<ul>
					<li><a href="/semi_burger/story.jsp">YONG STORY</a></li>
					<li><a href="#">CEO 인사말</a></li>
					<li><a href="#">찾아오시는길</a></li>
				</ul>
				</li>

			<li><a href="#">메뉴</a>

				<ul>
					<li><a href="/semi_burger/burgerMenu/burgerMenu.jsp">햄버거</a></li>
					<li><a href="/semi_burger/burgerMenu/burgerMenu.jsp#side">사이드</a></li>
					<li><a href="/semi_burger/self/selfBurger.jsp">내맘대로 햄버거</a></li>
					<li><a href="/semi_burger/burgerMenu/eventMenu.jsp">이벤트 메뉴</a></li>
					<li><a href="#">재료 원산지 표기</a></li>
				</ul>
				</li>
				
					<li><a href="#">My burger</a>

				<ul>
					<li><a href="/semi_burger/order/orderCheck.jsp">주문 조회</a></li>
				</ul>
				</li>
				
					<li><a href="#">커뮤니티</a>

				<ul>
					<li><a href="/semi_burger/board/notice/notice.jsp">공지사항</a></li>
					<li><a href="/semi_burger/board/QnA/QAList.jsp">창업문의</a></li>
					<li><a href="#">내맘대로 햄버거 자랑</a></li>
					<li><a href="javascript:game()">게임하기</a></li>
				</ul>
				</li>

		</ul>
				<%
					if (sname == null) {
				%>
				<li style="list-style:none";>&nbsp;&nbsp;<ul class="menu">
						<%
							} else {
						%>
						<li><%=sname%>님
							<ul class="menu">
								<%
									}
									if (sname == null) {
								%>
								<li><a href="/semi_burger/member/login.jsp">로그인</a></li>
								<li><a href="/semi_burger/member/join.jsp"> 회원가입</a></li>
								<%
									} else {
								%>
								<li><a href="/semi_burger/member/updateinfo.jsp?"> 정보수정</a>
								</li>
								<li><a href="/semi_burger/member/logout.jsp"> 로그아웃</a></li>
							</ul></li>
						<% }
						%>
			</div>
			</nav>
</header>