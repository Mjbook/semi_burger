<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css"
href="/semi_burger/css/mainLayout.css">
<style>
	fieldset{
		width: 260px;
		margin: 0px auto;
		border-spacing: 0px;
	}
	td{
		font-size: 14px;
	}
	input::-webkit-input-placeholder {
		color:red;
	}
</style>
<script>
	function idfind(){
		window.open('idfind.jsp','idfind','width=360, height=170, left=420, top=250');
	}
	function pwdfind(){
		window.open('pwdfind.jsp','pwdfind','width=360, height=170, left=420, top=250');
	}
</script>
</head>
<%
	Cookie cks[] = request.getCookies();
	
	String idsave = "";
	
	if(cks!=null){
		for(int i=0;i<cks.length;i++){
			if(cks[i].getName().equals("idsave")){
				idsave = cks[i].getValue();				
			}
		}
	}
%>
<body>
<%@ include file="/header.jsp" %>
 
<section>
<br>
	<fieldset>
	<form name="login" action="login_ok.jsp" method="post">
		<table>
		  <tr>
		  	<td> &nbsp; </td>
		  </tr>
		  <tr>	
			<td class="input"> <input type="text" name="id" placeholder="아이디" value="<%= idsave%>"> </td>
			<td rowspan="2"> <input type="submit" value="로그인" style="height:48px;"> </td>
		  </tr>
		  <tr>
		  	<td class="input"> <input type="password" name="pwd" placeholder="비밀번호"> </td>
		  	<td> </td>
		  </tr>	
		  <tr>
		  	<td colspan="2"> <input type="checkbox" name="idsave" value="on" <%= idsave.equals("")?"":"checked" %> style="float:left;"> ID 기억하기 
		  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  					<a href="javascript:idfind()">ID</a> / <a href="javascript:pwdfind()">PW 찾기</a> </td>	  	
		  </tr>		
		  <tr>
		 	<td> &nbsp; </td>
		  </tr>
		</table>
	</form>
	</fieldset>

<br>
</section>	

<%@ include file="/footer.jsp" %>
</body>
</html>