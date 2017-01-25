 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
<%@ page import="java.util.*" %>
<%@ page import="yb.burger.*" %>
--%>
<jsp:useBean id="sdto" class="yb.burger.SideDTO"/>
<jsp:setProperty property="*" name="sdto"/>
<jsp:useBean id="sdao" class="yb.burger.SideDAO"/>

<%
ArrayList<SideDTO> al2=sdao.SideMenu(sdto);

%>

<script>
function side_up(){
	window.open("/semi_burger/sideMenu/side_up.jsp","side_up","top=300,left=400,width=350,height=250");
}
function side_reload(){
	window.open("/semi_burger/sideMenu/side_reload.jsp","side_reload","top=300,left=400,width=350,height=250");
}
function side_delete(){
	window.open("/semi_burger/sideMenu/side_delete.jsp","side_delete","top=300,left=400,width=350,height=250");
}

</script>

	<article>
		<form name="sideMenu">
			<table border="1">
				<tr>
				<%
				for(int i=0;i<al2.size();i++){
					if(i%2==0&&i!=al2.size()){
					%>
					</tr><tr>
					<%
					}
					%>
					<th><img src="../side_img/<%=al2.get(i).getSideitem_img_src()%>" width="300" height="260"></th>
					<td align="center" width="300" height="260">
					<%=al2.get(i).getSideitem_name() %>
					<br><br><br>
					<%=al2.get(i).getSideitem_pay()+"원" %>
					<br><br><br>
					<select name="s<%=i%>">
					<%
						for(int j=0;j<=100;j++){
							%>

							<option value="<%=j%>"><%=j %></option>
							<%
						}
					%>
					</select>
					<input type="hidden" name="s<%=i %>_check" value="false">
					<input type="button" value="담기" onclick="javascript:addside<%=i%>(<%=i%>)">
					</td>
					
				<%
				}
				%>
				<%
				//burgerMenu.jsp에 있는 sid 사용함
				if(sid!=null){
					if(sid.equals("admin")){
					%>
					<tr>
					<td colspan="4" align="right" width="600">
					<input type="button" value="메뉴등록" onclick="side_up()">
					<input type="button" value="메뉴수정" onclick="side_reload()">
					<input type="button" value="메뉴삭제" onclick="side_delete()">
					</td>
					</tr>
					<%
					}
				}
				%>
			</table>
		</form>
	</article>
