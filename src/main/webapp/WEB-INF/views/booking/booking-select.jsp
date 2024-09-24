<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/booking_select.css?v=<?php echo time(); ?>">
  <body>
  	${common_header }
    <main id="bs_container">
      <div class="bs_inner">
        <div class="bs_booking_tit">
          <img
            src="../images/imgMGJ/booking_img.png"
            alt="booking_img"
            class="bs_booking_img"
          />
          <span class="bs_location">
            <img src="../images/imgMGJ/pin.svg" alt="pin" class="bs_pin" /> 서울특별시
            강남구 선릉로 807 K 현대미술관</span
          >
        </div>
        <div class="bs_main_box">
          <div class="bs_booking_main">
            <div class="caution_wrap">
              <h2 class="booking_caution1">⸰예매 시 바로 확정</h2>
              <h2 class="booking_caution2">⸰최대 10매까지 예매 가능</h2>
            </div>
            <ul class="select_wrap1">
              <li class="select_date">
                <img src="../images/imgMGJ/calendar_icon.png" />일정을 선택하세요
              </li>
              <div class="select_calendar">캘린더 구현</div>
              <li class="select_count">
                <img src="../images/imgMGJ/mypage_icon.png" />인원/수량을 선택하세요
              </li>
              <div class="count_wrap">
                <div class="count_type">일반</div>
                <div class="count_pay">10,000원</div>
                <div class="pm_wrap">
                  <button class="plus_btn">+</button>
                  <div class="count_window">1</div>
                  <button class="min_btn">-</button>
                </div>
              </div>
            </ul>
          </div>
          <div class="bookingbtn_wrap">
            <button class="bs_booking_btn">예약하기</button>
          </div>
        </div>
      </div>
    </main>
    <footer id="footer">
    ${common_footer }
    </footer>
  </body>
</html>
