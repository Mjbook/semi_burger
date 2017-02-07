<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> 
<%@page import="java.util.*" %>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="bdto" class="board.knowhow.knowhowDTO" scope="page"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="board.knowhow.knowhowDAO" scope="session"/>

<%
String savePath = getServletContext().getRealPath("/") + "uploads/concerts"; // Upload 경로 
int sizeLimit = 5 * 1024 * 1024; 

MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 

String name = multi.getParameter("name");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
String fileName = multi.getFilesystemName("upLoad"); 
String url = multi.getParameter("url"); 
int knowhow_no = Integer.parseInt(multi.getParameter("knowhow_no")); 

bdto.setName(name);
bdto.setSubject(subject);
bdto.setContent(content);
bdto.setKnowhow_no(knowhow_no);
if(fileName == null) {
	bdto.setMy_img_url(url);
} else {
	bdto.setMy_img_url("../../upload/" + fileName);
}

int result=bdao.knowhowUpdate(bdto);
String msg=result>0?"작성완료!":"작성실패!";
%>
<script>
window.alert('<%=msg %>');
location.href='knowhowList.jsp?';
</script>