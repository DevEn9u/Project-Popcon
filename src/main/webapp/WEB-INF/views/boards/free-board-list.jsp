<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/board.css">
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
          <a href="./write.do" class="write_btn">게시물 작성하기</a>
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
                <tr>
                  <td>1</td>
                  <td><a href="./view.do"  class="board_title">게시물 제목입니당 벌써 9월인데 이게 날씨가 말이 되나요 글자 확인</a></td>
                  <td>김현수</td>
                  <td>2024.03.28</td>
                  <td>999</td>
                </tr>
              </thead>
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