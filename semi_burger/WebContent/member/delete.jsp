<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<%
	String userid = (String)session.getAttribute("uid"); 
	
	int result = mdao.DelMember(userid);
	
	String msg = result>0? "탈퇴되었습니다" : "탈퇴 실패";

%>
<script>
	window.alert('<%= msg%>');
	location.href='/semi_burger/index.jsp'; 
</script>