<%@page import="yb.toping.TopingDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<jsp:useBean id="tdto" class="yb.toping.TopingDTO"/>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<html>
<head>
<meta charset=UTF-8>
<title>Yong burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<style>
.d{
	float: left;
	width:300px;
	min-height:500px;
}
</style>
<script>
function addTop(){
	window.open('addToping.jsp','toping','width=400,height=250,left=600,top=300');
}
function delTop(){
	window.open('delToping.jsp','toping','width=400,height=100,left=600,top=300');
}
function showTop(){
	window.open('showTop.jsp','toping','width=400,height=100,left=600,top=300');
}
</script>
</head>
<%
ArrayList<TopingDTO> tdtos=tdao.getInfo("show");
String count=(String)session.getAttribute("toping_count");
int count_i=0;
String toping=request.getParameter("at");
int pagemove=0;

if(count==null||count.equals("")){
	count="0";
}else{
	count_i=Integer.parseInt(count);	
}

//토핑 추가
if(!(toping==null||toping.equals(""))){
	if(count_i>25){
		%>
		<script>
			window.alert('토핑을 더 이상 추가할 수 없습니다.');
			location.href='selfBurger.jsp';
		</script>
		<%
		return;
	}
	session.setAttribute("t"+count, toping);
	count_i=Integer.parseInt(count)+1;
	session.setAttribute("toping_count", Integer.toString(count_i));
}

String onetoping=request.getParameter("oto");//토핑 하나 빼기
String alltoping=request.getParameter("to");//토핑 다 빼기

if(!(onetoping==null||onetoping.equals(""))){
	count_i--;
	session.removeAttribute("t"+count_i);
	session.setAttribute("toping_count", Integer.toString(count_i));
}

if(!(alltoping==null||alltoping.equals(""))){
	for(int i=0;i<count_i;i++){
		session.removeAttribute("t"+i);	
	}
	session.removeAttribute("toping_count");
	count_i=0;
}

%>
<body>
<%@include file="/header.jsp"%>
<h2>나만의 버거</h2>
<%
String sid=(String)session.getAttribute("sid");
if(sid!=null&&sid.equals("admin")){
%>
<div style="width:300px;"><fieldset>
<legend>관리자 메뉴</legend>
<p><a href="javascript:addTop()">토핑 추가</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="javascript:showTop()">토핑 꺼내기</a>
<a href="javascript:delTop()">토핑 숨기기</a>
</p>
</fieldset></div>
<%}%>
<form name="selfBurger" action="selfBurger_ok.jsp">
<p>
	<a href="selfBurger.jsp?oto=1">제일 위의 토핑 빼기</a>
	&nbsp;&nbsp;|&nbsp;&nbsp;
	<a href="selfBurger.jsp?to=1">토핑 전부 빼기</a>
	<br>수량:<input type="text" name="item_count"><input type="submit" value="담기">
</p>
</form>
<section>
<article>
	<div class="d">
	<%
	int price=0;
	for(int i=0;i<count_i;i++){
		String temp_s=(String)session.getAttribute("t"+i);
		int temp=Integer.parseInt(temp_s);
		String tp_price=tdao.getToping("toping_price", temp);
		price+=Integer.parseInt(tp_price);
	}
	%>
	<div align="center">가격:<%=price %>원</div>
	<%
	for(int i=count_i-1;i>=0;i--){
		
		String temp_s=(String)session.getAttribute("t"+i);
		int temp=Integer.parseInt(temp_s);
		String tp_img=tdao.getToping("toping_img",temp);
		%>
		<div>
		<img src="/semi_burger/self/toping_img/ts<%=tp_img%>" width="100px" height="20px">
		</div>
		<%
	}
	%>
	</div>
</article>
<article>
	<table border="1" width="480px">
		<thead>
		<tr>
			<th>토핑</th>
			<th>가격</th>
			<th></th>
		</tr>
		</thead>
		
		<tbody>
		<%
		if(tdtos.size()==0||tdtos==null){
			%>
		<tr>
			<td colspan="4">토핑 준비 중...</td>
		</tr>
			<%
		}else{
			for(int i=0;i<tdtos.size();i++){
				tdto=tdtos.get(i);
			%>
		<tr>
			<td><img src="/semi_burger/self/toping_img/<%=tdto.getToping_img()%>"><br><%=tdto.getToping_name()%></td>
			<td><%=tdto.getToping_price() %>원</td>
			<td><a href="selfBurger.jsp?at=<%=tdto.getToping_key()%>">추가</a></td>
		</tr>
		<%
			}
		}
		%>
		</tbody>
	</table>
</article>
<div style="clear:both;"></div>
</section>
<%@include file="/footer.jsp"%>
</body>
</html>