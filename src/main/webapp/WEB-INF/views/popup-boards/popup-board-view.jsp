<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<c:set var="isLoggedIn"
	value="${not empty pageContext.request.userPrincipal}" />
<link rel="stylesheet" href="/css/popup_view.css">
<body>

	<!-- 조아요 클릭시 빨개짐. -->
	<script>
  document.addEventListener("DOMContentLoaded", function() {
    const likeBtn = document.getElementById('likeBtn');
    
    likeBtn.addEventListener('click', function() {
      this.classList.toggle('active');

      // 좋아요 버튼의 색상을 변경
      const img = this.querySelector('img');
      
    });
  });
</script>

	<script>
  function toggleLike(board_idx) {
      $.ajax({
          type: "POST",
          url: "${pageContext.request.contextPath}/popupBoard/like.do",
          data: { board_id: board_idx }, // 여기에서 board_idx 사용
          success: function(response) {
              const likeBtn = document.getElementById('likeBtn');
              if (response === "liked") {
                  likeBtn.classList.add('active');
                  const img = likeBtn.querySelector('img');
                 
              } else {
                  likeBtn.classList.remove('active');
                  const img = likeBtn.querySelector('img');
                  
              }
          },
          error: function(err) {
              alert('좋아요 처리 중 오류가 발생했습니다.');
              console.error('Error:', err);
          }
      });
  }
