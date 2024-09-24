<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="/css/booking_select.css?v=<?php echo time(); ?>">
  <body>
  <script>
  
  /* 설정 */
	const config = {
		dateFormat: 'yy-mm-dd',
		showOn : "button",
		buttonText:"날짜 선택",
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    yearSuffix: '년',
      changeMonth: true,
      changeYear: true
	}
  $(function() {
	  $( "input[name='publeYear']" ).datepicker(config);
	});
  </script>

  
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
              <div class="select_calendar">
              <input name="publeYear" autocomplete="off" readonly="readonly"
              	placeholder="클릭하여 날짜를 선택하세요">
              	<!-- <p>Date: <input type="text" id="datepicker"></p> -->
              </div>
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
