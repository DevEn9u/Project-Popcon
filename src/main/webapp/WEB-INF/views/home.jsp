<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="./include/head.jsp" />
<link rel="stylesheet"
	href="/css/popup_list.css?v=<?php echo time(); ?>">
</head>
<c:import url="./include/header.jsp" var="common_header" />
<c:import url="./include/footer.jsp" var="common_footer" />
<body>
	<!-- 조아요 클릭시 빨개짐 -->
	<script>
function toggleLike(board_idx) {
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/popupBoard/like.do",
        data: { board_id: board_idx },
        success: function(response) {
            const likeBtn = document.getElementById('likeBtn_' + board_idx); // 각 게시물의 likeBtn을 찾음
            
            // 클릭 시 반영할 이미지와 active 클래스를 결정
            if (response === "liked") {
                likeBtn.classList.add('active');
                const img = likeBtn.querySelector('img');
              
            } else {
                likeBtn.classList.remove('active');
                const img = likeBtn.querySelector('img');
               
            }
        },
        error: function(err) {
            if (err.status === 401 && err.responseText === "login_required") {
                alert('로그인을 해 주십시오.');
            } else {
                alert('좋아요 처리 중 오류가 발생했습니다.');
            }
            console.error('Error:', err);
        }
    });
}
</script>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }

<<<<<<< HEAD
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
	      <!-- <section class="pick_slider">
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
	                <a class="image" href="./popupBoard/list.do"><img src="/images/main/mainslider1.png"></a>
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
	      </section> -->
	</main>
	<footer id="footer">
		<div class="inner">
		    ${common_footer}
			<section class="btn_wrap">
			   <a class="scroll_btn top_btn" href="#"><span class="blind">아래로 이동</span></a>
			   <c:if test="${not empty user_id }">
				   <a class="qna_btn top_btn" href="#" id="openChat"><span class="blind">질문</span></a>
			   </c:if>
					<!-- 관리자 계정일때만 보이는 관리자 페이지 진입버튼 추가 -->
					<c:if
					test="${memberDTO.authority == 'ROLE_ADMIN'}">
						<a class="master_btn" href="/adpage/main.do">
							<p class="mbtn_tit">관리자</p>
						</a>
					</c:if>
				</section>
			</div>
			<script>
		  const openChatWin = (roomId, userId) => {
			  if(userId != "admin") {
				  
			    window.open(
			      "/chat/index.html#/chat?roomId=" + roomId + "&userId=" + userId,
			      '',
			      'width=500, height=700'
			    );
			  }
			  else {
				window.open(
					"chat/index.html",
					'',
					'width=500, height=700'
				);
			  }
		  };
		  $('#openChat').on('click', function(e) {
			  e.preventDefault();
			  // Model에서 id 가져오기
			  const userId = "${user_id}";
			  // roomId는 'user-유저아이디'로 설정
			  const roomId = "user-" + userId;
			  console.log(roomId);
			  openChatWin(roomId, userId);
		  });
		</script>
		</footer>
	</div>
</body>
</html>