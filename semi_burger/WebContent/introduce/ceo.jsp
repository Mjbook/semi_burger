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
		list-style-type: none;
		margin: 0px auto;
	}
	.div1{
		text-align: center;
		font-size: 25px;
		background:url(/semi_burger/introduce/img/sub_top_bg01.jpg) 50% 50% no-repeat;
		background-size:cover;
	}
	.head{
		margin:0 auto;
		position:relative;
		font-size:21px;
		letter-spacing:-2px;
		color:#4f4f4f;
		line-height:38px;
	}
	.headtable{
		margin: 0px auto;
		border: 1px solid black;
		border-spacing: 0px;
	}
	th{
		border-right: 1px solid black;
		border-left: 1px solid black;
	}
	.headtable th, td{
		font-size: 13px;
		text-align: center;
		width: 130px;
		height: 40px;
	}
	.li1{
		font-size: 14px;
	}
	.maintable{
		border: 1px solid black;
		width: 900px;
		margin: 0px auto;
	}
	.maintable td{
		border-right: 1px solid black;
		border-bottom: 1px solid black;
	}
	.maindiv1{
		background:url(/semi_burger/introduce/img/sub1_1_bg01.png) 0 100% no-repeat;
		background-size: cover;
		
	}

</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<section>
	<article>
		<div class="div1">
		<br>
			<div style="color:white;font-size:30px;"><b>Yong Burger 소개</b><br></div>
			<br>
		</div>
		<br>
	</article>
	
	<article>
		<table class="headtable">	
			<tr>
				<td> &nbsp;<a onclick="location='/semi_burger/introduce/ceo.jsp'"><b>CEO 인사말</b></a>&nbsp;</td>
				<th> &nbsp;<a onclick="location='/semi_burger/introduce/story.jsp'">YONG STORY</a>&nbsp;</th>
				<td> &nbsp;<a onclick="location='/semi_burger/introduce/road.jsp'"><b>찾아오시는 길</b></a>&nbsp;</td>
			</tr>
		</table>
		<br>
	</article>
	
	<div class="maindiv1">
		<div class="maindiv2">
			<div>
				<img src="/semi_burger/introduce/img/hat.png" width="50" height="50"><br>
				<h2 style="color:gray;"><span style="color:red;">YONG BURGER는</span><br>
					미국의 버거 레시피를 한국인의 입맛에 맞게 업그레이드하여 <br>
					한번 먹어보면 버거에 빠지는 매력을 가진 수제 햄버거 브랜드입니다.<br>
				</h2>				
				<p>국내 유일의 순쇠고기 냉장패티 수제 버거전문점으로<br>
				   다른 패스트푸드점과 달리 고객에게 신선하고 따뜻한 햄버거를 제공하기 위해 주문과 동시에 조리가 시작됩니다.</p>
			</div>
			<br>
			<br>
			<br>
			<ol>
				<li>
					<div style="font-size: 24px;">YONG BURGER는</div>
					<p>신선한 재료만 사용합니다.<br>
						주 재료인 쇠고기, 양상추, 토마토, 양파, 버거번 등 모든 재료는 당일 배송된 신선한 상태의 원재료만 사용하였습니다.</p>
					<br>
				</li>
				<li>			
					<div style="font-size: 24px;">YONG BURGER는</div> 재료비를 아끼지 않습니다.<br>
					<div class="li1">버거 패티에 가장 좋은 쇠고기 부위를 사용하고, 모든 야채도 철저한 검수를 통해 질 좋은 상품을 구입하였으며,<br>
					치즈와 소스재료 모두 여러 구매경로를 통해 퀄리티는 높이고 가격은 낮췄습니다.</div>
					<br>
				</li>
				<li>
					<div style="font-size: 24px;">YONG BURGER는</div> 맛과 함께 건강도 생각합니다.<br>
					<div class="li1">버거는 안좋은 음식이라는 편견을 깨기 위해, 패티에 첨가물이나 필러를 넣지 않았고, 모든 메뉴에 인공 조미료 사용을 배제하였으며,<br>
					깨끗한 올리브오일과 카놀라유 등 식물성 기름만 사용하여 건강까지 생각하였습니다.</div>
					<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
				</li>
			</ol>			
		</div>
	</div>
</section>
<br>

<%@ include file="/footer.jsp" %>
</body>
</html>