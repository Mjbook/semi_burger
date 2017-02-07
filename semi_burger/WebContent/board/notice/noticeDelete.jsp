<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8");

int idx = Integer.parseInt(request.getParameter("idx"));

%>
<jsp:useBean id="bdto" class="board.notice.noticeDTO" scope="page"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="ddao" class="board.notice.noticeDAO" scope="session"/>

<%

int result=ddao.noticeDelete(idx);
String msg=result > 0 ? "삭제 성공!":"삭제 실패!";
%>
<script>
window.alert('<%=msg%>');
location.href='notice.jsp';
</script>