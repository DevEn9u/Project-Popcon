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
          <h2>자유게시판</h2>
        </div>
      </div>
      <div class="contents">
        <div class="inner">
          <div class="board_view">
            <div class="tit_wrap">
              <h3>게시물 제목</h3>
              <p class="date">2024.12.12</p>
              <p class="date">작성자 : EMS Entertainment</p>
              <p class="date">조회수 : 999</p>
              <form name="deleteFrm" method="post"
                 action="./delete.do?idx=${ dto.idx }">
                <input type="hidden" name="idx" value="${ dto.idx }" />
              </form>
            </div>
            <div class="view_con">
              <img src="../images/푸루_눈치.jpg" alt="이미지">
              <p>안녕하세요. 반갑습니다.
                테스트중이고 하하 자유게시판입니다. <br /><br /> Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus corrupti, dolores libero id ex laudantium tempora neque repudiandae eum dolor. Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt tenetur, aliquid qui obcaecati sit, consectetur, natus repudiandae nam suscipit corporis a fugit! Nam maxime <br /><br />consequuntur deserunt blanditiis, voluptate quasi accusamus?
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
          <div class="comment_section">
            <h3>댓글 작성하기</h3>
            <form
              name="commentFrm"
              method="post"
              class="comment_form"
              action="./comWrite.do"
            >
              <input type="hidden" name="boardIdx" value="${ dto.idx }" />
              <!-- 게시물 ID -->
              작성자 :
              <input
                type="text"
                name="name"
                class="comment_writer"
                value="${ UserName }"
                readonly="readonly"
              />
              <textarea
                name="commCon"
                rows="4"
                cols="50"
                class="comment_area"
                placeholder="댓글을 입력하세요"
              ></textarea>
              <br />
              <button type="submit" class="btn comment_btn">댓글 작성</button>
            </form>

            <!-- 댓글 목록 -->
            <div class="view_con comment_list">
              <h3>댓글 목록</h3>
              <c:forEach var="comment" items="${ commentsList }">
                <div class="comment_item">
                  <div class="txt_wrap">
                    <p>${ comment.name } (${ comment.postDate })</p>
                    <p>${ comment.content }</p>
                  </div>
                  <button
                    type="button"
                    class="btn comment_btn"
                    onclick="location.href='./comEdit.do?idx=${ param.idx }';"
                  >
                    수정하기
                  </button>
                  <button
                    type="button"
                    class="btn comment_btn"
                    onclick="deleteComment();"
                  >
                    삭제하기
                  </button>
                </div>
              </c:forEach>
              <c:if test="${ empty commentsList }">
                <p>등록된 댓글이 없습니다.</p>
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </main>
    ${common_footer}
  </div>
</body>
</html>