<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/board.css">
<script>
	// 게시물 삭제를 위한 함수
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
    ${common_header}
    <main id="container" class="board_page sub_container">
      <div class="sub_top">
        <div class="inner">
          <h2>공지사항</h2>
        </div>
      </div>
      <div class="contents">
        <div class="inner">
          <div class="board_view">
            <div class="tit_wrap">
              <h3>${dto.board_title}</h3>
              <p class="date"><fmt:formatDate value="${board.postdate}" pattern="yyyy.MM.dd" /></p>
              <p class="date">작성자 : ${writerName}</p>
              <p class="date">조회수 : ${dto.visitcount}</p>
              <form name="deleteFrm" method="post" action="./delete.do?board_idx=${dto.board_idx}">
                <input type="hidden" name="idx" value="${dto.board_idx}" />
              </form>
            </div>
            <div class="view_con">
              <p>${dto.contents}</p>
              <c:if test="${dto.images != null}">
                <img src="${dto.images}" alt="첨부 이미지">
              </c:if>
            </div>
            <div class="btn_wrap">
              <c:if test="${ user_id != null && user_id.toString().equals(dto.writer)}">
                <button type="button" class="btn board_btn" onclick="location.href='./edit.do?board_idx=${dto.board_idx}';">
                  수정하기
                </button>
                <button type="button" class="btn del_btn board_btn" onclick="if(confirm('정말 삭제하시겠습니까?')) { location.href='../noticeBoard/delete.do?board_idx=${dto.board_idx}'; }">
                  삭제하기
                </button>
              </c:if>
              <button type="button" onclick="location.href='./list.do';" class="btn list_btn board_btn">목록으로</button>
            </div>
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
