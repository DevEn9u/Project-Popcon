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
		<c:if test="${not empty message}">
			<script>
				alert("${message}");
			</script>
		</c:if>
		<c:if test="${not empty error}">
			<script>
				alert("${error}");
			</script>
		</c:if>
		${common_header }
		<main id="mp_container" style="margin-top: 80px;">
			<h1>관리자 페이지 - 유저 관리</h1>
			<section class="my_page">
				<div class="my_list edit_user_mylist">
					<ul class="depth1">
						<li class="list_title"><a href="/adpage/main.do">게시물 관리</a></li>
						<ul class="depth2">
							<li><a href="/adpage/popup.do">팝업 게시판</a></li>
							<li class="adpage_freeboard"><a href="/adpage/free.do">자유
									게시판</a></li>
						</ul>
						<li class="list_title on"><a href="/adpage/user.do">유저 관리</a>
						</li>
						<li class="list_title"><a href="/adpage/chat.do"
							style="color: var(--txt-color-400);">문의 채팅방</a></li>
					</ul>
				</div>
				<div class="my_info_wrap" style="text-align: center;">
					<div class="ad_tit_wrap">
						<h2 class="ad_edit_tit">유저 정보 수정</h2>
						<form action="/adpage/updateUser.do" method="post">
							<span style="font-weight:600;">유저 이름: </span><input type="hidden" name="id" value="${member.id}" /> <input
								type="text" id="name" name="name" value="${member.name}"
								style="width: 50%;" required />
							<div class="btn_wrap"
								style="margin-top: 30px; display: flex; gap: 20px;">
								<button type="submit" class="btn">이름 수정</button>
								<button type="submit" formaction="/adpage/user/delete.do"
									class="btn">강제 탈퇴</button>
								<button type="submit" formaction="/adpage/user/recover.do"
									class="btn">아이디 복구</button>
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