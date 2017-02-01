<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.oreilly.servlet.*"%>
<%@ page import="yb.burger.*" %>
<jsp:useBean id="burger_img" class="yb.burger.Burger_upload" scope="session"/>
<jsp:useBean id="burgerdto" class="yb.burger.BurgerDTO"/>
<jsp:setProperty property="*" name="burgerdto"/>
<jsp:useBean id="burgerdao" class="yb.burger.BurgerDAO"/>

<%
request.setCharacterEncoding("UTF-8");

String savepath=burger_img.USERS_HOME+"/"+burger_img.getCrpath();
try{
	MultipartRequest mr=new MultipartRequest(request,savepath,burger_img.getImgname(),"utf-8");
}catch(Exception e){
}

String item_num_s=request.getParameter("item_num");
int item_num=Integer.parseInt(item_num_s);

String item_name="e_"+request.getParameter("item_name");

String item_pay=request.getParameter("item_pay");

String item_count_s=request.getParameter("item_count");
int item_count=Integer.parseInt(item_count_s);

String item_img_src=request.getParameter("item_img_src");
int result=burgerdao.eventMenuUPLoad(item_num, item_name, item_pay, item_count, item_img_src);

String msg=result>0?"등록되었습니다.":"등록에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>');
window.close();
location.href='eventMenu.jsp?src=<%=burger_img.getCrpath()%>';
window.self.close();
opener.location.reload();
</script>