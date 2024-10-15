<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="./include/head.jsp" />
<script src="/js/today-popup.js?v=<?php echo time(); ?>"></script>
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

	<script>
    function scrollToSection(sectionId) {
        const section = document.getElementById(sectionId);
        if (section) {
            const sectionPosition = section.getBoundingClientRect().top + window.scrollY; // 요소의 Y 위치
            const windowHeight = window.innerHeight; // 화면 높이
            const targetPosition = sectionPosition - (windowHeight / 2) + (section.clientHeight / 2); // 중앙 위치 조정

            window.scrollTo({
                top: targetPosition,
                behavior: 'smooth' // 부드러운 스크롤
            });
        }
    }
</script>


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
							<c:forEach var="popup" items="${topPopups}">
								<div class="swiper-slide">
									<ul class="main_popup">
										<li><a href="/popupBoard/view/${popup.board_idx}">
												<div class="img_wrap"
													style="max-width: 625px; max-height: 625px;">
													<img src="${popup.thumb}" alt="${popup.board_title}"
														class="main-fixed-size" 
														style="max-width: 625px; max-height: 625px;">
												</div>
												<div class="txt_wrap">
													<p class="slide_title">${popup.board_title}</p>
													<p>${popup.start_date}~${popup.end_date}</p>
													<p>
														<img src="/images/main/location.svg">${fn:replace(popup.popup_addr, ',', ' ')}</p>
												</div>
										</a></li>
									</ul>
								</div>
							</c:forEach>
						</div>
						<div class="swiper-pagination pagination"></div>
						<div class="swiper-button-prev arrow_btn"></div>
						<div class="swiper-button-next arrow_btn"></div>
					</div>
				</div>
			</section>
			<section class="pick_slider" id="pick_slider">
				<div class="inner">
					<h2 class="tit">
						담당자 픽 팝업 <strong>10월</strong>
					</h2>
					<div class="swiper">
						<div class="swiper-wrapper">
							<c:forEach var="popup" items="${topPopups}">
								<div class="swiper-slide">
									<a class="image" href="/popupBoard/view/${popup.board_idx}">
										<div class="img_wrap">
											<img src="${popup.thumb}" alt="${popup.board_title}"
												class="fixed-size" />
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
			<section class="popular_slider" id="popular_slider">
				<div class="inner">
					<h2 class="tit">
						인기 팝업 <strong>10월</strong>
					</h2>
					<div class="swiper">
						<div class="swiper-wrapper">
							<c:forEach var="popup" items="${popularPosts}">
								<div class="swiper-slide">
									<a class="image" href="/popupBoard/view/${popup.board_idx}">
										<div class="img_wrap">
											<img src="${popup.thumb}" alt="${popup.board_title}"
												class="fixed-size">
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
			<section class="day_slider" id="day_slider">
				<div class="inner">
					<div class="slider" id="date-slider"></div>
					<span class="line"></span>
					<div class="pl_main">
						<ul class="popup_wrap">
							<c:forEach var="popup" items="${popupList}">
								<li class="popup_banner main_popup_banner"><a
									href="/popupBoard/view/${popup.board_idx}">
										<div class="img_wrap">
											<img src="${popup.thumb}" alt="Thumbnail"
												class="popup_thumbnail" />
										</div>
										<div class="txt_title">
											<h2>
												${popup.board_title}
												<button id="likeBtn_${popup.board_idx}"
													class="like_btn <c:if test="${popup.liked}">active</c:if>"
													onclick="toggleLike('${popup.board_idx}'); event.preventDefault(); event.stopPropagation();">
												</button>
											</h2>
											<div class="popup_location">
												<img src="../images/imgMGJ/pin.svg" /> <span
													class="location_span">${fn:replace(popup.popup_addr, ',', ' ')}</span>
											</div>
											<span class="popup_date" data-end-date="${popup.end_date}">${popup.end_date}</span>
										</div>
								</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</section>

			<section class="season_slider">
				<div class="inner">
					<h2 class="tit">
						가을에 어울리는 팝업 <strong>10월</strong>
					</h2>
					<div class="swiper">
						<div class="swiper-wrapper">
							<c:forEach var="popup" items="${topPopups}">
								<div class="swiper-slide">
									<a class="image" href="/popupBoard/view/${popup.board_idx}">
										<div class="img_wrap">
											<img src="${popup.thumb}" alt="${popup.board_title}"
												class="fixed-size">
										</div>
										<div class="txt_wrap">
											<p class="slide_title">${popup.board_title}</p>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
			<section class="product_slider">
				<div class="inner">
					<h2 class="tit">
						굿즈 만족도 100% <strong>10월</strong>
					</h2>
					<div class="swiper">
						<div class="swiper-wrapper">
							<c:forEach var="popup" items="${randomPosts}">
								<div class="swiper-slide">
									<a class="image" href="/popupBoard/view/${popup.board_idx}">
										<div class="img_wrap">
											<img src="${popup.thumb}" alt="${popup.board_title}"
												class="fixed-size">
										</div>
										<div class="txt_wrap">
											<p class="slide_title">${popup.board_title}</p>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
		</main>
		<footer id="footer">
			<div class="inner">
				${common_footer}
				<section class="btn_wrap">
					<a class="scroll_btn top_btn" href="#"><span class="blind">아래로
							이동</span></a>
					<c:if test="${not empty user_id }">
						<a class="qna_btn top_btn" href="#" id="openChat"><span
							class="blind">질문</span></a>
					</c:if>
					<!-- 관리자 계정일때만 보이는 관리자 페이지 진입버튼 추가 -->
					<c:if test="${memberDTO.authority == 'ROLE_ADMIN'}">
						<a class="master_btn" href="/adpage/main.do">
							<p class="mbtn_tit">관리자</p>
						</a>
					</c:if>
				</section>
			</div>
		</footer>
		<script>
		  const openChatWin = (roomId, userId) => {
			  if(userId !== "admin") {
				  
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
			  // roomId는 'chat-유저아이디'로 설정
			  const roomId = "chat-" + userId;
			  console.log(roomId);
			  openChatWin(roomId, userId);
		  });
		</script>
	</div>
</body>
</html>