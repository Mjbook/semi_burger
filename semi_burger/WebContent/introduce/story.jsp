<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yong Burger</title>
<link rel="stylesheet" type="text/css" href="/semi_burger/css/mainLayout.css">
<style>
	section li{
		margin: 0px auto;
	}
	.div1{
		text-align: center;
		font-size: 25px;
	}
	div .subtitle{
		font-size: 12px;
		float: right;
	}
	.head{
		margin:0 auto;
		position:relative;
		font-size:21px;
		letter-spacing:-2px;
		color:#4f4f4f;
		line-height:38px;
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
	.li1{
		font-size: 18px;
		color: gray;
	}
	.li2{
		font-size: 14px;
	}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<section>
	<article>
		<br>
		<div class="div1">
			<b>Yong Burger 소개</b><br>
			<span class="subtitle"> HOME > Yong Burger 소개 > YONG STORY&nbsp;&nbsp;&nbsp;</span>
			<br>
		</div>
		<hr>
		<br>
	</article>
	
	<article>
		<table>	
			<tr>
				<td> &nbsp;<a onclick="location='/semi_burger/introduce/ceo.jsp'"><b>CEO 인사말</b></a>&nbsp;</td>
				<th> &nbsp;<a onclick="location='/semi_burger/introduce/story.jsp'">YONG STORY</a>&nbsp;</th>
				<td> &nbsp;<a onclick="location='/semi_burger/introduce/road.jsp'"><b>찾아오시는 길</b></a>&nbsp;</td>
			</tr>
		</table>
		<br>
	</article>
	<article>
		<ul>
			<li>YOUNG BURGER의 특징!</li>
		</ul>
		<ol>
			<li><img src="/semi_burger/introduce/img/intro_img01.jpg"> <br>
				<span style="color:red; font-size:18px;"><b>하나.</b></span> <br>
				<br>
				<div class="li1">국내최초 한정판매 방식<br>
				버거전문점</div><br>
				<div class="li2">신선함과 퀄리티를 극대화 하기 위해 당일 판매할 분량만큼 만들어 판매하고 클로징하는 시스템을 유지하고 있습니다.</div>
				<br>
			</li>
							
			<li><img src="/semi_burger/introduce/img/intro_img03.jpg"> <br>
				<span style="color:red; font-size:18px;"><b>둘.</b></span><br>
				<br>
				<div class="li1">천연 효모 발효종<br>
				버거번 사용</div><br>
				<div class="li2">전문 매장에서 YONG BURGER를 위해 개발한<br>
				천연효모 발표 버거번을 사용합니다.</div>
				<br>
			</li> 
			
			<li><img src="/semi_burger/introduce/img/intro_img04.jpg"> <br>
				<span style="color:red; font-size:18px;"><b>셋.</b></span><br>
				<br>
				<div class="li1">매장에서 직접 패티를 제조하는<br>
				자가제육 방식</div><br>
				<div class="li2">냉동 패티를 사용하지 않기 위해 모든 매장에서 직접<br>
				패티를 만드는 방식으로 운영됩니다.</div>
				<br>
			</li>
			
			<li><img src="/semi_burger/introduce/img/intro_img06.jpg"> <br>
				<span style="color:red; font-size:18px;"><b>넷.</b></span><br>
				<br>
				<div class="li1">신선하고 안정적인<br>
				물류 시스템</div><br>
				<div class="li2">철저한 검수를 통해 질 좋은 식재료를 더욱 저렴하게<br>
				공급 받을 수 있도록 국내 최대 물류기업과 계약하여<br>
				모든 매장에서 안정적으로 재료를 공급받을 수 있도록 하였습니다.</div>
				<br>
			</li>
		</ol>
	</article>
</section>
<br>

<%@ include file="/footer.jsp" %>
</body>
</html>























