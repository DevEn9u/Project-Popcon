<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<c:import url="../include/header.jsp" var="common_header" />
	<c:import url="../include/mypage-list.jsp" var="mypage_list" />
	<c:import url="../include/footer.jsp" var="common_footer" />
	<link rel="stylesheet" href="/css/mypage.css" />
	<script src="/js/mypage.js"></script>
</head>
<script>

$(document).ready(function() {
	$('.d_day').each(function() {
		// 쿠폰 만료기간을 String으로 만든 뒤 Date객체로 변환, millisecond 반환		
		const expiryDateStr = $(this).data('expiry');
		const expiryDate = new Date(expiryDateStr);
		
		const today = new Date();

		// millisecond로 계산
		const timeDiff = expiryDate - today;
		// 하루 단위로 계산
		const dDay = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));
		
		if (dDay === 0) {
			$(this).text('D-Day');
		}
		if (dDay < 0) {
			$(this).text('사용불가');
		}
		if (dDay > 0) {
			$(this).text('D-' + dDay);
		}
	});
});

</script>
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
          <h2>쿠폰</h2>
        </div>
        <section class="coupon_page">
          ${mypage_list }
          <div class="coupon_section">
            <div class="coupon_list_wrap">
              <c:forEach var="coupon" items="${couponList }">
	            <div class="coupon_list">
	              	<div class="img_wrap">
	              		<img src="${coupon.image_url }" alt="이미지" />
	              	</div>
	              	<div class="coupon_contents">
		               <ul class="coupon">
		               	<li class="coupon_name">${coupon.coupon_description }</li>
		               	<li class="coupon_num">쿠폰번호: ${coupon.purchase_idx }</li>
		               	<li class="coupon_desc">${coupon.coupon_name }</li>
		               	<li class="expiry_date"><fmt:formatDate value="${coupon.expiry_date }" pattern="YYYY. MM. dd " />까지</li>
		               	<li class="d_day" data-expiry="${fn:escapeXml(coupon.expiry_date.time)}"></li>
		               </ul>
	                </div>
	            </div>
              </c:forEach>
            </div>
          </div>
        </section>
      </main>
	  <footer id="footer">
	    <div class="inner">
	        ${common_footer}
	    </div>
	  </footer>
</body>
</html>