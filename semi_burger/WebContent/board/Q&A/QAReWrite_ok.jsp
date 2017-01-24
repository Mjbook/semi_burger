<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="board.board.notice.QA.QADTO" scope="page"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="board.board.notice.QA.QADAO" scope="session"/>

<%
int result=bdao.QAReWrite(bdto);
String msg=result>0?"문의 사항이 성공적으로 접수 되었습니다.!":"접수 실패 다시확인 바랍니다.";
%>
<script>
window.alert('<%=msg%>')
location.href='QAList.jsp'

</script>