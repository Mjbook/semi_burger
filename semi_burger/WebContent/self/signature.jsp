<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<jsp:useBean id="tdao" class="yb.toping.TopingDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
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
	String tname=hm.get(key);
	String img=tdao.getToping("toping_img", key);

%>
	<tr>
		<td><img src="/semi_burger/self/toping_img/ts<%=img%>" width="100px" height="20px"></td>
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