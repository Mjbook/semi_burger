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

String item_num_s=request.getParameter("item_num");
int item_num=Integer.parseInt(item_num_s);

String item_name=request.getParameter("item_name");

String item_pay=request.getParameter("item_pay");

String item_count_s=request.getParameter("item_count");
int item_count=Integer.parseInt(item_count_s);

String item_img_src=request.getParameter("item_img_src");
int result=sdao.sideUPLoad(item_num, item_name, item_pay, item_count, item_img_src);

String msg=result>0?"등록되었습니다.":"등록에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>');
window.close();
location.href='sideMenu.jsp';
opener.location.reload();
</script>