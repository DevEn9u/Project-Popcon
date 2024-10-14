<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<!--<link rel="stylesheet" href="../css/popup_list.css?v=<?php echo time(); ?>">-->
<link rel="stylesheet" href="../css/pointshop.css?v=<?php echo time(); ?>">
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
		    <div class="inner">
		      <h2 class="tit">CUPON SHOP</h2>
		      <div class="pl_main">
				<c:if
					test="${memberDTO.authority == 'ROLE_ADMIN' || memberDTO.authority == 'ROLE_CORP'}">
					<button class="pl_write_btn" onclick="location.href='./write.do';">쿠폰 등록</button>
				</c:if>
				<ul class="cupon_wrap">
						<li class="cupon_banner">
								<div class="img_wrap">
									<img src="" alt="이미지" />
								</div>
								<div class="cupon_detail">
									<div class="cupon_tit">
										<p>쿠폰 이름</p>
										<button class="buy_btn"><img src="../images/buy_btn.svg" /></button>
									</div>
									<div class="popup_location">
										<span>한줄 설명</span>
									</div>
									<span class="cupon_price">500 POINTS </span>
								</div>
						</li>
						<li class="cupon_banner">
								<div class="img_wrap">
									<img src="" alt="이미지" />
								</div>
								<div class="cupon_detail">
									<div class="cupon_tit">
										<p>쿠폰 이름</p>
										<button class="buy_btn"><img src="../images/buy_btn.svg" /></button>
									</div>
									<div class="popup_location">
										<span>한줄 설명</span>
									</div>
									<span class="cupon_price">500 POINTS </span>
								</div>
						</li>
				</ul>
			  </div>
		    </div>
		  </main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
</body>
</html>