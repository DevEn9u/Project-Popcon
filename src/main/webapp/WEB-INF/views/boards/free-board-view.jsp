<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/board.css">
<script>

	// 댓글 삭제를 위한 함수
	function deleteComment(commentIdx) {
		let confirmed = confirm("댓글을 삭제하겠습니까?");
		if (confirmed) {
			location.href = './comDelete.do?idx=' + commentIdx;
		}
	}
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
              <!-- 게시물 제목, 작성일, 작성자, 조회수 동적 출력 -->
              <h3>${dto.board_title}</h3>
              <p class="date"><fmt:formatDate value="${dto.postdate}" pattern="yyyy.MM.dd" /></p>
              <p class="date">작성자 : ${dto.writer}</p>
              <p class="date">조회수 : ${dto.visitcount}</p>
              <form name="deleteFrm" method="post" action="./delete.do?board_idx=${dto.board_idx}">
                <input type="hidden" name="board_idx" value="${dto.board_idx}" />
              </form>
            </div>
            <div class="view_con">
              <!-- 게시물 본문 내용 출력 -->
              <p>${dto.contents}</p>
              <!-- 게시물 이미지 출력 -->
              <c:forEach var="image" items="${images}">
                  <img src="${image.image_url}" alt="Image" />
              </c:forEach>
            </div>
            <div class="btn_wrap">
              <!-- session에 저장된 UserId와 게시물 작성자가 동일할 때 수정&삭제 버튼 출력 -->
              <c:if test="${ user_id != null && user_id.toString().equals(dto.writer)}">
                <button type="button" class="btn board_btn" onclick="location.href='./edit.do?board_idx=${dto.board_idx}';">
                  수정하기
                </button>
                <button type="button" class="btn del_btn board_btn" onclick="if(confirm('정말 삭제하시겠습니까?')) { location.href='../freeBoard/delete.do?board_idx=${dto.board_idx}'; }">
                  삭제하기
                </button>
              </c:if>
              <button type="button" onclick="location.href='./list.do';" class="btn list_btn board_btn">목록으로</button>
            </div>
          </div>
          <div class="comment_section">
            <h3>댓글 작성하기</h3>
            <form name="commentFrm" method="post" class="comment_form" action="./comWrite.do" enctype="multipart/form-data">
              <input type="hidden" name="boardIdx" value="${dto.board_idx}" />
              <!-- 댓글 작성자 정보 -->
              작성자 : <input type="text" name="name" class="comment_writer" value="${UserName}" readonly="readonly" />
              <textarea name="commCon" rows="4" cols="50" class="comment_area" placeholder="댓글을 입력하세요"></textarea>
              <div class="file_wrap">
                  <input type="text" class="file_name" readonly>
                  <input type="file" id="comment_upload" class="blind" name="imageFile" multiple onchange="handleFileSelect(this)">
                  <label for="comment_upload">파일선택</label>
              </div>
              <p class="file_note">이미지 파일은 10MB 이하 jpg, png, gif, webp 확장자 파일만 올릴 수 있습니다.</p>
              <br />
              <button type="submit" class="btn comment_btn">댓글 작성</button>
            </form>

            <!-- 댓글 목록 -->
            <div class="view_con comment_list">
              <h3>댓글 목록</h3>
              <c:forEach var="comment" items="${commentsList}">
                <div class="comment_item">
                  <div class="txt_wrap">
                    <p>${comment.name} (${comment.postDate})</p>
                    <p>${comment.content}</p>
                    <!-- 댓글 이미지 출력 -->
                    <c:forEach var="image" items="${comment.images}">
                        <img src="${image.image_url}" alt="Image" />
                    </c:forEach>
                  </div>
                  <!-- 댓글 수정/삭제 버튼 -->
                  <c:if test="${ UserId != null && UserId.toString().equals(comment.writer)}">
                    <button type="button" class="btn comment_btn" onclick="location.href='./comEdit.do?idx=${comment.idx}';">
                      수정하기
                    </button>
                    <button type="button" class="btn comment_btn" onclick="deleteComment(${comment.idx});">
                      삭제하기
                    </button>
                  </c:if>
                </div>
              </c:forEach>
              <c:if test="${empty commentsList}">
                <p>등록된 댓글이 없습니다.</p>
              </c:if>
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
