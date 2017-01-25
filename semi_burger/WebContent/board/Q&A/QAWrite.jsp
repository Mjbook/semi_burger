<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<article>
			<h2> 문 의 사 항 </h2>
			<form name="QAWrite" action="QAWrite_ok.jsp">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer"></td>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"> </td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3" align="left">
					<input type="text" name="subject">
					</td>
				</tr>
				<tr>
					<td colspan="4" >
					<textarea rows="15" cols="50" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					
				</tr>
			</table>
			
			</form>
		</article>
	</section>
	<%@ include file="../../footer.jsp"%>
</body>
</html>