<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<c:import url="../include/header.jsp" var="common_header" />
	<c:import url="../include/mypage-list.jsp" var="mypage_list" />
	<c:import url="../include/footer.jsp" var="common_footer" />
	<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
	<script src="/js/mypage.js"></script>
</head>
<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header}
		<main id="mp_container">
			<div class="title_wrap">
				<h1>마이페이지</h1>
				<span></span>
				<h2>좋아요 누른 팝업</h2>
			</div>
			<section class="my_page my_page_likes">
				${mypage_list }
				<div class="my_info_wrap">
					<div class="my_info">
						<div class="box3">
							<div class="likes_wrap">
								<div class="top_txt">
									<p>좋아요 누른 팝업</p>
								</div>
								<div class="post_detail">
									<p>최신순</p>
									<div class="likes_list">
										<c:forEach var="popup" items="${likedPopups}"
											varStatus="status">
											<div class="likes_block">
												<a
													href="${pageContext.request.contextPath}/popupBoard/view/${popup.board_idx}">
													<span class="img"> <c:choose>
															<c:when test="${not empty popup.thumb}">
																<img src="${popup.thumb}" alt="팝업 썸네일 이미지"
																	loading="lazy" />
															</c:when>
															<c:otherwise>
																<img src="../images/noimage.jpg" alt="기본 썸네일 이미지"
																	loading="lazy" />
															</c:otherwise>
														</c:choose>
												</span>
													<p>${fn:escapeXml(popup.board_title)}</p>
												</a>
											</div>
										</c:forEach>
										<c:if test="${empty likedPopups}">
											<div class="likes_block_wrap">
												<div style="text-align: center; padding: 20px;">좋아요한
													팝업이 없습니다.</div>
											</div>
										</c:if>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
	</div>
</body>
</html>
