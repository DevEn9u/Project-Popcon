<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
<link rel="stylesheet" href="/css/intro.css?v=<%= System.currentTimeMillis() %>" />
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />

<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="mp_container">
			<section class="intorduction">
				<h1 class="one_sentence">더 다양하고<br/>즐거운 경험을<br/>선사하기 위하여</h1>
				<div class="img_wrap">
					<img src="../images/introduction/intro_main.png" alt="소개이미지" />
				</div>
				<div class="txt_wrap">
					<p>POPCON은 팝업스토어 Container의 줄임말로,</p>
					<p>팝업스토어 정보확인과 예약이 가능한 페이지 입니다.</p>
					<p>다양한 팝업과 함께 주변 상점들을 합리적인 가격으로 이용할 수 있도록 하며,</p>
					<p>사용자들의 문화 생활을 적극 지원하고자 합니다.</p>
				</div>
			</section>
			<section class="vision">
				<h2 class="first">사용자와 함께 만들어 나가는 플랫폼</h2>
				<div class="txt_wrap">
					<p>리뷰를 통해 마일리지를 적립 받고</p>
					<p>차곡차곡 모아 쿠폰도 구매할 수 있는 곳</p>
				</div>
				<p class="sub_txt">사용자들이 이용할 수 있는 다양한 기능을 통해 활발한 플랫폼을 만들 예정입니다.</p>
			</section>
		</main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
</body>
</html>