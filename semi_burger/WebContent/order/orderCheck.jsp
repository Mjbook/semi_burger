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
	return;
	}
%>

<head>
<meta charset=UTF-8>
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css" >
</head>
<%
ArrayList<Order_listDTO> arr_odto=odao.getOrderList(sid);
ArrayList<Integer> arr_menu_num=odao.getOrderMenuNumber(sid);
%>
<body>
<%@include file="/header.jsp"%>
	<section>
		<article>
			
					<%
					//1page에 5개씩 출력
					int print_num=0;
					int start_num=0;
					int page_num=0;
					
					int row_count=0;
					
					if(arr_menu_num.size()>5){
						String pn_s=request.getParameter("pn");
						if(pn_s==null||pn_s.equals("")){
							print_num=5;
						}else{
							int temp=Integer.parseInt(pn_s);
							start_num=(temp-1)*5;
							print_num=5*temp<arr_menu_num.size()?5+temp:arr_menu_num.size();
							for(int i=0;i<start_num;i++){
								row_count+=arr_menu_num.get(i);
							}
						}
						
						page_num=(arr_menu_num.size())%5==0?arr_menu_num.size()/5:arr_menu_num.size()/5+1;
						
					}else{
						print_num=arr_menu_num.size();
					}
					

					for(int i=start_num;i<print_num;i++){
					%>
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
						if(arr_menu_num==null||arr_menu_num.size()==0){
					%>
					<tr>
						<td colspan="4">주문 내역이 없습니다.</td>
					</tr>
					<%
						break;
						}else{
							
							
							int row=arr_menu_num.get(i);
							int total_price=0;
							String address="";
							for(int j=0;j<row;j++){
								Order_listDTO temp=arr_odto.get(row_count);
								
								Date date=temp.getOrder_date();
								String hm=temp.getDate_hm();
								
								String menu=temp.getItem_name();
								int num=temp.getItem_count();
								String price_s=temp.getTotal_pay();
								int price=Integer.parseInt(price_s);
								address=temp.getOrder_shop();
						
						%>
						<tr>
						<%		if(j==0){	%>
							<td rowspan="<%=row%>"><%=date%><br><%=hm%></td>
						<%		}			%>
							<td><%=menu %></td>
							<td><%=num %></td>
							<td><%=price/num %></td>
						<%		if(j==0){ //주문별 총 금액 구하기
									int temp_row=row_count;
									for(int k=0;k<row;k++){
										Order_listDTO temp1=arr_odto.get(temp_row);
										String temp_ps=temp1.getTotal_pay();
										int temp_p=Integer.parseInt(temp_ps);
										total_price+=temp_p;
										temp_row++;
									}
						%>
							<td rowspan="<%=row%>"><%=total_price%>원</td>
						<%		}	%>
						</tr>
						
						<%		
							row_count++;
							}
						%>
						<tr>
							<th>주소</th>
							<td colspan="4"><%=address %></td>
						</tr>
						<%
						}
					%>
					</tbody>
				</table>
				<br>
					<%} %>
					
		</article>
		
		<p><%
		for(int i=0;i<page_num;i++){
			%><a href="orderCheck.jsp?pn=<%=i+1%>"><%=i+1+"\t"%></a><%
		}%></p>
	</section>
<%@include file="/footer.jsp"%>
</body>
</html>