<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.button{
		text-align: right;
	}
</style>
</head>
<body>
 
<section>
  <fieldset>
	  <form name="delete" action="delete_ok.jsp">
	   	정말 탈퇴하시겠습니까? <br>
	   	<hr>
		<div class="button"><input type="submit" value="탈퇴하기"> 
		<input type="button" value="취소" onclick="javascript:window.self.close()"></div>
	  </form>
  </fieldset>
</section>

</body>
</html>