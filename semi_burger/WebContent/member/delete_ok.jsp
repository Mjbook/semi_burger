<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>
    

<%
	String userid = request.getParameter("id");
	String userpwd = request.getParameter("pwd");
	
	String dbpwd = mdao.getPwd(userid);

	if(userpwd.equals(dbpwd)){
		
		int result = mdao.DelMember(userid);
			
		if(result>0){
			%>
			<script>
			window.alert('탈퇴되었습니다');
			opener.location.href='/semi_burger/index.jsp';
			window.self.close();
			</script>
			<%	  					
			session.invalidate();
		}
	} else{
		%>
		<script>
			window.alert('비밀번호를 확인해주세요');
			history.back();
		</script>
		<%
	}
%>
