<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.*" %>
	
<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("id");
	String userpwd = request.getParameter("pwd");
	
	String checked = request.getParameter("idsave");
	
	int result = mdao.memberLogin(userid, userpwd);
	
	if(result==mdao.LOGIN_OK){
		
		String username = mdao.getUserId(userid);
				
		session.setAttribute("sid", userid);
		session.setAttribute("sname", username);
		
		if(checked!=null && checked.equals("on")){
			Cookie ck = new Cookie("idsave", userid);
			ck.setMaxAge(60*60*24*30);
			response.addCookie(ck);	
		} else{
			Cookie ck = new Cookie("idsave", userid);
			ck.setMaxAge(0);
			response.addCookie(ck);
		}
		
		%>
		<script>
			window.alert('<%= username%>님 \n어서오세요!');
			location.href='/semi_burger/index.jsp';
		</script>
		<%
	} else if(result==mdao.NOT_PWD){
		%>
		<script>
			window.alert('비밀번호를 확인해주세요');
			history.back();
		</script>
		<%
	} else if(result==mdao.NOT_ID){
		%>
		<script>
			window.alert('존재하지 않는 ID입니다');
			location.href='/semi_burger/member/login.jsp';
		</script>
		<%
	} else {
		%>
		<script>
			window.alert('고객센터로 연락주세요');
			location.href='/semi_burger/board/QnA/QAList.jsp';
		</script>
		<%
	}
%>
