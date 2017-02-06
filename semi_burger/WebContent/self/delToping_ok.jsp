<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<!DOCTYPE html>
<%
String name=request.getParameter("toping_name");

int result=tdao.showToping(name,"0");

if(result>0){
	%>
	<script>
		window.opener.location.href='selfBurger.jsp';
		window.self.close();
	</script>
	<%
}else{
	%>
	<script>
		window.alert('토핑 삭제 실패!\n다시 시도해 주세요.');	
		location.href='delToping.jsp';
	</script>
	<%
}
%>