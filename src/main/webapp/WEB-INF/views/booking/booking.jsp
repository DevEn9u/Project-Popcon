<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/booking_main.css?v=<?php echo time(); ?>">
  <body>
	
  	${common_header }
    <main id="bm_container">
      <div class="booking_main_inner">
        <div class="booking_tit">
		  <div class="inner">
	          <img
	            src="${details.thumb}"
	            alt="details.thumb"
	            class="booking_img"
	          />
	          <div class ="bm_img_tit">${details.board_title}</div>
	          <span class="bm_location">
	            <img src="/images/imgMGJ/pin.svg" alt="" class="bm_pin" />${fn:substringBefore(details.popup_addr, ',')}</span
	          >
		  </div>
        </div>
        <div class="booking_main">
		  <div class="inner">
	          <h2 class="bm_main_tit">예매</h2>
	          <div class="booking_box">
	            <h2 class="box_tit">${details.board_title}</h2>
	            <h3 class="box_pay">${formattedFee}원</h3>
	            <span class="box_date">이용 기간: ${details.start_date} ~ ${details.end_date}</span>
				<button class="bm_booking_btn" onclick="location.href = `/popupBoard/select/${board_idx}`">예매하기</button>
	          </div>
	          <div class="bm_qna_box">
	            <h2 class="bm_qna_tit">문의하기</h2>
	            <div class="bm_qna_main">
	              <img src="/images/imgMGJ/call.png" alt="call" class="bm_call" />
	              <span
	                >예매/취소/환불 문의<br />
	                1588-7890<br />
	                월 ~ 일 10:00 ~ 19:00</span
	              >
	            </div>
	          </div>
		  </div>
        </div>
      </div>
    </main>
    <footer id="footer">
		<div class="inner">
		    ${common_footer}
		</div>
    </footer>
  </body>
</html>
