<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	if(session.getAttribute("sid")==null){
%>
<script>
	window.alert('로그인 먼저 부탁드립니다.');
	location.href='/semi_burger/index.jsp';
</script>		
<%
	}
%>

<html>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css" >
</head>
<body>
<%@include file="/header.jsp"%>

<%@include file="/footer.jsp"%>
</body>
</html>