<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String agree1 = request.getParameter("agree_checkbox1");
	String agree2 = request.getParameter("agree_checkbox2");
	
	if((agree1!=null && agree1.equals("on")) && (agree2!=null && agree2.equals("on"))){
		%>
		<script>
		 location.href='/semi_burger/member/join.jsp';
		</script>
		<%
	} else{
		%>
		<script>
			window.alert('이용 약관에 동의해주세요');
			location.href='/semi_burger/member/agree.jsp';
		</script>
		<%
	}
	%>
	
    
    