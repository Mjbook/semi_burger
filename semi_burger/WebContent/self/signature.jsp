<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
<style>
body table{
	margin:0px auto;
	border-spacing: 0px;
}
body td{
	height:20px;
	padding:0px;
}
.side_top{
	padding:0px;
	width: 200px;
	height:18px;
}
.side_top img{
	border-radius:100px 100px 0px 0px;
	width:200px;
	height:30px;
	margin: 0px;
	padding:0px;
}
.side{
	padding:0px;
	width: 200px;
	height:18px;
}
.side img{
	border-radius:9px;
	width:200px;
	height:21px;
	margin: 0px;
	padding:0px;
}
</style>
</head>
<%
String menu_name=request.getParameter("no");
HashMap<Integer, String> hm=tdao.getTopings();//메뉴판

StringTokenizer st=new StringTokenizer(menu_name, ".");
ArrayList<Integer> arr=new ArrayList<Integer>();//toping key 순서

while(st.hasMoreTokens()){
	String temp=st.nextToken();
	int tk=0;
	try {
		tk=Integer.parseInt(temp);
	} catch (Exception e) {
		continue;
	}
	arr.add(tk);	
}
%>
<body>
<section>
	<article>
	<table>
<%
for(int i=arr.size()-1;i>=0;i--){
	int key=arr.get(i);
	String tname="";
	String img="";
	String div_class="side";
	
	if(hm.containsKey(key)){
		tname=hm.get(key);
		
		img="src='/semi_burger/self/toping_img/ts"+tdao.getToping("toping_img", key)+"'";
		
		if(i==arr.size()-1&&tname.equals("빵")){
			div_class="side_top";
		}
		
	}else{
		tname="판매 종료된 토핑";
	}
	
	
	
	
%>
	<tr>
		<td><div class="<%=div_class%>"><img <%=img%>></div></td>
		<td><%=tname %></td>
	</tr>

<%
}
%>
	</table>
	</article>
</section>
</body>
</html>