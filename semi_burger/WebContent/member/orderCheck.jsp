<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css" >
</head>
<body>
<%@include file="/header.jsp"%>
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
	<section>
		<article>
			<table>
				<tbody>
					<tr>
						<th>주문 번호</th>
						<th>주문 메뉴</th>
						<th>주문상태</th>
						<th>주문 일시</th>
					</tr>
				</tbody>
			</table>
		</article>
	</section>
<%@include file="/footer.jsp"%>
</body>
</html>