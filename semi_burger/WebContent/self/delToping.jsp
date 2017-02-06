<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<html>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
<script>
	key=window.opener.deltop.key.value;
	name=window.opener.deltop.name.value;
</script>
<style>
body{
	text-align: center;
}
</style>
</head>
<body>
	<fieldset>
		<p>토핑을 숨기시겠습니까?</p>
		<form name="delToping" action="delToping_ok.jsp">
		<input name="toping_key" type="hidden"><input type="submit" value="네!">
		</form>
	</fieldset>
<script>
	document.delToping.toping_key.value=key;
</script>
</body>
</html>