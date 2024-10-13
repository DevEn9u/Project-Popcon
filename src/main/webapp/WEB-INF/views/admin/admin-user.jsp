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
			<h1>관리자 페이지 - 유저 관리</h1>
			<section class="my_page">
				<div class="my_list">
					<ul class="depth1">
						<li class="list_title"><a href="/adpage/main.do">게시물
								관리</a></li>
						<ul class="depth2">
							<li><a href="/adpage/popup.do">팝업 게시판</a></li>
							<li><a href="/adpage/free.do">자유 게시판</a></li>
						</ul>
						<li class="list_title on"><a href="/adpage/main.do">유저 관리</a>
						</li>
					</ul>
				</div>
				<div class="my_info_wrap" style="text-align: center;">
					<div class="ad_tit_wrap">
						<h2 style="margin-left: 0;">정보를 수정할 유저의 아이디를 입력하세요</h2>
						<div class="row input_wrap2">
							<form action="/adpage/user/edit.do" method="get">
								<input type="text" name="id" placeholder="아이디를 입력하세요."
									style="width: 50%;" required>
								<div class="btn_wrap" style="margin-top: 30px;">
									<button type="submit" class="btn">입력</button>
								</div>

							</form>

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