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
			<li>test<ul class="menu">
				<li>t1</li>
				<li>t2</li>
				<li>t3</li>
			</ul></li>	
		</ol>
	</nav>
	<div></div>
</header>