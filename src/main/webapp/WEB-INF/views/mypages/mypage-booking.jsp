<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
<body>
<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="mp_container">
			<div class="title_wrap">
				<h1>마이페이지</h1>
				<span></span>
				<h2>예약 확인</h2>
			</div>
			<section class="my_page">
				<div class="my_list">
					<ul class="depth1">
						<li class="list_title active"><a href="/mypage/mypage.do">마이페이지</a>
						</li>
						<ul class="depth2">
							<li class="on"><a href="/mypage/myBooking.do">예약 확인</a></li>
							<li><a href="/mypage/myPoint.do">포인트 내역</a></li>
						</ul>
					</ul>
					<ul class="depth1">
						<li class="list_title"><a href="/mypage/myPost.do">내가 작성한
								글</a></li>
						<ul class="depth2">
							<li><a href="/mypage/myPost.do">내가 작성한 게시글</a></li>
							<li><a href="/mypage/myReview.do">내가 작성한 리뷰</a></li>
						</ul>
					</ul>
					<ul class="depth1">
						<li class="list_title"><a href="/mypage/likes.do">팝업</a></li>
						<ul class="depth2">
							<li><a href="/mypage/likes.do">좋아요 누른 팝업</a></li>
						</ul>
					</ul>
				</div>
				<div class="my_info_wrap">
					<div class="my_info">
						<div class="box2">
							<c:choose>
								<c:when test="${not empty booking}">
									<c:forEach var="booking" items="${booking}">
										<div class="popup_wrap">
											<div class="popup_txt">
												<span class="pop_icon"></span>
												<div class="info_wrap">
													<!-- 썸네일 자리 -->

													<strong>${booking.popup_title}</strong>
													<div class="dayman_wrap">
														날짜:
														<fmt:formatDate value="${booking.visit_date}"
															pattern="yyyy-MM-dd" />
														<span></span>
														<p class="headcount">인원: ${booking.headcount}</p>
													</div>
												</div>
											</div>
											<div class="popup_detail">
												<div class="top">
													<strong>${booking.popup_title}</strong> ${booking.price}원
												</div>
												<p style="font-size: 12px;">
													상기 일정은 지역 사정에 따라 변경될 수 있습니다.<br /> 자세한 내용은 게시판에서 확인하세요.
												</p>
												<div class="bottom">
													<c:if test="${booking.is_canceled == 0}">
														<form action="/mypage/cancelBooking.do" method="post">
															<input type="hidden" name="booking_num"
																value="${booking.booking_num}" />
															<button type="submit" class="mypage_cancel_btn">
																<span></span>취소하기
															</button>
														</form>
													</c:if>
													<c:if test="${booking.is_canceled == 1}">
														<p class="cancel_suc">이미 취소되었습니다</p>
													</c:if>
													<c:if test="${booking.is_canceled == 1}">
														<p style="margin-left: 20px;">취소 시 리뷰 작성이 불가능합니다</p>
													</c:if>
													<c:if test="${booking.is_canceled == 0}">
														<a href="/popupBoard/view/${booking.popup_idx}"><span></span>리뷰
															작성</a>
													</c:if>

												</div>

											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="noimg_wrap" style="text-align:center">
										<img src="../images/noimage.jpg" alt="없음" style="text-align:center; width:150px; height:150px;" />
									</div>
									<p style="text-align:center; font-weight:600; margin-top:20px;">최근 예약 내역이 없습니다</p>
								</c:otherwise>
							</c:choose>
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