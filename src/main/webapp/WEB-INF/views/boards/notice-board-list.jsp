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
<script>
	//게시물 삭제를 위해 정의한 함수
	function deletePost() {
		let confirmed = confirm("게시물을 삭제하겠습니까?");
		if (confirmed) {
			let form = document.deleteFrm;
			form.submit(); 
		};
	};
</script>
<body>
  <div id="skip_navi">
    <a href="#container">본문 바로가기</a>
  </div>
  <div id="wrap">
  	${common_header }
    <main id="container" class="board_page sub_container">
      <div class="sub_top">
        <div class="inner">
          <h2>공지사항</h2>
          <a href="./write.do" class="write_btn">게시물 작성하기</a>
        </div>
      </div>
      <div class="contents">
        <div class="inner">
          <div class="board_list">
            <table>
              <caption>공지사항</caption>
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
                <c:forEach var="board" items="${noticeList}" varStatus="status">
                    <tr>
                        <td>${fn:length(noticeList) - status.index}</td>
                        <td><a href="./view.do?board_idx=${board.board_idx}" class="board_title">${board.board_title}</a></td>
                        <td>${board.writer}</td>
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
              <!-- 게시판 페이징은 JSP로 작업 예정 -->
              <td>첫페이지 이전 1 2 3 다음 마지막 페이지</td>
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