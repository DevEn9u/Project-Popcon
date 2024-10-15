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
					<img src="" alt="소개이미지" />
				</div>
				<div class="txt_wrap">
					<p>POPCON은 팝업스토어 Container의 줄임말로, </p>
					<p>팝업스토어 정보확인과 예약이 가능한 페이지 입니다. </p>
					<p>다양한 팝업과 함께 주변 상점들을 합리적인 가격으로 이용할 수 있도록 하며, </p>
					<p>사용자들의 문화 생활을 적극 지원하고자 합니다. </p>
				</div>
			</section>
		</main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
</body>
</html>