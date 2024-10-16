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
</head>
<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="mp_container">
			<div class="title_wrap">
				<h1>마이페이지</h1>
				<span></span>
				<h2>내가 작성한 리뷰</h2>
			</div>
			<section class="my_page">
				${mypage_list }
				<div class="my_info_wrap">
					<div class="my_info my_review">
						<div class="box3">
							<div class="review_wrap">
								<div class="top_txt">
									<p>최근 내가 작성한 REVIEW</p>
								</div>
								<div class="review_contents_wrap">
									<c:forEach var="review" items="${reviews}" varStatus="status">
										<div class="review_block_wrap">
											<div class="popup_txt">
												<span class="pop_icon"></span>
												<div class="info_wrap">
													<strong> <c:choose>
															<c:when test="${review.popup_board_idx != null}">
													            ${fn:escapeXml(review.popup_title)}
													        </c:when>
															<c:otherwise>알 수 없는 팝업</c:otherwise>
														</c:choose>
													</strong>
													<div class="dayman_wrap">
														<fmt:formatDate value="${review.com_postdate}"
															pattern="yyyy.MM.dd" />
													</div>
												</div>
											</div>
											<div class="review_block">
												<a
													href="${pageContext.request.contextPath}/popupBoard/view/${review.popup_board_idx}">
													<span class="img"> <c:choose>
															<c:when test="${not empty review.com_img}">
																<c:forEach var="image" items="${review.com_img}">
																	<img src="${image.image_url}" alt="리뷰 이미지" />
																</c:forEach>
															</c:when>
															<c:otherwise>
																<img src="../images/noimage2.jpg" alt="기본 이미지" />
															</c:otherwise>
														</c:choose>
												</span>
													<p>${fn:escapeXml(review.com_contents)}</p>
												</a> <span>작성일 : <fmt:formatDate
														value="${review.com_postdate}" pattern="yyyy.MM.dd" /></span>
											</div>

										</div>
									</c:forEach>
									<c:if test="${empty reviews}">
										<div class="review_block_wrap">
											<div style="text-align: center; padding: 20px;">작성한 리뷰가
												없습니다.</div>
										</div>
									</c:if>
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
