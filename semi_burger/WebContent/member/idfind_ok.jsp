<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.button{
		text-align: center;
	}
</style>
<script>
	function relogin(){
		opener.location.href='login.jsp';
		window.self.close();
	}
	function pwdfind(){
		opener.location.href='pwdfind.jsp';
		window.self.close();
	}
	function rejoin(){
		opener.location.href='join.jsp';
		window.self.close();
	}	
</script>
</head>
<%
	String name = request.getParameter("name");
	String cell = request.getParameter("cellphone");
	
	String id = mdao.idfind(name, cell);			
%>
<body>
	<form name="idfind">
<%
	if(id!=null){
		%>
		<fieldset>
			<div style="text-size:8px;"> 아이디 찾기 </div>
			<hr>
			<div style="text-align:center;"> 회원님의 ID는 <%= id %> 입니다. </div>
			<hr>		
		</fieldset>
		<br>
			<div class="button">
			<input type="button" value="로그인 하기" onclick="relogin()">
			<input type="button" value="비밀번호 찾기" onclick="pwdfind()">
			</div>	
		<%
	} else{
		%>
		<fieldset>
			<div> 조회하신 데이터가 없습니다.</div>
			<div> 입력한 정보를 확인해주세요. </div>
		</fieldset>
		<br>
			<div class="button">
			<input type="button" value="돌아가기" onclick="javascript:history.back()">
			<input type="button" value="회원가입" onclick="rejoin()">
			</div>
		<%
	}
%>
	</form>

</body>
</html>