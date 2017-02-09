<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="board.QA.QADTO" scope="page"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="board.QA.QADAO" scope="session"/>

<%
int result=bdao.QAReWrite(bdto);
String msg=result>0?"등록 완료!!":"등록에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>')
location.href='QAList.jsp'

</script>