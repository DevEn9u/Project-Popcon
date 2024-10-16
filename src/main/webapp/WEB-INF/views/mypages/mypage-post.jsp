<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        ${common_header}
        <main id="mp_container">
            <div class="title_wrap">
                <h1>마이페이지</h1>
                <span></span>
                <h2>내가 작성한 글</h2>
            </div>
            <section class="my_page">
                ${mypage_list }
                <div class="my_info_wrap">
                    <div class="my_info">
                        <div class="box3">
                            <div class="post_wrap">
                                <div class="top_txt">
                                    <p>최근 내가 작성한 게시글</p>
                                </div>
                                <div class="post_detail">
                                    <table class="post_table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="tnum">번호</th>
                                                <th scope="col">제목</th>
                                                <th scope="col" class="bname">게시판</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="post" items="${posts}" varStatus="status">
                                                <tr>
                                                    <td class="tnum">${(currentPage - 1) * pageSize + (status.index + 1)}</td>
                                                    <td>
                                                        <a href="${pageContext.request.contextPath}/freeBoard/view.do?board_idx=${post.board_idx}">
                                                            ${fn:escapeXml(post.board_title)}
                                                        </a>
                                                    </td>
													<td class="bname">
													    <c:choose>
													        <c:when test="${post.board_type == 'free'}">자유</c:when>
													        <c:when test="${post.board_type == 'notice'}">공지</c:when>
													        <c:otherwise>${fn:escapeXml(post.board_type)}</c:otherwise>
													    </c:choose>
													</td>
                                                </tr>
                                            </c:forEach>
											<c:if test="${empty posts}">
											    <tr>
											        <td colspan="3" style="text-align: center;">작성한 게시글이 없습니다.</td>
											    </tr>
											</c:if>
                                        </tbody>
                                    </table>
                                    <div class="pagenation_wrap">
                                        <c:if test="${currentPage > 1}">
                                            <a href="${pageContext.request.contextPath}/mypage/myPost.do?page=${currentPage - 1}&size=${pageSize}" class="prev"></a>
                                        </c:if>
                                        <div class="page_num">
                                            <c:forEach begin="1" end="${totalPages}" var="i">
                                                <c:choose>
                                                    <c:when test="${i == currentPage}">
                                                        <a href="${pageContext.request.contextPath}/mypage/myPost.do?page=${i}&size=${pageSize}" class="on">${i}</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="${pageContext.request.contextPath}/mypage/myPost.do?page=${i}&size=${pageSize}">${i}</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                        <c:if test="${currentPage < totalPages}">
                                            <a href="${pageContext.request.contextPath}/mypage/myPost.do?page=${currentPage + 1}&size=${pageSize}" class="next"></a>
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
            <div class="inner">
                ${common_footer}
            </div>
        </footer>
    </div>
</body>
</html>
