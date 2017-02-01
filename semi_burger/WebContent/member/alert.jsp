<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
    <script>
	  function show1(){
		  window.alert('제일 기본적인 경고창입니다 삐삐');
	  }
	  function show2(){
		  var result = window.confirm('탈퇴하시겠습니까?');
		  if(result){
			  window.alert('다음에 재가입이 불가합니다');
		  } else{
			  window.alert('잘 생각하셨어요');
		  }
	  }
	  function show3(){
		  var result=window.prompt('아래에 이름을 입력해주세요','여기에 입력');
		  window.alert(result);
	  }

	</script>
 </head>
	 <body>
	   <input type="button" value="경고창1" onclick="show1()">
	   <input type="button" value="경고창2" onclick="show2()">
	   <input type="button" value="경고창3" onclick="show3()">	   
	 </body>
</html>
<!-- 경고창 종류 3가지 -->