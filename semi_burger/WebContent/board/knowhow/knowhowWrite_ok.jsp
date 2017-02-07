<%@page import="org.omg.PortableInterceptor.USER_EXCEPTION"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> 
<%@page import="java.util.*" %>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="bdto" class="board.knowhow.knowhowDTO" scope="request"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="fdao" class="board.knowhow.knowhowDAO" scope="session"/>


<%
	String savePath = getServletContext().getRealPath("/") + "upload"; // Upload 경로
	new File(savePath).mkdir();
	int sizeLimit = 5 * 1024 * 1024; 



	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 

	String name = multi.getParameter("name");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String fileName = multi.getFilesystemName("upLoad"); 
	bdto.setName(name);
	bdto.setSubject(subject);
	bdto.setContent(content);
	bdto.setMy_img_url("upload/" + fileName);

	int result=fdao.knowhowWrite(bdto);
	String msg=result>0?"작성완료!":"작성실패!";
			


%>

<script>
window.alert('<%=msg %>');
location.href='knowhowList.jsp';
</script>