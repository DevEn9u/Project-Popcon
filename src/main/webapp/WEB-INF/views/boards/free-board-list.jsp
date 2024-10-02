<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
<body>
  <div id="skip_navi">
    <a href="#container">본문 바로가기</a>
  </div>
  <div id="wrap">
  	${common_header }
    <main id="container" class="board_page sub_container">
      <div class="sub_top">
        <div class="inner">
          <h2>자유게시판</h2>
          <c:if test="${memberDTO.authority.contains('ROLE') }">
          	<a href="./write.do" class="write_btn">게시물 작성하기</a>
          </c:if>
        </div>
      </div>
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
                </tr>
              </thead>
				<tbody>
				    <c:forEach var="board" items="${boardList}" varStatus="status">
				        <tr>
				            <td>${fn:length(boardList) - status.index}</td>
				            <td><a href="./view.do?board_idx=${board.board_idx}" class="board_title">${board.board_title}</a></td>
				            <td>${board.writerName}</td>
				            <td>
				                <fmt:formatDate value="${board.postdate}" pattern="yyyy.MM.dd" />
				            </td>
				            <td>${board.visitcount}</td>
				        </tr>
				    </c:forEach>
				</tbody>
            </table>
			<table>
			    <caption>페이징</caption>
			    <tr>
			        <td>
			            <c:if test="${currentPage > 1}">
			                <a href="./list.do?page=${currentPage - 1}">이전</a>
			            </c:if>
			            <c:forEach var="i" begin="1" end="${totalPages}">
			                <c:choose>
			                    <c:when test="${i == currentPage}">
			                        <strong>${i}</strong>
			                    </c:when>
			                    <c:otherwise>
			                        <a href="./list.do?page=${i}">${i}</a>
			                    </c:otherwise>
			                </c:choose>
			            </c:forEach>
			            <c:if test="${currentPage < totalPages}">
			                <a href="./list.do?page=${currentPage + 1}">다음</a>
			            </c:if>
			        </td>
			    </tr>
			</table>

          </div>
        </div>
      </div>
    </main>
    <footer id="footer">
		<div class="inner">
		    ${common_footer}
		</div>
    </footer>
  </div>
</body>
</html>