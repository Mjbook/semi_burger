<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="qdao" class="board.QA.QADAO"/>
    

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String pwd = request.getParameter("pwd");
	
	String dbpwd = qdao.getPwd(idx);
		

	if(pwd.equals(dbpwd)){
		
		int result = qdao.qaDel(idx, pwd);
			
		if(result>0){
			%>
			<script>
			window.alert('삭제되었습니다');
			opener.location.href='/semi_burger/board/QnA/QAList.jsp';
			window.self.close();
			</script>
			<%	  					
		}
	} else{
		%>
		<script>
			window.alert('<%=pwd%>/<%=dbpwd%>');
			history.back();
		</script>
		<%
	}
%>
