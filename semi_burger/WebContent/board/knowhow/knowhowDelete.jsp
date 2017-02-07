<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8");

int idx = Integer.parseInt(request.getParameter("idx"));

%>
<jsp:useBean id="bdto" class="board.knowhow.knowhowDTO" scope="page"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="fdao" class="board.knowhow.knowhowDAO" scope="session"/>

<%

int result=fdao.knowhowDelete(idx);
String msg=result > 0 ? "삭제 성공!":"삭제 실패!";
%>
<script>
window.alert('<%=msg%>');
location.href='knowhowList.jsp';
</script>