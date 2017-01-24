<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.*" %>
	
<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("id");
	String userpwd = request.getParameter("pwd");
	
	int result = mdao.memberLogin(userid, userpwd);
	
	if(result==mdao.LOGIN_OK){
		
		String username = mdao.getUserInfo(userid);
				
		session.setAttribute("sid", userid); 
		session.setAttribute("sname", username);		
		
		%>
		<script>
		window.alert('로그인 성공!');
		location.href='/semi_burger/index.jsp';
		</script>
		<%
	} else if(result==mdao.NOT_PWD){
		%>
		<script>
		window.alert('비밀번호를 확인해주세요');
		location.href='/semi_burger/member/login.jsp';
		</script>
		<%
	} else if(result==mdao.NOT_ID){
		%>
		<script>
		window.alert('존재하지 않는 ID입니다');
		location.href='/semi_burger/member/login.jsp';
		</script>
		<%
	} else {
		%>
		<script>
		window.alert('고객센터로 연락주세요~');
		location.href='/semi_burger/member/login.jsp';
		</script>
		<%
	}
%>
