<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<style>
	.div1{
		text-align: center;
		font-size: 25px;
		background: url(/semi_burger/introduce/img/sub_top_bg01.jpg) 50% 50% no-repeat;
		background-size: cover;
	}
	div .subtitle{
		font-size: 12px;
		float: right;
		color: white;
	}
	section table{
		margin: 0px auto;
		border: 1px solid black;
		border-spacing: 0px;
	}
	th{
		border-right: 1px solid black;
		border-left: 1px solid black;
	}
	th, td{
		font-size: 13px;
		text-align: center;
		width: 130px;
		height: 40px;
	}
	.road li{
		list-style-type: none;
		text-align: center;
	}
	.title{
		margin:0 auto;
		position:relative;
		font-size:22px;
		letter-spacing:-2px;
		color:#4f4f4f;
		line-height:38px;
	}
	section a:link{
		text-decoration: none;
		color: gray;
	}	
	section a:active{
		text-decoration: none;
		color: gray;
	}
	sction a:visited{
		text-decoration: none;
		color: gray;
	}
	section a:hover{
		text-decoration: none;
		color: red;
	}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>

<section>
	<article style="padding-top: 20px;">
		<div class="div1">
		<br>
			<div style="color:white;font-size:30px;"><b>Yong Burger 소개</b><br></div>
			<br>
		</div>
		<br>
	</article>
	
	<div style="cursor:pointer;">
		<table>		
			<tr>
				<td> &nbsp;<a onclick="location='/semi_burger/introduce/ceo.jsp'"><b>CEO 인사말</b></a>&nbsp;</td>
				<th> &nbsp;<a onclick="location='/semi_burger/introduce/story.jsp'">YONG STORY</a>&nbsp;</th>
				<td> &nbsp;<a onclick="location='/semi_burger/introduce/road.jsp'"><b>찾아오시는 길</b></a>&nbsp;</td>
			</tr>
		</table>
		<br>
	</div>
	
	<article>
		<ul class="road">
			<li><img src="/semi_burger/introduce/img/dot.png" width="40" height="40"></li>
			<li class="title">찾아오시는 길</li>
			<br>
			<li style="color: skyblue; font-size:17px;"><b>한번 먹어보면 푹 빠지는 <span style="color:blue;">맛있는</span><br>
				수제 햄버거 YONG BURGER를 만나보세요!</b>
			</li>
			<br>
			<br>
			<li><img src="/semi_burger/introduce/img/map.jpg"></li>
		</ul>	
	</article>
</section>
<br>
<br>

<%@ include file="/footer.jsp" %>
</body>
</html>