<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>
<jsp:useBean id="mdto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>

<%
	int result = mdao.memberJoin(mdto);
	
	if(result>0){	
		%>
		<script>
		window.alert('회원가입 완료.\n환영합니다 ^^');
		location.href='/semi_burger/member/login.jsp';
		</script>
		<%
	} else{
		%>
		<script>
		window.alert('고객센터로 연락주세요');
		history.back();
		</script>
		<%
	}
	
%>