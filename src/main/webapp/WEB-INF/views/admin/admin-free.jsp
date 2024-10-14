<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
	<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
	<link rel="stylesheet" href="/css/popup_list.css?v=<?php echo time(); ?>">
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="mp_container">
			<h1>관리자 페이지</h1>
			<section class="my_page">
				<div class="my_list">
					<ul class="depth1">
						<li class="list_title on"><a href="/adpage/main.do"
							style="color: var(--txt-color-600);">게시물 관리</a></li>
						<ul class="depth2">
							<li><a href="/adpage/popup.do">팝업 게시판</a></li>
							<li><a href="/adpage/free.do"
								style="color: var(--point-color1);">자유 게시판</a></li>
						</ul>
						<li class="list_title"><a href="/adpage/user.do">유저 관리</a>
						</li>
					</ul>
				</div>
				<div class="pl_main ad_pl_main">
					<div class="contents">
						<div class="inner">
							<div class="board_list">
								<table>
									<caption>자유게시판</caption>
									<thead>
										<tr>
											<th class="col1">번호</th>
											<th class="col2">제목</th>
											<th class="col3">이름</th>
											<th class="col4">날짜</th>
											<th class="col5">조회수</th>
											<th class="col6">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="board" items="${boardList}" varStatus="status">
											<tr>
												<td>${fn:length(boardList) - status.index}</td>
												<td><a href="./view.do?board_idx=${board.board_idx}"
													class="board_title">${board.board_title}</a></td>
												<td>${board.writerName}</td>
												<td><fmt:formatDate value="${board.postdate}"
														pattern="yyyy.MM.dd" /></td>
												<td>${board.visitcount}</td>
												<td class="delete_td">
													<button type="button" class="ad_delete_btn"
														onclick="if(confirm('정말 삭제하시겠습니까?')) { location.href='/adpage/freedelete.do?board_idx=${board.board_idx}'; }">
														삭제하기</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<table>
									<caption>페이징</caption>
									<tr>
										<td><c:if test="${currentPage > 1}">
												<a href="./list.do?page=${currentPage - 1}">이전</a>
											</c:if> <c:forEach var="i" begin="1" end="${totalPages}">
												<c:choose>
													<c:when test="${i == currentPage}">
														<strong>${i}</strong>
													</c:when>
													<c:otherwise>
														<a href="./list.do?page=${i}">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach> <c:if test="${currentPage < totalPages}">
												<a href="./list.do?page=${currentPage + 1}">다음</a>
											</c:if></td>
									</tr>
								</table>

							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
</body>
</html>