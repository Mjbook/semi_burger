<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yong Burger</title>
</head>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
<body>
<section>
  <form name="QADelete" action="QADelete_ok.jsp" method="post">
  <input type="hidden" name="idx" value=<%=idx %>>
  	<fieldset>
  		<div style="text-align: center; font-size:15px;">
  			비밀번호를 입력해주세요.
			<input type="text" name="pwd" required="required"> 
			<input type="submit" value="삭제">
		</div>
	</fieldset>
  </form>
</section>

</body>
</html>