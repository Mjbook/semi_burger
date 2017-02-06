<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
function eventMenu_up(){
	window.open("eventMenu_img_up.jsp","eventMenu_up","top=300,left=400,width=350,height=250");
}
function eventMenu_reload(){
	window.open("eventMenu_reload_img.jsp","eventMenu_reload_img","top=300,left=400,width=350,height=250");
}
function eventMenu_delete(){
	window.open("eventMenu_delete.jsp","eventMenu_delete","top=300,left=400,width=350,height=250");
}
</script>


<%
ArrayList<BurgerDTO> al3=burgerdao.eventMenu(burgerdto);
%>

	<article>
	<div style="background:url(/semi_burger/introduce/img/eventCover.jpg) 50% 50% no-repeat;">
	<br>
	<h2 style="color:white;">&nbsp;&nbsp;이벤트 메뉴</h2>
	<br>
	</div>
	<div>
		<form name="eventMenu" method="post">
			<table border="0" cellspacing="0">
				<tr>
				<%
				for(int i=0;i<al3.size();i++){
					if(i%2==0&&i!=al3.size()&&i!=0){
					%>
						</tr><tr>
					<%
					}
					%>
					<th><img src="../burger_img/<%=al3.get(i).getItem_img_src()%>" width="300" height="260"></th>
					<td align="center" width="200" height="260">
					<%
					if(sid!=null){
					if(sid.equals("admin")){
						%>
						<span style="font-style: italic; color:red;">Key : <%=al3.get(i).getItem_key() %></span>
						<br><br><br>
						<% 
					}	
					}
					 %>
					<span style="font-size:20px ; color:gray;"><b><%=al3.get(i).getItem_name()%></b></span>
					<br><br><br>
					
					<span style="text-decoration: line-through; color: red;">
					<%	
					int epay=Integer.parseInt(al3.get(i).getItem_pay());
					double pay=epay/0.85;
					int epays=(int)pay;
					%>
					<b><%=epays %>원</b>
					</span>		
					<br>
					<span style="font-size:15px ; color:black;"><b><%=	al3.get(i).getItem_pay()%>원</b></span>
					<br><br>
					<input type="button" value="주문하기" onclick="location.href='/semi_burger/burgerMenu/burgerMenu.jsp'">
					</td>
					
					
				<%
				}
				%>
				
				<%
				
				if(sid!=null){
					if(sid.equals("admin")){
						%>
						<tr>
						<td colspan="4" align="right" width="600">
						<input type="button" value="메뉴등록" onclick="eventMenu_up()">
						<input type="button" value="메뉴수정" onclick="eventMenu_reload()">
						<input type="button" value="메뉴삭제" onclick="eventMenu_delete()">
						</td>
						</tr>
						<% 
					}	
				}
				 %>
				 
			</table>
		
		</form>
		</div>
		</article>



