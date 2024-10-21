<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
<link rel="stylesheet" href="/css/intro.css?v=<%= System.currentTimeMillis() %>" />
<script src="/js/mypage.js"></script>
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<c:import url="../include/introduction-list.jsp" var="intro_list" />

<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="mp_container">
			<section class="mypage">
				${intro_list }
				<div class="intro_wrap">
					<div class="introduction">
						<div class="txt_wrap intro_txt">
							<p>POPCON은 팝업스토어의 저장창고, Popup Container입니다.</p>
							<p>팝업스토어 전문 B2B2C 플랫폼을 지향합니다.</p>
						</div>
					</div>
					<div class="vision">
						<h2 class="first">사용자와 함께 만들어 나가는 플랫폼</h2>
						<div class="txt_wrap">
							<p>리뷰를 통해 포인트를 적립하고</p>
							<p>차곡차곡 모아 쿠폰도 구매할 수 있는 곳</p>
						</div>
						<p class="sub_txt">사용자와 팝업스토어 비즈니스를 연결하고 사용자간 활발한 정보공유가 이루어지는 플랫폼을 만들겠습니다.</p>
					</div>
				</div>
			</section>
		</main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
</body>
</html>