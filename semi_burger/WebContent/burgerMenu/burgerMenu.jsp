<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="yb.burger.*" %>
<%@ page import="yb.order_list.*"  %>
<%@page import="java.text.DecimalFormat"%>
<jsp:useBean id="burgerdto" class="yb.burger.BurgerDTO"/>
<jsp:setProperty property="*" name="burgerdto"/>
<jsp:useBean id="burgerdao" class="yb.burger.BurgerDAO"/>
<jsp:useBean id="odao" class="yb.order_list.Order_listDAO"/>
<jsp:useBean id="odto" class="yb.order_list.Order_listDTO" scope="session"/>
<jsp:useBean id="sidedto" class="yb.burger.SideDTO"/>
<jsp:setProperty property="*" name="sidedto"/>
<jsp:useBean id="sidedao" class="yb.burger.SideDAO"/>

<%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="yb.burger.Burger_upload" scope="session"/>

<%
request.setCharacterEncoding("utf-8");
ArrayList<BurgerDTO> al=burgerdao.burgerMenu(burgerdto);
ArrayList<BurgerDTO> al3=burgerdao.eventMenu(burgerdto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
#orderlist{
	position:fixed;
	top:200px;
	right:171px;
	min-width:280px;
	text-align:center;
	background: #b70303;
	border-radius: 20px;
	color:white;
}
.ola{
	color: white;
}
body{
	padding-top: 10px;
}
</style>
<script>
function go_scroll(h){
	window.scrollTo(0,h);
	return;
}
function go_scrollevent(h){
	window.scrollTo(0,h);
	return;
}
function resetMenu(){
	location.href="burgerMenu.jsp?re=1"
}
function burger_up(){
	window.open("burger_up.jsp","burger_up","top=300,left=400,width=350,height=250");
}
function burger_reload(){
	window.open("burger_reload.jsp","burger_reload","top=300,left=400,width=350,height=250");
}
function burger_delete(){
	window.open("burger_delete.jsp","burger_delete","top=300,left=400,width=350,height=250");
}
function submit(){
	document.orderlist.submit();
}
</script>
<%	
if(request.getParameter("re")!=null){
	odto.clearOdtos();
	%>
	<script>
	location.href='burgerMenu.jsp';
	</script>
	<%
}
DecimalFormat df=new DecimalFormat("##,###,###,###,###");
if(request.getParameter("delorder")!=null){
	String temp_s=request.getParameter("delorder");
	int temp=Integer.parseInt(temp_s);
	odto.getOdtos().remove(temp);
	%>
	<script>
	location.href='burgerMenu.jsp';
	</script>
	<%
	
}
	ArrayList<BurgerDTO> arr_bdto=burgerdao.burgerMenu(burgerdto);
	ArrayList<SideDTO> arr_sdto=sidedao.SideMenu(sidedto);
%>
<%
if(arr_bdto==null){
%>
<script>
	window.alert('메뉴 준비중');
	location.href='/semi_burger/index.jsp';
</script>
<%
	return;
}
for(int i=0;i<arr_bdto.size();i++){
%>
<script>
	function add<%=i%>(menu){
		no=document.burgerMenu.m<%=i%>.value;
		if(no<=0){
			window.alert('주문 수량을 다시 확인해 주세요.');
			return;
		}
		document.burgerMenu.m<%=i%>_check.value="true";
		document.burgerMenu.submit();
		
		
	}
	function addside<%=i%>(menu){
		no=document.sideMenu.s<%=i%>.value;
		if(no<=0){
			window.alert('주문 수량을 다시 확인해 주세요.');
			return;
		}
		document.sideMenu.s<%=i%>_check.value="true";
		document.sideMenu.submit();
		
		
	}
</script>
<%
}
%>
<%
for(int i=0;i<arr_bdto.size();i++){
	
	//햄버거
	String select_menu=request.getParameter("m"+i+"_check");
	String num_s=request.getParameter("m"+i);
	//사이드
	String select_smenu=request.getParameter("s"+i+"_check");
	String num_ss=request.getParameter("s"+i);
	
	if(select_menu!=null&&select_menu.equals("true")){ //주문 추가
		burgerdto=arr_bdto.get(i);
		String name=burgerdto.getItem_name();
		int num=Integer.parseInt(num_s);
		String price=burgerdto.getItem_pay();
		Order_listDTO temp=new Order_listDTO();
		temp.setItem_name(name);
		int check_menu=odao.checkMenu(name,odto);
		if(check_menu>=0){
			odto.getOdtos().get(check_menu).addItem_count(num);
		}else{
			temp.setItem_count(num);
			temp.setTotal_pay(price);
			odto.addOdtos(temp);
		}
	}else if(select_smenu!=null&&select_smenu.equals("true")){ //side 주문 추가
		sidedto=arr_sdto.get(i);
		String name=sidedto.getSideitem_name();
		int num=Integer.parseInt(num_ss);
		String price=sidedto.getSideitem_pay();
		Order_listDTO temp=new Order_listDTO();
		temp.setItem_name(name);
		int check_menu=odao.checkMenu(name,odto);
		if(check_menu>=0){
			odto.getOdtos().get(check_menu).addItem_count(num);
		}else{
			temp.setItem_count(num);
			temp.setTotal_pay(price);
			odto.addOdtos(temp);
		}
	}
}
%>
</head>
<body>
<%@include file="../header.jsp" %>

