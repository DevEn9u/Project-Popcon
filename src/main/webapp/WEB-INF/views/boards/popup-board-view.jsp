<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/popup_view.css?v=<?php echo time(); ?>">
  <body>
  	${common_header }
    <main id="popup_view_container">
      <div class="popup_view_inner">
        <div class="swiper">
          <!-- Additional required wrapper -->
          <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide">
              <a href="#">
                <div class="img_wrap">
                  <img
                    src="../images/imgMGJ/main_slider1.png"
                    alt="main1"
                    class="main_slider1"
                  />
                  <img
                    src="../images/imgMGJ/main_slider2.png"
                    alt="main2"
                    class="main_slider2"
                  />
                </div>
              </a>
            </div>
            <div class="swiper-slide">
              <a href="#">
                <div class="img_wrap">
                  <img
                    src="../images/imgMGJ/main_slider1.png"
                    alt="main1"
                    class="main_slider1"
                  />
                  <img
                    src="../images/imgMGJ/main_slider2.png"
                    alt="main2"
                    class="main_slider2"
                  />
                </div>
              </a>
            </div>
            <div class="swiper-slide">
              <a href="#">
                <div class="img_wrap">
                  <img
                    src="../images/imgMGJ/main_slider1.png"
                    alt="main1"
                    class="main_slider1"
                  />
                  <img
                    src="../images/imgMGJ/main_slider2.png"
                    alt="main2"
                    class="main_slider2"
                  />
                </div>
              </a>
            </div>
            ...
          </div>
          <!-- If we need pagination -->
          <div class="swiper-pagination"></div>

          <!-- If we need navigation buttons -->
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
        </div>
        <div class="pv_content_wrap">
          <div class="pv_title">
            <span class="pv_sub_title">헤이딜러</span>
            <h2 class="pv_main_title">
              <span class="pv_title_text"
                >헤이딜러 X 아모레퍼시픽 &lt;내차조향소&gt; in 제주</span
              >
              <button class="pv_booking_btn">예약하기</button>
              <img src="../images/imgMGJ/like_btn.svg" alt="좋아요" class="like_btn" />
            </h2>
            <div class="pv_title_date">2024. 09. 11 ~ 2024. 10. 01</div>
            <span class="pv_title_location"
              ><img src="../images/imgMGJ/pin.svg" />제주특별자치도 제주시 애월읍 월각로
              927 카페 제주당</span
            >
          </div>
          <div class="open_time_wrap">
            <h2 class="open_time">운영 시간</h2>
            <div class="weekdays">
              월 - 금 11:00 ~ 17:00 <br />
              토 10:30 ~ 16:30
            </div>
          </div>
          <div class="content">
            <h2 class="content_tit">팝업 스토어 소개</h2>
            <div class="main_content">
              HEY DEALER X AMORE PACIFIC <br />
              <br />헤이딜러의 IT혁신 정신과 아모레퍼시픽의 미래지향적인 미학이
              만나, 차량 공간을 위한 가장 미래적인 향을 제안합니다. <br />
              내 차 번호판만 치면 AI자판기가 맞춤형 카디퓨저를 출력해 드려요.
              <br />
              지금 바로, 내차조향소에서 내 차만을 위한 카디퓨저를 받아보세요.
              <br /><br />
              &lt;A.I CAR DIFFUSER CALENDAR&gt; <br />
              내차조향소 자판기는 전국 7개 도시 12곳을 방문할 예정입니다.
              <br /><br />
              @ JEJU | 24.09.11-24.09.22 <br />
              @ SEONGSU | 24.09.24-24.09.29 @ GANGNAM | 24.09.30-24.10.02 <br />
              @ BUKCHON | 24.10.03-24.10.06 <br />
              @ GWANGHWAMUN | 24.10.07-24.10.09 <br />
              @ BUSAN | 24.10.11-24.10.20 <br />
              @ GWANGJU | 24.10.22-24.10.27 <br />
              @ DAEGU | 24.10.29-24.11.03 <br />
              @ TBD | 24.11.05-24.11.10 (미정) <br />
              @ GYEONGJU | 24.11.12-24.11.17 <br /><br />
              🚗<br />
              제주 애월에 위치한 제주 최대 규모의 카페 ‘제주당’입니다. <br />
              새별오름과 이달오름이 넓게 펼쳐져 보이는 이곳에, 내차조향소
              자판기가 찾아갑니다. <br />
              지금 바로, 내차조향소에서 내 차만을 위한 카디퓨저를 받아보세요.
            </div>
          </div>
          <div class="caution_wrap">
            <h2 class="caution">안내 및 주의사항</h2>
            <div class="caution_main">
              상기 일정은 지역 사정에 따라 조금씩 변경될 수 있습니다. <br />
              지역별 운영시간이 상이하며, 추후 별도 공지 예정입니다.<br />
              사전예약은 없으며, 현장 웨이팅 시스템 등록 후 이용 가능합니다.<br />
              운영 중 기기 점검을 위하여 약 30분의 브레이크 타임이 발생할 수
              있습니다.<br />
              참여객이 많은 경우 현장 예약이 빠르게 마감될 수 있으니 양해
              부탁드립니다.<br />
              카디퓨저는 무상으로 제공됩니다.<br />
              카디퓨저는 1인 당 1개만 수령 가능합니다.<br />
              자세한 위치 및 내용은 하단 홈페이지를 참고해 주세요.
              https://www.hey-amore.ai/
            </div>
          </div>
          <div class="location">
            <h2 class="location_tit">위치</h2>
            <img src="../images/imgMGJ/google_map.png" alt="google_map" class="img_map" />
            <div class="location_copy">
              제주특별자치도 제주시 애월읍 월각로 927 카페 제주당
              <div class="pv_copy_btn">주소 복사</div>
            </div>
          </div>
          <div class="pv_btn_wrap">
            <button class="pv_booking_btn">예약하기</button>
            <button class="pv_list_btn">목록</button>
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
    