</script>

	<script>
	
	  function initMap() {
	    var geocoder = new google.maps.Geocoder();
	    var address = "${popup.popup_addr}";
	
	    geocoder.geocode({ 'address': address }, function (results, status) {
	      if (status === 'OK') {
	        var map = new google.maps.Map(document.getElementById('map'), {
	          zoom: 15,
	          center: results[0].geometry.location
	        });
	
	        var marker = new google.maps.Marker({
	          position: results[0].geometry.location,
	          map: map
	        });
	      } else {
	        alert('지도 로드에 실패했습니다: ' + status);
	      }
	    });
	  }
	</script>

	<!-- 예약 안한 사용자가 댓글을 남기면 alert 메세지 출력 -->
	<c:if test="${not empty error}">
		<script>
        alert("${error}");
    </script>
	</c:if>

	<!-- 민경준 구글 맵 API 사용하였습니다 -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCA0TzsH1iRaVCQSJCc8BzZHmGKmpNJhKY&callback=initMap"
		async defer></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>

	  // 주소 복사 기능
	  function copyToClipboard(text) {
	    navigator.clipboard.writeText(text).then(function() {
	      alert('주소가 복사되었습니다: ' + text);
	    }, function(err) {
	      console.error('복사 실패:', err);
	    });
	  }
	</script>

	<script>
		function deleteComment(commentId, popupBoardIdx) {
		    let confirmed = confirm("리뷰를 삭제하겠습니까?");
		    if (confirmed) {
		        $.ajax({
		            type: "POST",
		            url: "${pageContext.request.contextPath}/popupBoard/comDelete.do",
		            data: { com_idx: commentId, popup_board_idx: popupBoardIdx }, // popup_board_idx 추가
		            success: function(response) {
		                alert("리뷰가 삭제되었습니다.");
		                location.reload(); // 페이지 새로고침
		            },
		            error: function(err) {
		                alert('리뷰 삭제에 실패했습니다.');
		                console.error('Error:', err);
		            }
		        });
		    }
		}
	</script>

	<!-- 리뷰 수정 폼  -->
	<script>
		let isEditModalOpen = false;
	
		function openEditModal(commentId, commentContent) {
	    	const editModal = document.getElementById('editCommentModal_' + commentId);
	    	const editComIdx = document.getElementById('editComIdx_' + commentId);
	    	const editComContents = document.getElementById('editComContents_' + commentId);
	
	    	// 모달을 여는 로직
		    if (editModal.style.display === 'block') {
		        editModal.style.display = 'none';
		    } else {
		        editComIdx.value = commentId;
		        editComContents.value = commentContent;
		        editModal.style.display = 'block';
		    }
		}
	
		function closeEditModal(commentId) {
		    document.getElementById('editCommentModal_' + commentId).style.display = 'none';
		    isEditModalOpen = false;
		}
		function deleteImage(imageIdx, commentId) {
		    let confirmed = confirm("이 이미지를 삭제하시겠습니까?");
		    if (confirmed) {
		        $.ajax({
		            type: "POST",
		            url: "${pageContext.request.contextPath}/popupBoard/comDeleteImage.do", // 이미지 삭제 요청 URL
		            data: { imageIdx: imageIdx }, // imageIdx를 문자열로 보냄
		            success: function(response) {
		                alert(response);
		                // 삭제 후 모달을 새로 고침하여 변경 사항 반영
		                location.reload();
		            },
		            error: function(err) {
		                alert('이미지 삭제에 실패했습니다.');
		                console.error('Error:', err);
		            }
		        });
		    }
		}

	</script>

	<script>
	  function goToBooking(board_idx) {
	    location.href = `/popupBoard/booking/` + board_idx;
	  }
	</script>

	<script>
    function handleFileSelect(input) {
        var fileNames = [];
        for (var i = 0; i < input.files.length; i++) {
            fileNames.push(input.files[i].name);
        }
        // 선택한 파일 이름을 표시
        input.previousElementSibling.value = fileNames.join(', ');
    }
	</script>




	${common_header}
	<main id="popup_view_container">
		<div class="popup_view_inner">
			<div class="pv_content_wrap">
				<div class="swiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<ul class="main_popup">
								<li><a href="#">
										<div class="img_wrap"> 
											<!-- 게시물 이미지 출력 -->
											<c:forEach var="image" items="${images}">
												<img src="${image.image_url}" alt="Image" style="max-width:625px; max-height:625px; object-fit: cover;"/>
											</c:forEach>
										</div>
										<div class="pv_txt_wrap">
											<p class="slide_title" style="margin-bottom:10px;">${popup.board_title}</p>
											<p style="margin-bottom:10px;">${popup.start_date}~${popup.end_date}</p>
											<p style="margin-bottom:10px;">
												<img src="/images/main/location.svg" alt="location_pin"
													class="loc_pin">${fn:replace(popup.popup_addr, ',', ' ')}</p>
										</div>
								</a></li>
							</ul>
						</div>
						<div class="swiper-slide">
							<ul class="main_popup">
								<li><a href="#">
										<div class="img_wrap">
											<c:forEach var="image" items="${images}">
												<img src="${image.image_url}" alt="Image" />
											</c:forEach>
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
						<div class="swiper-slide">
							<ul class="main_popup">
								<li><a href="#">
										<div class="img_wrap">
											<c:forEach var="image" items="${images}">
												<img src="${image.image_url}" alt="Image" />
											</c:forEach>
										</div>
										<div class="txt_wrap">
											<p class="slide_title">${popup.board_title}</p>
											<p>${popup.start_date}~${popup.end_date}</p>
											<p>
												<img src="/images/main/location.svg">${popup.popup_addr}</p>
										</div>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="swiper-pagination pagination"></div>
					<div class="swiper-button-prev arrow_btn"></div>
					<div class="swiper-button-next arrow_btn"></div>
				</div>

				<div class="pv_title">
					<span class="pv_sub_title">${member.name}</span>
					<h2 class="pv_main_title">
						<span class="pv_title_text">${popup.board_title}</span>
						<!-- 작성자와 비작성자에 따른 버튼 표시 -->
						<c:choose>
							<c:when
								test="${popup.writer == pageContext.request.userPrincipal.name}">
								<form id="deleteForm"
									action="${pageContext.request.contextPath}/popupBoard/delete.do"
									method="post">
									<input type="hidden" name="board_idx"
										value="${popup.board_idx}" />
									<button class="btn pv_delete_btn" type="button"
										onclick="if(confirm('정말 삭제하시겠습니까?')) { document.getElementById('deleteForm').submit(); }">삭제하기</button>
								</form>
								<button type="button" class="btn pv_edit_btn"
									onclick="location.href='${pageContext.request.contextPath}/popupBoard/edit.do?board_idx=${popup.board_idx}';">
									수정하기</button>

							</c:when>
							<c:otherwise>
								<!-- "예약하기" 버튼을 로그인한 사용자에게만 표시 -->
								<c:if test="${isLoggedIn}">
									<button class="btn pv_booking_btn"
										onclick="goToBooking(${popup.board_idx});">예약하기</button>
								</c:if>
							</c:otherwise>
						</c:choose>

						<!-- "좋아요" 버튼을 로그인한 사용자에게만 표시 -->
						<c:if test="${isLoggedIn}">
							<button id="likeBtn"
								class="like_btn <c:if test="${isLiked}">active</c:if>"
								onclick="toggleLike('${popup.board_idx}');"></button>
						</c:if>
					</h2>
					<div class="pv_title_date">${popup.start_date}~
						${popup.end_date}</div>
					<span class="pv_title_location"> <img
						src="${pageContext.request.contextPath}/images/imgMGJ/pin.svg" />
						${fn:replace(popup.popup_addr, ',', ' ')} <!-- 주소와 상세주소 사이에 띄어쓰기넣음 -->
					</span>
				</div>

				<div class="open_time_wrap">
					<h2 class="open_time">운영 시간</h2>
					<div class="weekdays_wrap" style="display: flex;">
						<div class="weekdays">${popup.open_days}</div>
						<div class="weekdays" style="margin-left: 10px;">${popup.open_hours}</div>
					</div>
				</div>

				<div class="content">
					<h2 class="content_tit">팝업 스토어 소개</h2>
					<div class="main_content" style="white-space: pre-wrap;">${popup.contents}</div>
				</div>


				<div class="caution_wrap">
					<h2 class="caution">안내 및 주의사항</h2>
					<div class="caution_main">
						상기 일정은 지역 사정에 따라 변경될 수 있습니다.<br /> 자세한 내용은 게시판에서 확인하세요.
					</div>
				</div>

				<div class="location">
					<h2 class="location_tit">위치</h2>
					<div id="map" style="width: 100%; height: 400px;"></div>
					<!-- 구글 지도 표시 영역 -->
					<div class="location_copy">
						<p style="margin-left:10px;">${fn:replace(popup.popup_addr, ',', ' ')}</p>
						<div class="btn" style="width: 100px;"
							onclick="copyToClipboard('${fn:replace(popup.popup_addr, ',', ' ')}')">주소
							복사</div>
					</div>
				</div>

				<div class="pv_btn_wrap">
					<c:choose>
						<c:when
							test="${popup.writer == pageContext.request.userPrincipal.name}">
							<form id="deleteForm"
								action="${pageContext.request.contextPath}/popupBoard/delete.do"
								method="post">
								<input type="hidden" name="board_idx" value="${popup.board_idx}" />
								<button class="btn pv_delete_btn" type="button"
									onclick="if(confirm('정말 삭제하시겠습니까?')) { document.getElementById('deleteForm').submit(); }">삭제하기</button>
							</form>
							<button type="button" class="btn pv_edit_btn"
								style="margin-left: 0;"
								onclick="location.href='${pageContext.request.contextPath}/popupBoard/edit.do?board_idx=${popup.board_idx}';">
								수정하기</button>

						</c:when>
						<c:otherwise>
							<!-- "예약하기" 버튼을 로그인한 사용자에게만 표시 -->
							<c:if test="${isLoggedIn}">
								<button class="btn pv_booking_btn"
									onclick="goToBooking(${popup.board_idx});">예약하기</button>
							</c:if>
						</c:otherwise>
					</c:choose>
					<button class="btn pv_list_btn"
						onclick="location.href='../list.do';">목록</button>
				</div>
				<div class="comment_section">
					<c:if test="${isLoggedIn}">
						<h3>후기 작성하기</h3>
						<form name="commentFrm" method="post" class="comment_form"
							action="${pageContext.request.contextPath}/popupBoard/writeComment.do"
							enctype="multipart/form-data">
							<input type="hidden" name="popup_board_idx"
								value="${popup.board_idx}" />
							<textarea name="com_contents" rows="4" cols="50"
								class="comment_area" placeholder="리뷰를 입력하세요"></textarea>
							<br /> <input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<!-- 파일 업로드 기능 -->
							<div class="file_wrap">
								<input type="text" class="file_name" readonly> <input
									type="file" id="comment_upload" class="blind" name="imageFile"
									multiple onchange="handleFileSelect(this)"> <label
									for="comment_upload" class="comment_upload">파일선택</label>
							</div>
							<button type="submit" class="btn comment_btn">리뷰 작성</button>
						</form>
					</c:if>
				</div>

				<!-- 후기목록 -->
				<div class="view_con comment_list">
					<h3>후기 목록</h3>
					<c:forEach var="comment" items="${comments}">
						<div class="comment_item">
							<div class="comment_wrap">
								<p class="comment_writer">${comment.comWriterName}</p>
								<p class="comment_date">(${comment.formattedPostDate})</p>
							</div>
							<!-- 첨부된 이미지가 있으면 출력 -->
							<c:if test="${not empty comment.com_img}">
								<div class="comment_images">
									<c:forEach var="image" items="${comment.com_img}">
										<img src="${image.image_url}" alt="Image"
											style="max-width: 300px; max-height: 300px; margin-bottom: 10px;" />
									</c:forEach>
								</div>
							</c:if>
							<c:if test="${empty comment.com_img}">
								<p>첨부된 이미지가 없습니다.</p>
							</c:if>
							<p class="comment_content">${comment.com_contents}</p>
							<!-- 리뷰 수정/삭제 버튼 -->
							<c:if
								test="${comment.com_writer == pageContext.request.userPrincipal.name}">
								<button type="button" class="btn comment_btn"
									onclick="openEditModal('${comment.com_idx}', '${comment.com_contents}');">수정하기</button>
								<button type="button" class="btn delete_btn"
									onclick="deleteComment('${comment.com_idx}', '${popup.board_idx}');">삭제하기</button>

								<div id="editCommentModal_${comment.com_idx}"
									style="display: none; position: relative; background-color: #121212; padding: 20px; border: 1px solid var(--txt-color-600); margin-top: 10px;">
									<form id="editCommentForm" method="post"
										action="${pageContext.request.contextPath}/popupBoard/comEdit.do"
										enctype="multipart/form-data">
										<!-- enctype 추가 -->
										<input type="hidden" name="com_idx"
											id="editComIdx_${comment.com_idx}" /> <input type="hidden"
											name="popup_board_idx" value="${popup.board_idx}" />

										<!-- 첨부된 이미지 표시 -->
										<c:if test="${not empty comment.com_img}">
											<h4 class="pop_comimg_head">첨부된 이미지</h4>
											<div class="comment_images">
												<c:forEach var="image" items="${comment.com_img}">
													<div>
														<img src="${image.image_url}" alt="Image"
															style="max-width: 300px; max-height: 300px; margin-bottom: 10px;" />
														<a href="/popupBoard/view/${popup.board_idx}"
															onclick="deleteImage('${image.image_idx}', '${comment.com_idx}');"><img
															src="${pageContext.request.contextPath}/images/imgMGJ/delete_btn.svg"
															style="filter: invert(34%) sepia(94%) saturate(7482%) hue-rotate(-1deg) brightness(95%) contrast(102%);" /></a>
													</div>
												</c:forEach>
											</div>
										</c:if>

										<!-- 파일 업로드 기능 -->
										<div class="file_wrap">
											<input type="text" class="file_name" readonly> <input
												type="file" id="edit_comment_upload_${comment.com_idx}"
												class="blind" name="imageFile" multiple
												onchange="handleFileSelect(this)"> <label
												for="edit_comment_upload_${comment.com_idx}"
												class="comment_upload">파일 선택</label>
										</div>

										<textarea name="com_contents"
											id="editComContents_${comment.com_idx}" class="edit_content"
											rows="4" cols="50"></textarea>

										<button type="submit" class="btn comment_btn"
											style="margin-top: 10px;">수정 완료</button>
									</form>
								</div>

							</c:if>
						</div>
					</c:forEach>
					<c:if test="${empty comments}">
						<p>등록된 후기가 없습니다.</p>
					</c:if>
				</div>


			</div>
		</div>
	</main>

	<!-- 경로 문제로 footer 직접 추가하였습니다. -->
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
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-kakao.svg">
										카카오톡
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-instagram.svg">
										인스타그램
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-facebook.svg">
										페이스북
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-naverblog.svg">
										블로그
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<span class="copyright">Copyright 2024. Floating Planet
					Co.,Ltd. All rights reserved</span>
				<div class="footer_logo">
					<img
						src="${pageContext.request.contextPath}/images/main/footer_awards.png"
						alt="">
				</div>
			</section>
		</div>
	</footer>
</body>
</html>