<section>
	<article>
	<div style="background:url(/semi_burger/introduce/img/sub_top_bg01.jpg) 50% 50% no-repeat; opacity: 0.85;">
	<br>
	<h2 style="color:white;" id="burgerevent">&nbsp;&nbsp;햄버거 메뉴</h2>
	<br>
	</div>
	<div>
		<form name="burgerMenu" method="post" >
		
			<table border="0" cellspacing="0">
				<tr>
				<%
				String sid=(String)session.getAttribute("sid");
				wf.setUser(sid);
				
				
			
				for(int i=0;i<al.size();i++){
					if(i%2==0&&i!=al.size()&&i!=0){
					%>
					</tr><tr>
					<%
					}
					%>
					<th>
					<img src="/semi_burger/burger_img/<%=al.get(i).getItem_img_src()%>" width="300" height="260">
					</th>
					<td align="center" width="200" height="260">
					<%
					if(sid!=null){
					if(sid.equals("admin")){
						%>
						<span style="font-style: italic; color:red;">Key : <%=al.get(i).getItem_key() %></span>
						<br><br><br>
						<% 
					}	
					}
					 %>
					
					<span style="font-size:20px;color:gray;"><b><%=al.get(i).getItem_name()%></b></span>
					<br><br><br>
					<span style="font-size:15px;color:black;"><b><%=df.format(Integer.parseInt(al.get(i).getItem_pay()))+"원" %></b></span>
					<br><br><br>
					
					<select name="m<%=i%>" style="vertical-align: middle; height: 30px">
					<%
						for(int j=0;j<=100;j++){
							%>
							<option value="<%=j%>"><%=j %></option>
							<%
						}
					%>
					</select>
					
					<input type="hidden" name="m<%=i %>_check" value="false">
					<div style="display: inline-block; height: 30px; vertical-align: bottom;" >
					<input type="image" src="/semi_burger/img/button.jpg" width="35px" height="30px" value="담기" onclick="javascript:add<%=i%>(<%=i%>)">
					</div>
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
						<input type="button" value="메뉴등록" onclick="burger_up()">
						<input type="button" value="메뉴수정" onclick="burger_reload()">
						<input type="button" value="메뉴삭제" onclick="burger_delete()">
						</td>
						</tr>
						<% 
					}	
				}
				 %>
				
			</table>
			
		</form>
		</div>
<%		
		for(int i=0;i<arr_bdto.size();i++){
			String select_menu=request.getParameter("m"+i+"_check");
			String num_s=request.getParameter("m"+i);
			//side 주문 수량 보존
			String select_smenu=request.getParameter("s"+i+"_check");
			String num_ss=request.getParameter("s"+i);
			
			if(num_s!=null){ //주문 후 주문 안 한 메뉴 수량 표시
			%>
				<script>
				document.burgerMenu.m<%=i%>.value=<%=num_s%>;
				</script>	
			<%
			}
			
			if(select_menu!=null&&select_menu.equals("true")){
			%><!-- 주문한 메뉴 수량 0으로 설정 -->
				<script>
				document.burgerMenu.m<%=i%>.value="0";
				</script>	
			<%
			}
			
			
			if(num_ss!=null){ //주문 후 주문 안 한 메뉴 수량 표시
			%>
				<script>
				document.sideMenu.s<%=i%>.value=<%=num_ss%>;
				</script>	
			<%
			}
			
			if(select_smenu!=null&&select_smenu.equals("true")){
			%><!-- 주문한 메뉴 수량 0으로 설정 -->
				<script>
				document.sideMenu.s<%=i%>.value="0";
				</script>	
			<%
			}
		 
		}
%>
		
		</article>
		
		<div id="side" style="width: 1000px; height:120px;"></div>
		<%@include file="/sideMenu/sideMenu.jsp"%>	
		
		<div id="event" style="width: 1000px; height:120px;"></div>
		<%@include file="/burgerMenu/eventMenu.jsp" %>
		
		<div style="width: 1000px; height:120px;"></div>
		
	<article>
		<div>
		<form name="orderlist" action="/semi_burger/order/orderList.jsp">
			<table id="orderlist">
				<thead>
				<tr>
					<th colspan="4"><%=session.getAttribute("sid")==null?"고객":session.getAttribute("sname")%>님의 주문서</th>
				</tr>
				</thead>

				<tbody>
				<%
					ArrayList<Order_listDTO> arr_odto=odto.getOdtos();
					int total_price=0;
					if(arr_odto!=null&&(arr_odto.size()>0)){
						%>
						<tr>
						<td>메뉴</td>
						<td>수량</td>
						<td>합계</td>
						</tr>
						<%
						for(int i=0;i<arr_odto.size();i++){
							String menu=arr_odto.get(i).getItem_name();
							int num=arr_odto.get(i).getItem_count();
							String price=arr_odto.get(i).getTotal_pay();
							int order_price=Integer.parseInt(price)*num;
							total_price+=order_price;
							
							if(menu.startsWith("signature"))menu="시그니처 버거";
							%> 
							<tr>
								<td><%=menu%></td>
								<td><%=num %></td>
								<td><%=df.format(order_price)%></td>
								<td><a href="burgerMenu.jsp?delorder=<%=i%>"class="ola">취소</a></td>
							</tr>
							<%
						}
					}
				%>
				</tbody>
				
				<tfoot>
				<tr>
					<th colspan="3">금액:</th>
					<td><%=""+df.format(total_price)%>원</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<div class="button_div"><a href="javascript:submit()">주문하기</a></div>
						<div class="button_div"><a href="javascript:resetMenu()">다시 담기</a></div>
					</td>
				</tr>
				</tfoot> 
			</table>
		</form>
		</div>
	</article>

</section>

<%@include file="../footer.jsp" %>
</body>
</html>