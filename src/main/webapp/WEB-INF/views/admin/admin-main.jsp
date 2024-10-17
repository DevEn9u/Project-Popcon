<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
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
			<div class="title_wrap">
				<h1>관리자 페이지</h1>
			</div>
			<section class="my_page">
				<div class="my_list">
					<ul class="depth1">
						<li class="list_title"><a href="/adpage/main.do"
							style="color: var(--txt-color-600);">게시물 관리</a></li>
						<ul class="depth2">
							<li><a href="/adpage/popup.do">팝업 게시판</a></li>
							<li class="adpage_freeboard"><a href="/adpage/free.do">자유 게시판</a></li>
						</ul>
						<li class="list_title"><a href="/adpage/user.do"
							style="color: var(--txt-color-600);">유저 관리</a></li>
						<li class="list_title"><a href="/adpage/chat.do"
							style="color: var(--txt-color-600);">문의 채팅방</a></li>
					</ul>
				</div>
				<div class="my_info_wrap" style="text-align: center;">
					<div class="ad_tit_wrap">
						<h2 style="margin-left: 0;">관리자 ${user_name}님, 환영합니다.</h2>
						<div class="ad_btn_wrap"
							style="text-align: center; display: inline-flex; gap: 20px;">
							<button class="btn" onclick="location.href='/adpage/popup.do';">팝업
								게시판 관리</button>
							<button class="btn" onclick="location.href='/adpage/free.do';">자유
								게시판 관리</button>
							<button class="btn" onclick="location.href='/adpage/user.do';">유저
								관리</button>
						</div>
					</div>
				</div>
			</section>
		</main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
</body>
</html>