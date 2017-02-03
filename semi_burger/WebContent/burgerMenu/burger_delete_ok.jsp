<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="yb.burger.*" %>
<jsp:useBean id="burgerdto" class="yb.burger.BurgerDTO"/>
<jsp:setProperty property="*" name="burgerdto"/>
<jsp:useBean id="burgerdao" class="yb.burger.BurgerDAO"/>
<%
request.setCharacterEncoding("UTF-8");

String item_key_s=request.getParameter("item_key");
int item_key=Integer.parseInt(item_key_s);


int result=burgerdao.burgerDelete(item_key);

String msg=result>0?"삭제되었습니다.":"삭제에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>');
window.close();
location.href='burgerMenu.jsp';
opener.location.reload();
</script>