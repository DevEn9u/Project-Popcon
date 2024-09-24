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
              <h3>게시물 제목</h3>
              <p class="date">2024.12.12</p>
              <p class="date">작성자 : 관리자</p>
              <p class="date">조회수 : 999</p>
              <form name="deleteFrm" method="post"
                 action="./delete.do?idx=${ dto.idx }">
                <input type="hidden" name="idx" value="${ dto.idx }" />
              </form>
            </div>
            <div class="view_con">
              <p>공지사항 게시판입니다.
                테스트중입니다.미국 민간연구단체 에포크AI(EPOCH AI)가 지난 7월 발표한 조사에 따르면, 2020~2023년까지 출시된 오픈AI의 '챗GPT-3' 수준의 생성형 AI 모델 수가 가장 많은 나라는 미국(64개), 두 번째는 중국(42개)이었다.

                3위는 한국(11개), 4위 프랑스(6개), 5위 영국(5개), 공동 6위는 일본, 이스라엘, 홍콩(각 3개)이 차지했다.
                
                민간 투자액 순위 역시 미국과 중국이 각각 1·2위를 나눠가졌다.
                
                스탠퍼드대가 발표한 '인공지능 지수(AI INDEX) 2024' 보고서에 의하면, 2023년 AI 민간부문 투자액 순위는 미국이 672억2000만달러(약 89조3000억원)로 압도적 1위, 중국이 77억6000만달러(약 10조3000억원)로 2위를 차지했다. <br /><br /> Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus corrupti, dolores libero id ex laudantium tempora neque repudiandae eum dolor. Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt tenetur, aliquid qui obcaecati sit, consectetur, natus repudiandae nam suscipit corporis a fugit! Nam maxime <br /><br />consequuntur deserunt blanditiis, voluptate quasi accusamus?
              </p>
            </div>
            <div class="btn_wrap">
              <!-- session에 저장된 UserId와 게시물 작성자와 동일할때만 수정&삭제 버튼 출력 -->
<%--               <c:if test="${ UserId != null && UserId.toString().equals(dto.getId())}"> --%>
              <button type="button" class="btn board_btn" onclick="location.href='./edit.do';">
                수정하기
              </button>
              <button type="button" class="btn del_btn board_btn" onclick="deletePost();">
                삭제하기
              </button>
<%--               </c:if> --%>
              <button type="button"
                onclick="location.href='./list.do';"
                class="btn list_btn board_btn">목록으로</button>
            </div>
          </div>
        </div>
      </div>
    </main>
    ${common_footer }
  </div>
</body>
</html>