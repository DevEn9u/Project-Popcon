<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
<link rel="stylesheet" href="/css/intro.css?v=<%= System.currentTimeMillis() %>" />
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />

<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="container">
		    <div class="inner">
		      <h2 class="tit">POINT SHOP</h2>
		      <div clas="pl_main">
				<c:if
					test="${memberDTO.authority == 'ROLE_ADMIN' || memberDTO.authority == 'ROLE_CORP'}">
					<button class="pl_write_btn" onclick="location.href='./write.do';">게시물 작성하기</button>
				</c:if>
				<ul class="popup_wrap">
					<c:forEach var="popup" items="${popupList}">
						<li class="popup_banner">
							<a href="/popupBoard/view/${popup.board_idx}"> 
								<div class="img_wrap">
									<img src="${popup.thumb != null && popup.thumb != '' ? popup.thumb : '../images/noimage.jpg'}" alt="${popup.board_title != null ? popup.board_title : '썸네일 없음'}" class="popup_thumbnail" />
								</div>
								<div class="txt_title">
									<h2>${popup.board_title}</h2>
									<div class="popup_location">
										<img src="../images/imgMGJ/pin.svg" /> <span class="location_span">${fn:replace(popup.popup_addr, ',', ' ')} <!-- 주소와 상세주소 사이에 띄어쓰기넣음 --></span>
									</div>
									<button class="buy_btn">구매하기</span>
								</div>
							</a>
						</li>
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