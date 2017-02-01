<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");

	String sid = (String)session.getAttribute("sid");
		
	String confirm = request.getParameter("result");
	int result = mdao.DelMember(sid);
	%>
	<script>
	window.alert('<%= confirm%>');
	</script>
	
