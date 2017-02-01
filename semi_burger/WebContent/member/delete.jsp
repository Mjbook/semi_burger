<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");

	String sid = (String)session.getAttribute("sid");
	String result;
%>
<body>
	<form name="delete" action="delete_ok.jsp">
		<script>
			var confirm = window.confirm('탈퇴하시겠습니까?');
			
			if(confirm){
				result = confirm;
			}
		</script>
		
	</form>
</body>
</html>