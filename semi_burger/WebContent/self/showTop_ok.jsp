<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<!DOCTYPE html>
<%
String name=request.getParameter("select");
int result=tdao.showToping(name,"show");

if(result>0){
	%>
	<script>
		window.opener.location.reload();
		location.href='showTop.jsp';
	</script>
	<%
}else{
	%>
	<script>
		window.alert('다시 시도해 주세요.');	
		location.href='showTop.jsp';
	</script>
	<%
}
%>