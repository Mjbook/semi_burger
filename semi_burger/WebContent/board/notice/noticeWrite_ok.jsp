<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="bdto" class="board.notice.noticeDTO" scope="page"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="board.notice.noticeDAO" scope="session"/>

<%

int result=bdao.noticeWrite(bdto);
String msg=result>0?"작성완료!":"작성실패!";
%>
<script>
window.alert('<%=msg %>');
location.href='notice.jsp';
</script>