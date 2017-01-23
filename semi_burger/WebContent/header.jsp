<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
<%
	String sname = (String)session.getAttribute("sname");
	
	if(sname==null){
		%><!-- 로그인 전 -->
		<li><a href="/semi_burger/member/login.jsp">로그인</a> | 회원가입 </li> 						
		<%
	} else {
		%> <!-- 로그인 후 -->
		<li><a> <%=sname %> 님 로그인 중</a> | <a href="/semi_burger/member/logout.jsp"> 로그아웃 </a></li>			
		<%
	}
%>
	<nav>
		<ol class="bigmenu">
			<li><a href="/semi_burger/index.jsp">Home</a></li>
			<li><a>소개</a>
			<ul class="menu">
				<li>so1</li>
				<li>so2</li>
				<li>so3</li>
			</ul>
			</li>
			<li>메뉴<ul class="menu">
				<li>m1</li>
				<li>me2</li>
				<li>men3</li>
			</ul></li>
			<li><a href="#">주문</a></li>	
			<li>My Burger<ul class="menu">
				<li><a href="/semi_burger/orderCheck.jsp">주문 조회</a></li>
				<li>myB</li>
			</ul></li>	
		</ol>
	</nav>
</header>