<%@page import="java.beans.beancontext.BeanContext"%>
<%@page import="yb.toping.TopingDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="tdto" class="yb.toping.TopingDTO" scope="session"/>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<jsp:setProperty property="*" name="tdto"/>
<%
String name=tdto.getToping_name();
String price=tdto.getToping_price();
 
try{
	Integer.parseInt(price);//가격 오류 걸러내기

	int result=tdao.addToping(name, price);
	if(result>0){
		%>
		<script>
			location.href='addToping_img.jsp';
		</script>
		<%
	}else{
		%>
		<script>
			window.alert('오류 발생. 다시 입력 부탁 드립니다.');
			location.href='addToping.jsp';
		</script>
		<%
	}
}catch(Exception e){
%>
<script>
	window.alert('가격을 잘못 입력하셨습니다.');
	location.href='addToping.jsp';
</script>
<%
}
%>



