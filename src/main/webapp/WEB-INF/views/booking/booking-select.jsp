<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="/css/booking_select.css?v=<?php echo time(); ?>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/booking.js?v=<?php echo time(); ?>"></script>
</head>
<script>
	
</script>
  <body>
  	${common_header }
	<main id="bs_container">
	  <div class="bs_inner">
	    <div class="bs_booking_tit">
	      <div class="inner">
	        <img
	          src="../images/imgMGJ/booking_img.png"
	          alt="booking_img"
	          class="bs_booking_img"
	        />
	        <span class="bs_location">
	          <img src="../images/imgMGJ/pin.svg" alt="pin" class="bs_pin" />
	          서울특별시 강남구 선릉로 807 K 현대미술관
	        </span>
	      </div>
	    </div>
		<div class="bs_main_box">
		    <div class="inner">
		      <div class="bs_booking_main">
		        <div class="caution_wrap">
		          <h2 class="booking_caution1">⸰ 예매 시 바로 확정</h2>
		          <h2 class="booking_caution2">⸰ 최대 10매까지 예매 가능</h2>
		        </div>
		        <ul class="select_wrap1">
		          <li class="select_date">
		            <img class=date_img src="../images/imgMGJ/calendar_icon.png" />
					<p>일정을 선택하세요</p>
		          </li>
		          <li class="select_calendar">
		            <table id="calendar">
		              <thead>
		                <tr class="calendar_tit">
		                  <th><input name="preMonth" type="button" value="<"></th>
		                  <th colspan="5" class="year_month"></th>
		                  <th><input name="nextMonth" type="button" value=">"></th>
		                </tr>
		                <tr class="calendar_day">
		                  <th>SUN</th>
		                  <th>MON</th>
		                  <th>TUE</th>
		                  <th>WED</th>
		                  <th>THU</th>
		                  <th>FRI</th>
		                  <th>SAT</th>
		                </tr>
		              </thead>
		              <tbody>
		              </tbody>
		            </table>
					<!-- 클릭한 날짜가 보이는 readonly input 추가 -->
					<div class="selected-date-container">
					    <label for="selectedDate">선택한 날짜</label>
					    <input type="text" id="selectedDate" class="selected-date" readonly />
					</div>
		          </li>
		          <li class="select_count">
		            <img class="date_img" src="../images/imgMGJ/mypage_icon.png" />
					<p>인원/수량을 선택하세요</p>
		          </li>
		          <li class="count_wrap">
		            <p class="count_type">일반</p>
		            <p class="count_pay"><input type="number" name="price" id="price" value="" />원</p>
		            <div class="pm_wrap">
		              <button class="plus_btn" aria-label="Add one item">+</button>
		              <div class="count_window">
						<input type="number" name="headcount" id="headcount" value="1" />
					  </div>
		              <button class="min_btn" aria-label="Remove one item">-</button>
		            </div>
		          </li>
		        </ul>
		      </div>
		      <div class="bookingbtn_wrap">
		        <button class="bs_booking_btn">예약하기</button>
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
