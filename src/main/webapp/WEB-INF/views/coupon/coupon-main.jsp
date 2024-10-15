<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
	<link rel="stylesheet" href="../css/coupon.css?v=<?php echo time(); ?>">
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />

<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="container">
	      <div class="tit_wrap">
	      	<div class="inner">
		      	<h2 class="tit_wrap">COUPON</h2>
				<c:if
					test="${memberDTO.authority == 'ROLE_ADMIN' || memberDTO.authority == 'ROLE_CORP'}">
					<button class="pl_write_btn" onclick="location.href='./write.do';">쿠폰 등록</button>
				</c:if>
	      	</div>
	      </div>
   		  <div class="pl_main">
		    	<div class="inner">
				<ul class="coupon_wrap">
					<c:forEach var="coupon" items="${couponList}">
					<li class="coupon_banner">
						<div class="img_wrap">
							<img src="${coupon.image_url }" alt="이미지" />
						</div>
						<div class="coupon_detail">
							<div class="coupon_tit">
								<p>${coupon.coupon_name }</p>
								<button class="buy_btn" onclick="location.href='./buy.do'"><img src="/images/coupon/buy_icon4.svg" /></button>
							</div>
							<div class="popup_location">
								<span>${coupon.coupon_description }</span>
							</div>
							<!-- 가격은 세자리수마다 콤마를 찍는 포맷 만들어 변수 처리 -->
							<fmt:formatNumber value="${coupon.points}" var="formattedPoints" />
							<span class="coupon_price">${formattedPoints } Pts </span>
						</div>
					</li>
					</c:forEach>
				</ul>
			  </div>
		    </div>
		  </main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
</body>
</html>