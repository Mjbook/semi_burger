<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Yong burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<style>
.d{
	float: left;
	width:500px;
	height:500px;
}
</style>
<script>
function addTop(){
	window.open('addToping.jsp','toping','width=400,height=250,left=600,top=300');
}
function delTop(){
	window.open('delToping.jsp','toping','width=400,height=250,left=600,top=300');
}
</script>
</head>
<body>
<%@include file="/header.jsp"%>
<h2>나만의 버거</h2>
<p><a href="javascript:addTop()">토핑 추가</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:delTop()">토핑 제거</a></p>
<section>
<article>
	<div class="d">그림</div>
</article>
<article>
	<div class="d">
	<table border="1">
		<thead>
		<tr>
			<th>토핑</th>
			<th>수량</th>
			<th>가격</th>
			<th></th>
		</tr>
		</thead>
		
		<tbody>
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
		</tr>
		</tbody>
	</table>
	</div>
</article>
<div style="clear:both;"></div>
</section>
<%@include file="/footer.jsp"%>
</body>
</html>