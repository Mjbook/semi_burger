<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="yb.burger.*" %>
<jsp:useBean id="sdto" class="yb.burger.SideDTO"/>
<jsp:setProperty property="*" name="sdto"/>
<jsp:useBean id="sdao" class="yb.burger.SideDAO"/>
<%
request.setCharacterEncoding("UTF-8");

String sideitem_num_s=request.getParameter("sideitem_num");
int sideitem_num=Integer.parseInt(sideitem_num_s);


int result=sdao.sideDelete(sideitem_num);

String msg=result>0?"삭제되었습니다.":"삭제에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>');
window.close();
location.href='sideMenu.jsp';
opener.location.reload();
</script>