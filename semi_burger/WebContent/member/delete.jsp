<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yong Burger</title>
<style>
	.button{
		text-align: right;
	}
</style>
</head>
<%
	String userid = request.getParameter("id");
	String userpwd = request.getParameter("passwd");
	
	int result = mdao.DelMember(userid, userpwd);
%>
<body>
 
<section>
  <fieldset>
	  <form name="delete" action="delete_ok.jsp">
	  	<%
		  	if(result>0){
		  		%>
				<script>
					window.confirm('탈퇴하시겠습니까?');
										
				</script>
				<%				
			} else{
				%>
				<script>
					window.alert('비밀번호를 확인해주세요');
					history.back();
				</script>
				<%
				return;
			}
	  	%>
	  </form>
  </fieldset>
</section>

</body>
</html>