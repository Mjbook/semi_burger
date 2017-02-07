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
	
	String dbpwd = mdao.getPwd(userid);	
%>
<body>
 
<section>
  <fieldset>
	  <form name="delete">
	  	<%
	  		if(userpwd.equals(dbpwd)){
	  			%>
	  			<script>
	  			var confirm = window.confirm('탈퇴하시겠습니까?');
	  			
	  			if(confirm){
	  				<%
	  				int result = mdao.DelMember(userid);
	  				
	  				if(result>0){
	  					%>
	  					window.alert('탈퇴되었습니다');
	  					location.href='/semi_burger/index.jsp';
	  					<%	  					
	  					session.invalidate();
	  				} else{
	  					%>
	  					window.alert('감사합니다');
	  					history.back();
	  					<%
	  				}
	  				%>
	  			}
	  			</script>
	  			<%
	  		} else{
	  			%>
	  			<script>
	  				window.alert('비밀번호를 확인해주세요');
	  				history.back();
	  			</script>
	  			<%
	  		}	  		
	  	%>
	  </form>
  </fieldset>
</section>

</body>
</html>