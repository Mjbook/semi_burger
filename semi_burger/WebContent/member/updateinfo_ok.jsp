<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %> 

<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>
<jsp:useBean id="mdto" class="member.MemberDTO"/> 
<jsp:setProperty property="*" name="mdto"/>

<%
	int result = mdao.UpdateInfo(mdto);

	if(result>0){
		%>
		<script>
		window.alert('수정되었습니다');
		location.href='/semi_burger/index.jsp';
		</script>
		<%
	} else{
		%>
		<script>
		window.alert('수정 실패');
		location.href='/semi_burger/index.jsp';
		</script>
		<%
	}
%>