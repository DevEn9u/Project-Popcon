<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
<link rel="stylesheet"
	href="/css/popup_list.css?v=<?php echo time(); ?>">
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
				<span></span>
				<h2>팝업 컨테이너 관리</h2>
			</div>
			<section class="my_page">
				<div class="my_list adpop_my_list">
					<ul class="depth1">
						<li class="list_title on"><a href="/adpage/main.do"
							style="color: var(--txt-color-600)">게시물 관리</a></li>
						<ul class="depth2">
							<li><a href="/adpage/popup.do"
								style="color: var(--point-color1);">팝업 게시판</a></li>
							<li class="adpage_freeboard"><a href="/adpage/free.do">자유 게시판</a></li>
						</ul>
						<li class="list_title"><a href="/adpage/user.do">유저 관리</a></li>
						<li class="list_title"><a href="/adpage/chat.do">문의 채팅방</a></li>
					</ul>
				</div>
				<div class="pl_main ad_pl_main">
					<ul class="popup_wrap">
						<c:forEach var="popup" items="${popupList}">
							<li class="popup_banner"><a
								href="/popupBoard/view/${popup.board_idx}"> <img
									src="${popup.thumb}" alt="Thumbnail" class="popup_thumbnail"
									style="width: 100px; height: 100px;" />
									<div class="txt_title" style="margin-left: 10px;">
										<h2 class="adpage_popup_tit">
											${popup.board_title}
											<form id="deleteForm_${popup.board_idx}"
												action="/adpage/delete.do" method="post">
												<input type="hidden" name="board_idx"
													value="${popup.board_idx}" />
												<button class="pv_delete_btn" type="button"
													onclick="event.stopPropagation(); event.preventDefault(); if(confirm('정말 삭제하시겠습니까?')) { document.getElementById('deleteForm_${popup.board_idx}').submit(); }">
													삭제하기</button>
											</form>
										</h2>

										<div class="popup_location">
											<img src="../images/imgMGJ/pin.svg" /> <span
												class="location_span adpage_location_span"> ${fn:substringBefore(popup.popup_addr, ',')}</span>
										</div>
										<span class="popup_date">${popup.postdate}</span>
									</div>
							</a></li>
						</c:forEach>


					</ul>

				</div>
			</section>
		</main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
</body>
</html>