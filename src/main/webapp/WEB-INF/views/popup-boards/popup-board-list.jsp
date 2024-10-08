<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet"
	href="/css/popup_list.css?v=<?php echo time(); ?>">
<body>
	<!-- 비로그인 상태로 글 선택 시 로그인 페이지로 이동 -->
	<c:if test="${loginRequired}">
		<script>
			alert('로그인을 해 주십시오.');
			window.location.href = '/login.do';
		</script>
	</c:if>
	<!-- 조아요 클릭시 빨개짐 -->
	<script>
		function toggleLike(board_idx) {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/popupBoard/like.do",
				data : {
					board_id : board_idx
				},
				success : function(response) {
					const likeBtn = document.getElementById('likeBtn_'
							+ board_idx); // 각 게시물의 likeBtn을 찾음

					// 클릭 시 반영할 이미지와 active 클래스를 결정
					if (response === "liked") {
						likeBtn.classList.add('active');
						const img = likeBtn.querySelector('img');

					} else {
						likeBtn.classList.remove('active');
						const img = likeBtn.querySelector('img');

					}
				},
				error : function(err) {
					if (err.status === 401
							&& err.responseText === "login_required") {
						alert('로그인을 해 주십시오.');
					} else {
						alert('좋아요 처리 중 오류가 발생했습니다.');
					}
					console.error('Error:', err);
				}
			});
		}
	</script>


	${common_header}
	<main id="popup_list_container">

		<div class="popup_list_inner">
			<div class="popup_list_title_wrap">
				<h2 class="popup_list_title">
					<a href="./list.do">팝업안내</a>
				</h2>
			</div>
			<div class="pl_main">
				<c:if
					test="${memberDTO.authority == 'ROLE_ADMIN' || memberDTO.authority == 'ROLE_CORP'}">
					<!-- 	          <a href="./write.do" class="write_btn">게시물 작성하기</a> -->
					<button class="pl_write_btn" onclick="location.href='./write.do';">게시물
						작성하기</button>
				</c:if>

				<nav class="kategorie_wrap">
					<ul class="pl_kategorie">
						<p class="keyword">키워드</p>
						<li class="digital_btn"><a href="./list.do">전체보기</a></li>
						<li class="char_btn"><a href="./list.do?category=캐릭터">캐릭터</a></li>
						<li class="fassion_btn"><a href="./list.do?category=패션/뷰티">패션/뷰티</a></li>
						<li><a href="./list.do?category=식품">식품</a></li>
						<li class="health_btn"><a href="./list.do?category=헬스/스포츠">헬스/스포츠</a></li>
						<li><a href="./list.do?category=게임">게임</a></li>
						<li><a href="./list.do?category=공공">공공</a></li>
						<li><a href="./list.do?category=전시">전시</a></li>
						<li class="digital_btn"><a href="./list.do?category=가전/디지털">가전/디지털</a></li>
						<li class="char_btn"><a href="./list.do?category=아이돌">아이돌</a></li>
					</ul>
				</nav>

				<ul class="popup_wrap">
					<c:forEach var="popup" items="${popupList}">
						<li class="popup_banner"><a
							href="/popupBoard/view/${popup.board_idx}"> <img
								src="${popup.thumb}" alt="Thumbnail" class="popup_thumbnail" />
								<div class="txt_title">
									<h2>
										${popup.board_title}
										<button id="likeBtn_${popup.board_idx}"
											class="like_btn <c:if test="${popup.liked}">active</c:if>"
											onclick="toggleLike('${popup.board_idx}'); event.preventDefault(); event.stopPropagation();">
											<!-- event.preventDefault() 추가 -->
										</button>
									</h2>
									<div class="popup_location">
										<img src="../images/imgMGJ/pin.svg" /> <span
											class="location_span">${popup.popup_addr}</span>
									</div>
									<span class="popup_date">${popup.postdate}</span>
								</div>
						</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</main>
	<footer id="footer">
		<div class="inner">${common_footer}</div>
	</footer>
</body>
</html>
