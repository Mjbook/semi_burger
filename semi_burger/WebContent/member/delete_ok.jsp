<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");

	String sid = (String)session.getAttribute("sid");
		
	int result = mdao.DelMember(sid);
		
	if(result>0){
		%>
		<script>
		window.alert('탈퇴되었습니다');
		<%
		session.invalidate();
		%>
		window.self.close();
		opener.location.href='/semi_burger/index.jsp';
		</script>
		<%
	} else{
		%>
		<script>
		window.alert('고객센터로 문의 바랍니다');
		location.href='/semi_burger/member/updateinfo.jsp';
		</script>
		<%
	}
%>