<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yong Burger</title>
</head>
<%
	String userid = request.getParameter("id");
%>
<body>
<section>
  <form name="delete" action="delete_ok.jsp" >
  <input type="hidden" name="id" value=<%=userid %>>
  	<fieldset>
  		<div style="text-align: center; font-size:15px;">
  			비밀번호를 입력해주세요.
			<input type="text" name="pwd" required="required"> 
			<input type="submit" value="탈퇴">
		</div>
	</fieldset>
  </form>
</section>

</body>
</html>