<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.oreilly.servlet.*"%>
<%@ page import="yb.burger.*" %>
<jsp:useBean id="side_img" class="yb.burger.Side_upload" scope="session"/>
<jsp:useBean id="sdto" class="yb.burger.SideDTO"/>
<jsp:setProperty property="*" name="sdto"/>
<jsp:useBean id="sdao" class="yb.burger.SideDAO"/>

<%
request.setCharacterEncoding("UTF-8");

String savepath=side_img.USERS_HOME+"/"+side_img.getCrpath();
try{
	MultipartRequest mr=new MultipartRequest(request,savepath,side_img.getImgname());
}catch(Exception e){
}

String sideitem_num_s=request.getParameter("sideitem_num");
int sideitem_num=Integer.parseInt(sideitem_num_s);

String sideitem_name=request.getParameter("sideitem_name");

String sideitem_pay=request.getParameter("sideitem_pay");

String sideitem_count_s=request.getParameter("sideitem_count");
int sideitem_count=Integer.parseInt(sideitem_count_s);

String sideitem_img_src=request.getParameter("sideitem_img_src");
int result=sdao.sideReLoad(sideitem_num, sideitem_name, sideitem_pay, sideitem_count, sideitem_img_src);

String msg=result>0?"수정되었습니다.":"수정에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>');
window.close();
location.href='sideMenu.jsp';
opener.location.reload();
</script>