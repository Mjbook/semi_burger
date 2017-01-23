<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdao" class="member.MemberDAO" scope="session"/>

<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>YONG</title>	
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<meta name="author" content="" />
	<meta name="title" content="" />
	<meta name="keywords" content="" />
	<meta name="description" content="" /><!--20자 요약-->
	<meta name="robots" content="index,follow" />
	<meta name="googlebot" content="index,follow" />
	<link rel="stylesheet" href="./css/style.css" />
	<script type="text/javascript" src="./js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="./js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="./js/jquery.fancybox.pack.js"></script>
	<script type="text/javascript">
	var UserAgent = navigator.userAgent;
	if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
		 window.location.replace("/mobile/index.html");
		}
	</script>
	<!--[if lt IE 9]>
		<script src="./js/IE9.js"></script>
		<script src="./js/html5shiv.js"></script>
	<![endif]-->
</head>

<body>
<div id="wrapper">
	<div class="skipToContent">
		<a href="#content">본문 바로가기</a>
		<a href="#gnb">주메뉴 바로가기</a>
	</div>
	<header>		
		<div class="gnb_wrap clear_fix">
			<div class="top_gnb">
				<ul class="clear_fix">
				<%
					String sname = (String)session.getAttribute("sname");
				
					if(sname==null){
						%><!-- 로그인 전 -->
						<li><a href="/semi_burger/webfolder/member/login.jsp">로그인</a></li>				
						<li><a href="./franchise/inquiry.php">가맹문의</a></li>				
						<li><a href="./community/custom.php">고객센터</a></li>
						<%
					} else {
						%> <!-- 로그인 후 -->
						<li><a> <%=sname %> 님 로그인 중</a></li>				
						<li><a> 로그아웃 </a></li>				
						<li><a href="./community/custom.php">고객센터</a></li>
						<%
					}
				%>
				</ul>			
			</div>
			<h1><a href="./main"><img src="./images/top_logo.png" alt="꿉자" /></a></h1>
			<nav id="gnb">
				<ul class="clear_fix">
					<li data-gnb="0" class="memu_01"><a href="./koopja/intro.php">YONG 소개</a>
						<ul>
							<li><a href="./koopja/intro.php">본사소개</a></li>
							<li><a href="./koopja/brand.php">브랜드 스토리</a></li>
							<li><a href="./koopja/location.php">찾아오시는 길</a></li>
							<li><a href="./koopja/birth.php">탄생스토리</a></li>
						</ul>
					</li>
					<li data-gnb="1" class="memu_02"><a href="./franchise/guide.php">프랜차이즈</a>
						<ul>
							<li><a href="./franchise/guide.php">개설안내</a></li>
							<li><a href="./franchise/edge.php">가맹점 경쟁력</a></li>
							<li><a href="./franchise/interior.php">인테리어</a></li>
							<li><a href="./franchise/inquiry.php">창업문의</a></li>
						</ul>
					</li>
					<li data-gnb="2" class="memu_03"><a href="./menus/hotdog.php">메뉴소개</a>
						<ul>
							<li><a href="./menus/hotdog.php">그릴핫도그</a></li>
							<li><a href="./menus/burger.php">그릴버거</a></li>
							<li><a href="./menus/b_burger.php">그릴비프버거</a></li>
							<li><a href="./menus/pasta.php">파스타</a></li>
							<li><a href="./menus/chicken.php">치킨</a></li>
							<li><a href="./menus/dessert.php">사이드</a></li>
							<li><a href="./menus/wraps.php">랩</a></li>
							<li><a href="./menus/jumbo.php">점보</a></li>
						</ul>
					</li>
					<li data-gnb="3" class="memu_04"><a href="./store">매장안내</a>
						<ul>
							<li><a href="./store">매장찾기</a></li>
						</ul>
					</li>
					<li data-gnb="4" class="memu_05"><a href="./community/notice.php">커뮤니티</a>
						<ul>
							<li><a href="./community/notice.php">공지사항</a></li>
							<li><a href="./community/custom.php">고객의소리</a></li>
							<li><a href="./community/news.php">언론보도</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
		<div class="menu_bg"></div>
	</header>    


    <section id="content" class="page_main">
		<div class="main_slide_wrap">
			<ul class="main_top_slide">
				<li class="slide_01"><a href="./menus/hotdog.php">슬라이드1</a></li>
				<li class="slide_02"><a href="./menus/burger.php">슬라이드2</a></li>
				<li class="slide_03"><a href="./menus/hotdog.php">슬라이드3</a></li>
			</ul>
		</div>		
		<div class="main_content main_01">
			<ul class="clear_fix">
				<li class="list_01">
					<h2>베스트 메뉴</h2>
					<ul class="new_menu_slide">
						<li><a href="./menus/hotdog.php">
							<div class="img_box">
								<img src="./images/main_menu_01_1.jpg">
							</div>
							<div class="text_box">
								<h3>스위트칠리핫도그</h3>
								<p>상큼 매콤달콤을 자랑하며<br>아~사삭거리는야채 핫도그</p>
							</div>	
						</a></li>	
						<li><a href="./menus/burger.php">
							<div class="img_box">
								<img src="./images/main_menu_02_1.jpg">
							</div>
							<div class="text_box">
								<h3>베이컨치즈버거</h3>
								<p>기다란베이컨에.<br>꿉자만의 특제 치즈가~ 듬북~</p>
							</div>	
						</a></li>		
						<li><a href="./menus/b_burger.php">
							<div class="img_box">
								<img src="./images/main_menu_03_1.jpg">
							</div>
							<div class="text_box">
								<h3>인크레더블버거</h3>
								<p>한국인의 특제 버거<br>맛도! 양도! 최고!!</p>
							</div>	
						</a></li>		
						<li><a href="./menus/pasta.php">
							<div class="img_box">
								<img src="./images/main_menu_04_1.jpg">
							</div>
							<div class="text_box">
								<h3>소고기필라프</h3>
								<p>한끼식사로 입의 즐거움과<br>맛의 즐거움을 주는 메뉴~</p>
							</div>	
						</a></li>		
						<li><a href="./menus/pasta.php">
							<div class="img_box">
								<img src="./images/main_menu_05_1.jpg">
							</div>
							<div class="text_box">
								<h3>로제파스타</h3>
								<p>꿉자만의 불의 맛을 전달해드리는<br>꿉자 만의 파스타</p>
							</div>	
						</a></li>		
					</ul>
				</a></li>
				
				<li class="list_02">
					<h2>Notice <!-- <a href="">더보기</a> --></h2>
					
					<ul class="main_notice">
						<!--<li><a href="./community/notice.php">
								<img src="./images/open_s1.jpg" alt="5월 초 안산 와동점 그랜드 오픈">
							</a></li>-->
						<!-- <li><a href="./community/notice.php">
								<img src="./images/open_s2.jpg" alt="5월 말 분당 판교점 그랜드 오픈">
							</a></li> -->
							<li><a href="./community/notice.php">
								<img src="./images/open_s6.jpg" alt="8월 중 제주 시청점 그랜드 오픈">
							</a></li>
							<!-- <li><a href="./community/notice.php">
								<img src="./images/open_s5.jpg" alt="6월 중 인천 청라점 그랜드 오픈">
							</a></li> -->
							<li><a href="./community/notice.php">
								<img src="./images/open_s4.jpg" alt="9월 중 충남 아산점 그랜드 오픈">
							</a></li>							
					</ul>
				</li>
			</ul>
		</div>
		<div class="main_content main_02">
			<ul class="clear_fix">
				<li class="list_01"><a href="./store/">
					<h2>YONG 매장찾기</h2>
					<p>가까운 가맹점을<br>찾으실 수 있습니다.</p>
				</a></li>
				<li class="list_02"><a href="./franchise/inquiry.php">
					<h2>YONG 가맹문의 바로가기</h2>
					<p>1666-9225</p>
				</a></li>
			</ul>
		</div>
	</section>   

	
	 <footer id="footer">		
		<div class="footer_wrap">
			<p>YONG  |  TEL : 031)921-9455  |  FAX : 031)921-9456  |  대표 : YONG  |  사업자등록번호 : 128-38-02838  |  서울 특별시 동작구 123 - 456</p>
			<p>Copyright© 2016 MINJI ALL RIGHTS RESERVED.</p>
		</div><!--// footer_wrap-->
	</footer>
</div><!--//#wrapper-->
</body>
<script type="text/javascript" src="./js/script.js"></script>
</html>
   