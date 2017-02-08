<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="yb.order_list.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="burgerdto" class="yb.burger.BurgerDTO"/>
<jsp:useBean id="burgerdao" class="yb.burger.BurgerDAO"/>
<jsp:useBean id="mdto" class="member.MemberDTO"/>
<jsp:useBean id="mdao" class="member.MemberDAO"/>
<jsp:useBean id="odao" class="yb.order_list.Order_listDAO"/>
<jsp:useBean id="odto" class="yb.order_list.Order_listDTO" scope="session"/>
<!DOCTYPE html>


<html>
<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css" >
<%
	ArrayList<Order_listDTO> arr=odto.getOdtos();
	if(arr==null||arr.size()<1){
		%>
		<script>
		location.href="/semi_burger/burgerMenu/burgerMenu.jsp";
		</script>
		<%
		return;
	}
%>
<script>
function goMenu(){
	location.href='/semi_burger/burgerMenu/burgerMenu.jsp';
}
function goSelf(){
	location.href='/semi_burger/self/selfBurger.jsp';
}
</script>
<style>
body h2{
	text-align:center;
	color: #800000;
}
.otable{
	min-width:60%;
	text-align: center;
	margin:0px auto;
	border-spacing: 0px;
}
.otable thead th{
	border-bottom:1px solid red ;
}

.otable tfoot th div{
	height:0px;
	width:140px;
	border-bottom:20px solid #DFDFDF;
	border-right: 10px solid white;
}
</style>
</head>
<%
	String sid=(String)session.getAttribute("sid");
%>
<%
//회원 주소 가져오기
String addr="";
if(sid!=null){
	addr=mdao.getUserAddr(sid);
}else{
	sid="guest";
}
%>
<body>
<%@include file="/header.jsp"%>
	<br><br>
	<h2>온라인 주문</h2>
	<section>
	<article>
		<form name="orderList" action="orderList_ok.jsp">
		<table class="otable">
		<thead>
			<tr>
				<th>메뉴</th>
				<th>수량</th>
				<th>메뉴 가격</th>
				<!-- <th>매장</th> -->
				<th>주문 일시</th>
				<th>총 금액</th>
			</tr>
		</thead>
		
		<tfoot>
			<tr>
				<th align="right"><div align="center">주문자</div></th>
				<td colspan="4" style="text-align: left;" ><%=sid%></td>
			</tr>
			<tr>
				<th align="right"><div align="center">배달 수령 주소</div></th>
				<td colspan="4" style="text-align: left;"><input type="text" name="addr" value="<%=addr%>" required="required"></td>
			</tr>
			<tr>
				<td colspan="5" style="padding-top: 20px;">
					<input type="button" value="다른 메뉴 담기" onclick="goMenu()">
					<input type="button" value="시그니처 버거 담기" onclick="goSelf()">
					<input type="submit" value="주문하기">
				</td>
			</tr>
		</tfoot>
		
		<tbody>
		<tr><td colspan="5"><div style="height:10px;"></div></td></tr>	
		<%//메뉴 가져오기
			//총가격
			int total_price=0;
			int sig_count=0;
			Vector<String> v=new Vector<String>();
			for(int i=0;i<arr.size();i++){
				String price=arr.get(i).getTotal_pay();//개당 가격
				int num=arr.get(i).getItem_count();
				total_price+=Integer.parseInt(price)*num;
			}
			//나머지 정보, 테이블
			
			for(int i=0;i<arr.size();i++){
				Order_listDTO temp=arr.get(i);
				String menu=temp.getItem_name();
				int num=temp.getItem_count();
				String price=temp.getTotal_pay();//개당 가격
				
				Calendar now=Calendar.getInstance();
				int year=now.get(Calendar.YEAR);
				int month=now.get(Calendar.MONTH)+1;
				int date=now.get(Calendar.DATE);
				int hour=now.get(Calendar.HOUR_OF_DAY);
				int min=now.get(Calendar.MINUTE);
				
				if(menu.startsWith("signature")){
					v.add(menu);
					menu="<a href='javascript:sig"+sig_count+"();' class='a'>시그니처 버거</a>";
					sig_count++;
				}
			%>
				<tr>
					<td><%=menu%></td>
					<td><%=num%></td>
					<td><%=price%></td>
					<%-- <td><%=shop%></td> --%>
				<%if(i==0){ %>
					<td rowspan="<%=arr.size()%>"><%=year+"-"+month+"-"+date+" "+hour+":"+min%></td>
					<td rowspan="<%=arr.size()%>"><%=total_price%>원</td>
				<%} %>
				</tr>			
			<%
				
			}
		%>
		<tr><td colspan="5"><div style="height:20px;"></div></td></tr>
		</tbody>
		</table>
		</form>
		<br>
	</article>
	</section>
	
<script>
<%
for(int i=0;i<sig_count;i++){
%>
function sig<%=i%>(){
	window.open("/semi_burger/self/signature.jsp?no=<%=v.get(i)%>","sig","top=300,left=400,width=380,height=250");
}
<%} %>
</script>
<%@include file="/footer.jsp"%>
</body>
</html>