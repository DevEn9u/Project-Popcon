<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/popup_view.css">
<body>



  <!-- 주소복사기능 -->
  <script>
  function copyToClipboard(text) {
    navigator.clipboard.writeText(text).then(function() {
      alert('주소가 복사되었습니다: ' + text);
    }, function(err) {
      console.error('복사 실패:', err);
    });
  }
  </script>
  
  <script>
	// 게시물 삭제를 위한 함수
	function deletePost() {
		let confirmed = confirm("게시물을 삭제하겠습니까?");
		if (confirmed) {
			let form = document.deleteFrm;
			form.submit(); 
		}
	}
  </script>
  ${common_header }
  <main id="popup_view_container">
    <div class="popup_view_inner">
      <div class="pv_content_wrap">
      <div class="swiper">
          <!-- Additional required wrapper -->
          <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide">
              <a href="#">
                <div class="img_wrap">
                  <img
                    src="${pageContext.request.contextPath}/images/imgMGJ/main_slider1.png"
                    alt="main1"
                    class="main_slider1"
                  />
                  <img
                    src="${pageContext.request.contextPath}/images/imgMGJ/main_slider2.png"
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
                    src="${pageContext.request.contextPath}/images/imgMGJ/main_slider1.png"
                    alt="main1"
                    class="main_slider1"
                  />
                  <img
                    src="${pageContext.request.contextPath}/images/imgMGJ/main_slider2.png"
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
                    src="${pageContext.request.contextPath}/images/imgMGJ/main_slider1.png"
                    alt="main1"
                    class="main_slider1"
                  />
                  <img
                    src="${pageContext.request.contextPath}/images/imgMGJ/main_slider2.png"
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
        <div class="pv_title">
          <span class="pv_sub_title">${popup.writer}</span>
          <h2 class="pv_main_title">
            <span class="pv_title_text">${popup.board_title}</span>

         <!-- 작성자와 비작성자에 따른 버튼 표시 -->
            <c:choose>
              <c:when test="${popup.writer == pageContext.request.userPrincipal.name}">
                  <form id="deleteForm" action="${pageContext.request.contextPath}/popupBoard/delete.do" method="post">
    				<input type="hidden" name="board_idx" value="${popup.board_idx}" />
    				<button class="pv_delete_btn" type="button" onclick="if(confirm('정말 삭제하시겠습니까?')) { document.getElementById('deleteForm').submit(); }">삭제하기</button>
				  </form>
				  <form action="${pageContext.request.contextPath}/popupBoard/edit.do" method="get">
        			<input type="hidden" name="board_idx" value="${popup.board_idx}" />
        			<button class="pv_edit_btn" type="submit">수정하기</button>
    			  </form>
              </c:when>
              <c:otherwise>
                <button class="pv_booking_btn" onclick="location.href='../booking.do';">예약하기</button>
              </c:otherwise>
            </c:choose>
            <img src="${pageContext.request.contextPath}/images/imgMGJ/like_btn.svg" alt="좋아요" class="like_btn" />
          </h2>
          <div class="pv_title_date">
            ${popup.start_date} ~ ${popup.end_date}
          </div>
          <span class="pv_title_location">
            <img src="${pageContext.request.contextPath}/images/imgMGJ/pin.svg" /> ${popup.popup_addr}
          </span>
        </div>
		<div class="open_time_wrap">
    		<h2 class="open_time">운영 시간</h2>
    		<div class="weekdays">
        		${popup.open_days} ${popup.open_hours}
    		</div>
		</div>

        <div class="content">
          <h2 class="content_tit">팝업 스토어 소개</h2>
          <div class="main_content">
            ${popup.contents}
          </div>
        </div>
        <div class="caution_wrap">
          <h2 class="caution">안내 및 주의사항</h2>
          <div class="caution_main">
            상기 일정은 지역 사정에 따라 변경될 수 있습니다.<br />
            자세한 내용은 게시판에서 확인하세요.
          </div>
        </div>
        <div class="location">
          <h2 class="location_tit">위치</h2>
          <img src="${pageContext.request.contextPath}/images/imgMGJ/google_map.png" alt="google_map" class="img_map" />
          <div class="location_copy">
            ${popup.popup_addr}
            <div class="pv_copy_btn" onclick="copyToClipboard('${popup.popup_addr}')">주소 복사</div>
          </div>
        </div>
        <div class="pv_btn_wrap">
          <button class="pv_booking_btn" onclick="location.href='../booking.do';">예약하기</button>
          <button class="pv_list_btn" onclick="location.href='../list.do';">목록</button>
        </div>
      </div>
    </div>
  </main>
  
  <!-- 이미지 경로 이슈 때문에 footer 부분 가져오지 않고 추가했습니다. -->
  <footer id="footer">
  	<div class="inner">
  		<section class="footer_wrap">
      <div class="footer_top">
        <div class="txt_wrap">
          <ul class="txt">
            <li><a href="#">서비스 이용약관</a></li>
            <li><a href="#">개인정보 처리방침</a></li>
            <li><a href="#">마케팅 수신 동의</a></li>
            <li><a href="#">고객센터</a></li>
            <li><a href="#">비즈니스</a></li>
          </ul>
        </div>
      </div>
      <div class="footer_bottom">
        <div class="col1">
          <div class="company_wrap">
            <p>(주)플로팅플래닛</p>
            <p>주소 : 서울 종로구 삼일대로17길 51 스타골드빌딩 5층</p>
            <p>문의전화 : (02)333-4567</p>
            <p>이메일 : popcon@popcon.co.kr</p>
            <p>대표전화 : (02)333-4567</p>
            <p>FAX : (02)333-5432</p>
          </div>
        </div>
        <div class="col2">
          <div class="sns_wrap">
            <ul class="sns">
              <li>
                <a href="#">
                  <img src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-kakao.svg">
                  카카오톡
                </a>
              </li>
              <li>
                <a href="#">
                  <img src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-instagram.svg">
                  인스타그램
                </a>
              </li>
              <li>
                <a href="#">
                  <img src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-facebook.svg">
                  페이스북
                </a>
              </li>
              <li>
                <a href="#">
                  <img src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-naverblog.svg">
                  블로그
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <span class="copyright">Copyright 2024. Floating Planet Co.,Ltd. All rights reserved</span>
      <div class="footer_logo">
        <img src="${pageContext.request.contextPath}/images/main/footer_awards.png" alt="">
      </div>
    </section>
  	</div>
  </footer>
</body>
</html>
