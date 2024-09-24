<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="./include/head.jsp" />
<c:import url="./include/header.jsp" var="common_header" />
<c:import url="./include/footer.jsp" var="common_footer" />
<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
	${common_header }
	<main id="container">
	      <section class="main_slider">
	        <div class="inner">
	          <div class="swiper">
	            <div class="swiper-wrapper">
	              <div class="swiper-slide">
	                <ul class="main_popup">
	                  <li>
	                    <a href="#">
	                      <div class="img_wrap">
	                        <img src="/images/main/mainslider1.png">
	                      </div>
	                      <div class="txt_wrap">
	                        <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                        <p>24.09.24 - 09.28</p>
	                        <p><img src="/images/main/location.svg">서울특별시 마포구</p>
	                      </div>
	                    </a>
	                  </li>
	                </ul>
	              </div>
	              <div class="swiper-slide">
	                <ul class="main_popup">
	                  <li>
	                    <a href="#">
	                      <div class="img_wrap">
	                        <img src="/images/main/mainslider2.jpg">
	                      </div>
	                      <div class="txt_wrap">
	                        <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                        <p>24.09.24 - 09.28</p>
	                        <p><img src="/images/main/location.svg">서울특별시 마포구</p>
	                      </div>
	                    </a>
	                  </li>
	                </ul>
	              </div>
	              <div class="swiper-slide">
	                <ul class="main_popup">
	                  <li>
	                    <a href="#">
	                      <div class="img_wrap">
	                        <img src="/images/main/mainslider2.jpg" alt="팝업 홍보">
	                        <img src="/images/main/slider_background.png" alt="배경">
	                      </div>
	                      <div class="txt_wrap">
	                        <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                        <p>24.09.24 - 09.28</p>
	                        <p><img src="/images/main/location.svg">서울특별시 마포구</p>
	                      </div>
	                    </a>
	                  </li>
	                </ul>
	              </div>
	              <div class="swiper-slide">
	                <ul class="main_popup">
	                  <li>
	                    <a href="#">
	                      <div class="img_wrap">
	                        <img src="/images/main/mainslider1.png">
	                      </div>
	                      <div class="txt_wrap">
	                        <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                        <p>24.09.24 - 09.28</p>
	                        <p><img src="/images/main/location.svg">서울특별시 마포구</p>
	                      </div>
	                    </a>
	                  </li>
	                </ul>
	              </div>
	            </div>
	            <div class="swiper-pagination pagination"></div>
	            
	            <div class="swiper-button-prev arrow_btn "></div>
	            <div class="swiper-button-next arrow_btn"></div>
	          </div>
	        </div>
	      </section>
	      <section class="pick_slider">
	        <div class="inner">
	          <h2 class="tit">담당자 픽 팝업 <strong>10월</strong></h2>
	          <div class="swiper">
	            <div class="swiper-wrapper">
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider2.jpg"></a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider2.jpg"></a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider2.jpg"></a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider2.jpg"></a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider2.jpg"></a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider2.jpg"></a>
	              </div>
	            </div>
	          </div>
	        </div>
	      </section>
	      <section class="popular_slider">
	        <div class="inner">
	          <h2 class="tit">인기 팝업 <strong>10월</strong></h2>
	          <div class="swiper">
	            <div class="swiper-wrapper">
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider1.png"></a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider1.png"></a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider1.png"></a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider1.png"></a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider1.png"></a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#"><img src="/images/main/mainslider1.png"></a>
	              </div>
	            </div>
	          </div>
	        </div>
	      </section>
	      <section class="day_slider">
	        <div class="inner">
	          <div class="slider" id="date-slider">
	          </div>
	          <span class="line"></span>
	          <div class="today_popup">
	            <div class="col1">
	              <a class="item" href="#">
	                <img src="/images/main/mainslider2.jpg">
	                <ul class="txt_wrap">
	                  <li class="popup_name"><p>롯데월드몰 Wonderful Wonderland</p></li>
	                  <li class="popup_location">
	                    <img src="/images/main/location.svg" alt="장소">
	                    <p>서울특별시 송파구</p>
	                  </li>
	                  <p class="popup_date">24.05.11 - 24.09.27</p>
	                </ul>
	              </a>
	              <a class="item" href="#">
	                <img src="/images/main/mainslider2.jpg">
	                <ul class="txt_wrap">
	                  <li class="popup_name"><p>롯데월드몰 Wonderful Wonderland</p></li>
	                  <li class="popup_location">
	                    <img src="/images/main/location.svg" alt="장소">
	                    <p>서울특별시 송파구</p>
	                  </li>
	                  <p class="popup_date">24.05.11 - 24.09.27</p>
	                </ul>
	              </a>
	              <a class="item" href="#">
	                <img src="/images/main/mainslider2.jpg">
	                <ul class="txt_wrap">
	                  <li class="popup_name"><p>롯데월드몰 Wonderful Wonderland</p></li>
	                  <li class="popup_location">
	                    <img src="/images/main/location.svg" alt="장소">
	                    <p>서울특별시 송파구</p>
	                  </li>
	                  <p class="popup_date">24.05.11 - 24.09.27</p>
	                </ul>
	              </a>
	              <a class="item" href="#">
	                <img src="/images/main/mainslider2.jpg">
	                <ul class="txt_wrap">
	                  <li class="popup_name"><p>롯데월드몰 Wonderful Wonderland</p></li>
	                  <li class="popup_location">
	                    <img src="/images/main/location.svg" alt="장소">
	                    <p>서울특별시 송파구</p>
	                  </li>
	                  <p class="popup_date">24.05.11 - 24.09.27</p>
	                </ul>
	              </a>
	            </div>
	            <div class="col2">
	              <a class="item" href="#">
	                <img src="/images/main/mainslider2.jpg">
	                <ul class="txt_wrap">
	                  <li class="popup_name"><p>롯데월드몰 Wonderful Wonderland</p></li>
	                  <li class="popup_location">
	                    <img src="/images/main/location.svg" alt="장소">
	                    <p>서울특별시 송파구</p>
	                  </li>
	                  <p class="popup_date">24.05.11 - 24.09.27</p>
	                </ul>
	              </a>
	              <a class="item" href="#">
	                <img src="/images/main/mainslider2.jpg">
	                <ul class="txt_wrap">
	                  <li class="popup_location">
	                    <img src="/images/main/location.svg" alt="장소">
	                    <p>서울특별시 송파구</p>
	                  </li>
	                  <p class="popup_date">24.05.11 - 24.09.27</p>
	                </ul>
	              </a>
	              <a class="item" href="#">
	                <img src="/images/main/mainslider2.jpg">
	                <ul class="txt_wrap">
	                  <li class="popup_name"><p>롯데월드몰 Wonderful Wonderland</p></li>
	                  <li class="popup_location">
	                    <img src="/images/main/location.svg" alt="장소">
	                    <p>서울특별시 송파구</p>
	                  </li>
	                  <p class="popup_date">24.05.11 - 24.09.27</p>
	                </ul>
	              </a>
	              <a class="item" href="#">
	                <img src="/images/main/mainslider2.jpg">
	                <ul class="txt_wrap">
	                  <li class="popup_name"><p>롯데월드몰 Wonderful Wonderland</p></li>
	                  <li class="popup_location">
	                    <img src="/images/main/location.svg" alt="장소">
	                    <p>서울특별시 송파구</p>
	                  </li>
	                  <p class="popup_date">24.05.11 - 24.09.27</p>
	                </ul>
	              </a>
	            </div>
	          </div>
	        </div>
	      </section>
	      <section class="season_slider">
	        <div class="inner">
	          <h2 class="tit">가을에 어울리는 팝업 <strong>10월</strong></h2>
	          <div class="swiper">
	            <div class="swiper-wrapper">
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                    <p class="slide_content"><img src="/images/main/location.svg">서울특별시 마포구</p>
	                  </div>
	                </a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                    <p class="slide_content"><img src="/images/main/location.svg">서울특별시 마포구</p>
	                  </div>
	                </a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                    <p class="slide_content"><img src="/images/main/location.svg">서울특별시 마포구</p>
	                  </div>
	                </a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                    <p class="slide_content"><img src="/images/main/location.svg">서울특별시 마포구</p>
	                  </div>
	                </a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                    <p class="slide_content"><img src="/images/main/location.svg">서울특별시 마포구</p>
	                  </div>
	                </a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                    <p class="slide_content"><img src="/images/main/location.svg">서울특별시 마포구</p>
	                  </div>
	                </a>
	              </div>
	            </div>
	          </div>
	        </div>
	      </section>
	      <section class="product_slider">
	        <div class="inner">
	          <h2 class="tit">굿즈 만족도 100% <strong>10월</strong></h2>
	          <div class="swiper">
	            <div class="swiper-wrapper">
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                  </div>
	                </a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                  </div>
	                </a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                  </div>
	                </a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                  </div>
	                </a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                  </div>
	                </a>
	              </div>
	              <div class="swiper-slide">
	                <a class="image" href="#">
	                  <div class="img_wrap">
	                    <img src="/images/main/mainslider1.png">
	                  </div>
	                  <div class="txt_wrap">
	                    <p class="slide_title">쓰담서울 시즌4 : 해피 쓰담 데이</p>
	                  </div>
	                </a>
	              </div>
	            </div>
	          </div>
	        </div>
	      </section>
	</main>
		<footer id="footer">
	    ${common_footer }
	    <section class="btn_wrap">
          <a class="scroll_btn top_btn" href="#"><span class="blind">아래로 이동</span></a>
          <a class="qna_btn top_btn" href="#"><span class="blind">질문</span></a>
        </section>
	    </footer>
	</div>
</body>
</html>