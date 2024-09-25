<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
                <tr>
                  <td>1</td>
                  <td><a href="./view.do"  class="board_title">팝컨 이용 수칙 및 게시판 이용 수칙 및 개인 정보 보호 및 점심메뉴에 관한 논의 등등등 말줄임을 위해 길게 쭉~~~</a></td>
                  <td>관리자</td>
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