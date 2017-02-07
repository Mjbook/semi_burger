<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("id");
	
	String userpwd = request.getParameter("pwd1");
	String userpwd2 = request.getParameter("pwd2");
	
	int result = mdao.SetPwd(userpwd, userid);
	
	if(userpwd.equals(userpwd2)){
		if(result>0){
			%>
			<script>
				window.alert('비밀번호 설정이 완료되었습니다');
				opener.location.href='/semi_burger/member/login.jsp';
				window.self.close();
			</script>
			<%
		} else{
			%>
			<script>
				window.alert('고객센터로 문의바랍니다');
				opener.location.href='/semi_burger/board/QnA/QAList.jsp';
				window.self.close();
			</script>
			<%			
		}
	} else {
		%>
		<script>
			window.alert('비밀번호가 일치하지 않습니다');
			history.back();
		</script>
		<%
	}
	
%>
