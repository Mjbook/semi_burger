<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<%
	String userid = request.getParameter("id");

	boolean result = mdao.idcheck(userid);
	
	if(result){
		%>
		<script>
			window.alert('이미 존재하는 ID입니다');
			location.href='idcheck.jsp';
		</script>
		<%
	} else{
		%>
		<script>
			window.alert('사용 가능한 ID입니다');
			opener.document.join.id.value= '<%=userid%>';
			window.self.close();			
		</script>
		<%
	}
%>