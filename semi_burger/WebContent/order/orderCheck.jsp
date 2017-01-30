<%@page import="yb.order_list.Order_listDTO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="yb.order_list.Order_listDAO"/>
<jsp:useBean id="odto" class="yb.order_list.Order_listDTO" scope="session"/>
<!DOCTYPE html>
<html>
<%
	String sid=(String)session.getAttribute("sid");
	if(sid==null||sid.equals("")){
%>
<script>
	window.alert('로그인 먼저 부탁드립니다.');
	location.href='/semi_burger/index.jsp';
</script>		
<%
	}
%>

<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css" >
</head>
<body>
<%@include file="/header.jsp"%>
	<section>
		<article>
			<table border="1">
				<tbody>
					<tr>
						<th>주문 일시</th>
						<th>메뉴</th>
						<th>주문 수량</th>
						<th>메뉴 가격</th>
						<th>합계</th>
					</tr>
					<%
					ArrayList<Order_listDTO> arr_odto=odao.getOrderList(sid);
					ArrayList<Integer> arr_menu_num=odao.getOrderMenuNumber(sid);
					if(arr_menu_num==null||arr_menu_num.size()==0){
						%>
					<tr>
						<td colspan="4">주문 내역이 없습니다.</td>
					</tr>
						<%
					}else{
						int row_count=0;
						for(int i=0;i<arr_menu_num.size();i++){
							int row=arr_menu_num.get(i);
							int total_price=0;
							
							for(int j=0;j<row;j++){
								Order_listDTO temp=arr_odto.get(row_count);
								
								Date date=temp.getOrder_date();
								String menu=temp.getItem_name();
								int num=temp.getItem_count();
								String price_s=temp.getTotal_pay();
								int price=Integer.parseInt(price_s);
								
								//주문별 총 금액 구하기
								
								
								
						%>
						<tr>
						<%		if(j==0){	%>
							<td rowspan="<%=row%>"><%=date%></td>
						<%		}			%>
							<td><%=menu %></td>
							<td><%=num %></td>
							<td><%=price/num %></td>
						<%		if(j==0){
									int temp_row=row_count;
									for(int k=0;k<row;k++){
										Order_listDTO temp1=arr_odto.get(temp_row);
										String temp_ps=temp1.getTotal_pay();
										int temp_p=Integer.parseInt(temp_ps);
										total_price+=temp_p;
										temp_row++;
									}
						%>
							<td rowspan="<%=row%>"><%=total_price%></td>
						<%		}	%>
						</tr>
						
						<%		
							row_count++;
							}
						}
					}
					%>
				</tbody>
			</table>
		</article>
	</section>
<%@include file="/footer.jsp"%>
</body>
</html>