<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/mypage-list.jsp" var="mypage_list" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet"
	href="/css/popup_list.css?v=<?php echo time(); ?>">
<script src="/js/mypage.js"></script>
</head>
<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="mp_container">
			<h1>마이페이지</h1>
			<section class="my_page">
				<!-- 기업회원이 아닐 경우 리스트 출현 -->
				<c:if test="${authority != 'ROLE_CORP'}">	
					${mypage_list }
				</c:if>
				<!-- 기업회원의 경우 리스트 숨김처리 -->
				<c:if test="${authority == 'ROLE_CORP'}">
					<div class="my_list" style="visibility: hidden">
						<ul class="depth1">
							<li class="list_title"><a href="/mypage/myPost.do">작성
									게시물</a>
								<ul class="depth2">
									<li data-page="myPost"><a href="/mypage/myPost.do">내가
											작성한 팝업</a></li>
								</ul></li>
						</ul>
					</div>
				</c:if>
				<div class="my_info_wrap">
					<div class="tit_wrap">
						<h2 class="mypage_uname">${user_name}님,환영합니다.</h2>
						<button type="button" class="edit_btn btn"
							onclick="location.href='/member/checkPass.do'">정보 수정</button>
					</div>
					<!-- 기업회원이 아닐 경우 포인트와 예약내역 출현 -->
					<c:if test="${authority != 'ROLE_CORP'}">
						<div class="my_info">
							<div class="my_mile box1">
								<div class="top">
									<strong>포인트</strong> <a href="/mypage/myPoint.do"><p>
											자세히 보기<span></span>
										</p></a>
								</div>
								<h3>${point }P</h3>
							</div>
							<div class="my_recent box1">
								<div class="top">
									<strong>최근 예약 내역</strong> <a href="/mypage/myBooking.do">
										<p>
											자세히 보기<span></span>
										</p>
									</a>
								</div>
								<div class="booking_wrap">
									<c:forEach var="booking" items="${booking}">
										<ul class="booking_list">
											<li><strong>${booking.popup_title}</strong>
												<div class="txt_wrap">
													<fmt:formatDate value="${booking.visit_date}"
														pattern="yyyy-MM-dd" />
													<span></span>${booking.headcount}인
												</div>
												<p>
													총
													<fmt:formatNumber>${booking.price}</fmt:formatNumber>
													원
												</p></li>
										</ul>
									</c:forEach>
									<c:if test="${empty booking}">
										<div class="likes_block_wrap">
											<div style="text-align: center; padding: 20px;">예약한 팝업이
												없습니다.</div>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</c:if>
					<!-- 기업회원일 경우 쓴 팝업만 출현 -->
					<div class="my_info_wrap">
						<div class="my_info">
							<div class="box3">

								<!-- 기업회원 부분 -->
								<c:if test="${authority == 'ROLE_CORP'}">
									<div class="top_txt">
										<p>최근 내가 작성한 게시글</p>
									</div>
									<div class="pl_main">
										<ul class="popup_wrap">
											<c:forEach var="popup" items="${popupList}">
												<li class="popup_banner"><a
													href="/popupBoard/view/${popup.board_idx}"> <img
														src="${popup.thumb}" alt="Thumbnail"
														class="popup_thumbnail"
														style="max-width: 100px; max-height: 100px;" />
														<div class="txt_title" style="margin-left: 10px;">
															<h2 class="mp_corp_h2">
																${popup.board_title}
																<form id="deleteForm_${popup.board_idx}"
																	action="/adpage/delete.do" method="post">
																	<input type="hidden" name="board_idx"
																		value="${popup.board_idx}" />
																	<button class="pv_delete_btn pv_mp_delete_btn"
																		type="button"
																		onclick="event.stopPropagation(); event.preventDefault(); if(confirm('정말 삭제하시겠습니까?')) { document.getElementById('deleteForm_${popup.board_idx}').submit(); }">
																		삭제하기</button>
																</form>
															</h2>
															<div class="popup_location">
																<img src="../images/imgMGJ/pin.svg" /> <span
																	class="location_span mp_location">${fn:replace(popup.popup_addr, ',', ' ')}</span>
															</div>
															<span class="popup_date mp_popup_date">${popup.postdate}</span>
														</div>
												</a></li>
											</c:forEach>
										</ul>
									</div>
								</c:if>

							</div>
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