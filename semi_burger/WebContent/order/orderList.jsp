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
		window.alert('메뉴를 선택하세요');
		location.href="/semi_burger/burgerMenu/burgerMenu.jsp";
		</script>
		<%
	}
%>
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
	<section>
	<article>
		<form name="orderList" action="orderList_ok.jsp">
		<table>
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
				<th>주문자</th>
				<td colspan="4"><input type="text" name="name" value="<%=sid%>" disabled="disabled"></td>
			</tr>
			<tr>
				<th>배달 수령 주소</th>
				<td colspan="4"><input type="text" name="addr" value="<%=addr%>" required="required"></td>
			</tr>
			<tr>
				<td colspan="5" align="center"><input type="submit" value="주문하기"></td>
			</tr>
		</tfoot>
		
		<tbody>	
		<%//메뉴 가져오기
			//총가격
			int total_price=0;	
			for(int i=0;i<arr.size();i++){
				Order_listDTO temp=arr.get(i);
				String price=temp.getTotal_pay();//개당 가격
				int num=temp.getItem_count();
				total_price+=Integer.parseInt(price)*num;
			}
			//나머지 정보, 테이블
			for(int i=0;i<arr.size();i++){
				Order_listDTO temp=arr.get(i);
				String menu=temp.getItem_name();
				int num=temp.getItem_count();
				String price=temp.getTotal_pay();//개당 가격
				//	String shop=temp.getOrder_shop();
				Calendar now=Calendar.getInstance();
				int year=now.get(Calendar.YEAR);
				int month=now.get(Calendar.MONTH)+1;
				int date=now.get(Calendar.DATE);
				int hour=now.get(Calendar.HOUR_OF_DAY);
				int min=now.get(Calendar.MINUTE);
			%>
				<tr>
					<td><%=menu%></td>
					<td><%=num%></td>
					<td><%=price%></td>
					<%-- <td><%=shop%></td> --%>
				<%if(i==0){ %>
					<td rowspan="<%=arr.size()%>"><%=year+"-"+month+"-"+date+" "+hour+":"+min%></td>
					<td rowspan="<%=arr.size()%>"><%=total_price%></td>
				<%} %>
				</tr>			
			<%
				
			}
		%>
		</tbody>
		</table>
		</form>
	</article>
	</section>
<%@include file="/footer.jsp"%>
</body>
</html>