<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="board.board.notice.QA.QADTO" scope="page"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="board.board.notice.QA.QADAO" scope="session"/>

<%
int result=bdao.QAWrite(bdto);
String msg=result>0?"게시글 등록 완료!":"게시글 등록 실패!";
%>
<script>
window.alert('<%=msg%>')
location.href='QAList.jsp'

</script>