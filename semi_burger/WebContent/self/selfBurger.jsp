<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.beans.Encoder"%>
<%@page import="yb.toping.TopingDTO"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<jsp:useBean id="tdto" class="yb.toping.TopingDTO"/>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<html>
<head>
<meta charset=UTF-8>
<title>Yong burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<style>
h2{
	text-align:center;
}
.admin{
	float:right;
	width:500px;
}
.d{
	width:100%;
	min-height:350px;
	margin: 0px;
	padding-bottom:20px;
	text-align:center;
}
.sidetable{
	width:100%;
	padding: 0px;
	border-spacing: 0px;
}
.sidetable tbody{
	text-align:center;
}
.sidetop{
	border-radius:20px 20px 5px 5px;
	width: 200px;
	height:22px;
	margin: 0px auto;
}
.side{
	border-radius:9px;
	width: 190px;
	height:18px;
	margin: 0px auto;
}
.sidebread{
	border-radius:9px;
	width: 200px;
	height:18px;
	margin: 0px auto;
}
.sideslim{
	border-radius:9px;
	width: 190px;
	height:10px;
	margin: 0px auto;
}
body table{
	min-width:300px;
}
body table td{
	text-align: center;
}
body table img{
	width:50px;
	height:50px;
}
.sb{
	text-align:center;
	width:100%;
	padding-bottom:20px;
}
.leftdiv{
	float: left;
	width: 50%;
}
</style>
<script>
function addTop(){
	window.open('addToping.jsp','toping','width=400,height=320,left=600,top=300');
}
function delTop(key){
	document.deltop.key.value=key;	
	window.open('delToping.jsp','toping','width=300,height=130,left=600,top=300');
}
function showTop(){
	window.open('showTop.jsp','toping','width=400,height=400,left=600,top=300');
}
function order(){
	location.href='/semi_burger/order/orderList.jsp';
}
</script>
</head>
<%
DecimalFormat df=new DecimalFormat("##,###,###,###,###");

tdao.delTop();
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
	if(count_i>20){
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
<section>
<article style="height:113px;padding-top: 14px;">
<div style="background:url(/semi_burger/introduce/img/sub_top_bg01.jpg) 50% 50% no-repeat; height:106px;" >
	<br>
	<h2 style="color:white;text-align: left;">&nbsp;&nbsp;시그니처 버거</h2>
	<br>
</div>
</article>
<article>
<%
String sid=(String)session.getAttribute("sid");
if(sid!=null&&sid.equals("admin")){
%>
<div class="admin">
<p><a href="javascript:addTop()" class="a">토핑 추가</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="javascript:showTop()" class="a">토핑 관리</a></p>
</div>
<%}%>
</article>
<article>
	<div class="leftdiv">
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
	<div>가격:<%=df.format(price) %>원</div>
	<br>
	<table class="sidetable" cellpadding="0" cellspacing="0">
	<%
	for(int i=count_i-1;i>=0;i--){
		
		String temp_s=(String)session.getAttribute("t"+i);
		int temp=Integer.parseInt(temp_s);
		String tp_img=tdao.getToping("toping_img",temp);
		%>
		<tr>
			<td >
		<%
		int top_i=count_i-1;
		String temp_tops=(String)session.getAttribute("t"+top_i);
		int temp_top=Integer.parseInt(temp_tops);
		
		String tp_n=tdao.getToping("toping_name",temp);
		String div_class="";
		if(i==top_i&&tp_n.contains("빵")){
			div_class="sidetop";
		}else{
			if(tp_n.contains("패티")){
				div_class="side";
			}else if(tp_n.contains("빵")){
				div_class="sidebread";	
			}else{
				div_class="sideslim";
			}
		}
		 %>
				<div class="<%=div_class%>" style="background-image:url('/semi_burger/self/toping_img/ts<%=tp_img%>');">
				</div>
			</td>
		</tr>
		<%
	}
	%>
	</table>
	</div>
	<form name="selfBurger" action="selfBurger_ok.jsp">
	<div class="sb"><a href="selfBurger.jsp?oto=1" class="a">제일 위의 토핑 빼기</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="selfBurger.jsp?to=1" class="a">토핑 전부 빼기</a>
	<br><br>수량:<input type="text" name="item_count" size="5px">
			<input type="submit" value="계산서에 담기">
			<input type="button" value="계산하러 가기" onclick="order()">
	</div>
	</form>
	</div>
</article>
<!--오른쪽 div-->
<article>
	<table style="padding-top: 30px;padding-bottom: 30px;">
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
				<td><img src="/semi_burger/self/toping_img/<%=tdto.getToping_img()%>"></td>
				<td style="min-width:200px;"><%=tdto.getToping_name()%><br><%=tdto.getToping_price() %>원</td>
				<td><a href="selfBurger.jsp?at=<%=tdto.getToping_key()%>" class="a">추가</a><%
				if(sid!=null&&sid.equals("admin")){
				%><br><a href="javascript:delTop(<%=tdto.getToping_key()%>)" class="a">토핑 숨기기</a><%	
				}
				%>
				</td>
			</tr>
			<%
			}
		}
		%>
		</tbody>
	</table>
	<form name="deltop">
		<input type="hidden" name="key">
		<input type="hidden" name="name">
	</form>
</article>
<div style="clear:both;"></div>
</section>
<%@include file="/footer.jsp"%>
</body>
</html>