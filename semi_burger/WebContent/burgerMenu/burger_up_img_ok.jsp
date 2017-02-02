<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*"%>
<jsp:useBean id="burger_img" class="yb.burger.Burger_upload" scope="session"/>
<jsp:useBean id="bdao" class="yb.burger.BurgerDAO"/>
<%
String savepath=burger_img.USERS_HOME;
burger_img.userFolderExists();
try{
	MultipartRequest mr=new MultipartRequest(request,savepath,1024*1024*10,"utf-8");
	
	%>
	<script>
	window.alert('이미지 등록 성공!');
	window.self.close();
	</script>
	
	<%
}catch(Exception e){
	%>
	<script>
		window.alert('이미지 등록 실패!');
		window.self.close();
	</script>
	
	<%
}
String item_num_s=request.getParameter("item_num");
int item_num=Integer.parseInt(item_num_s);
String item_name = request.getParameter("item_name");
String item_pay = request.getParameter("item_pay");
String item_count_s = request.getParameter("item_count");
int item_count = Integer.parseInt(item_count_s);
String item_img_src=savepath;

int result=bdao.burgerUPLoad(item_num, item_name, item_pay, item_count, item_img_src);
String msg=result>0?"등록되었습니다.":"등록에 실패하였습니다.";
%>

<script>
window.alert('<%=msg%>');
window.close();
location.href='burgerMenu.jsp';
opener.location.reload();
</script>

