<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
	<c:import url="../include/header.jsp" var="common_header" />
	<c:import url="../include/mypage-list.jsp" var="mypage_list" />
	<c:import url="../include/footer.jsp" var="common_footer" />
	<script src="/js/mypage.js"></script>
</head>
<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="mp_container">
			<h1 style="margin-top:80px;">마이페이지</h1>
			<section class="my_page">
			${mypage_list }
				<div class="my_info_wrap">
					<div class="tit_wrap">
						<h2 class="mypage_uname">${user_name}님,환영합니다.</h2>
						<button type="button" class="edit_btn btn"
							onclick="location.href='/member/checkPass.do'">정보 수정</button>
					</div>
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
											<p>총 ${booking.price}원</p></li>
									</ul>
								</c:forEach>
								<c:if test="${empty booking}">
									<div class="likes_block_wrap">
										<div style="text-align: center; padding: 20px;">예약한
											팝업이 없습니다.</div>
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