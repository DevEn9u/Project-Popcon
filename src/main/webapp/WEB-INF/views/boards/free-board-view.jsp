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
    function deleteComment(com_idx) {
        if (confirm("댓글을 삭제하시겠습니까?")) {
            var form = document.getElementById('deleteCommentForm_' + com_idx);
            form.submit();
        }
    }

    // 댓글 작성 폼 밸리데이션
    function validateCommentForm() {
        var com_contents = document.getElementById("com_contents");
        if (com_contents.value.trim() === "") {
            alert("내용을 입력해주세요.");
            com_contents.focus();
            return false;
        }
        return true;
    }
    
    // 댓글 이미지 파일 선택 시 파일 이름 표시 및 유효성 검사
	function handleFileSelect(input) {
	    const files = input.files;
	    const fileNames = [];
	    const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
	    const maxSize = 10 * 1024 * 1024; // 10MB
	
	    for (let i = 0; i < files.length; i++) {
	        const file = files[i];
	        if (!allowedTypes.includes(file.type)) {
	            alert('허용되지 않은 파일 형식입니다: ' + file.name);
	            input.value = '';
	            return;
	        }
	        if (file.size > maxSize) {
	            alert('파일 크기는 10MB 이하이어야 합니다: ' + file.name);
	            input.value = '';
	            return;
	        }
	        fileNames.push(file.name);
	    }
	
	    // 파일 이름을 표시할 요소를 찾습니다.
	    // 파일 입력 요소의 부모 요소에서 .file_name 클래스를 가진 요소를 찾습니다.
	    const fileNameInput = input.parentElement.querySelector(".file_name");
	    if (fileNameInput) {
	        fileNameInput.value = fileNames.join(', ');
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
              <p class="date">작성자 : ${writerName}</p>
              <p class="date">조회수 : ${dto.visitcount}</p>
              <form name="deleteFrm" method="post" action="./delete.do?board_idx=${dto.board_idx}">
                <input type="hidden" name="board_idx" value="${dto.board_idx}" />
              </form>
            </div>
            <div class="view_con">
              <!-- 게시물 본문 내용 출력 -->
              <!-- 게시물 이미지 출력 -->
              <c:forEach var="image" items="${images}">
                  <img src="${image.image_url}" alt="Image" />
              </c:forEach>
              <p>${dto.contents}</p>
            </div>
            <div class="btn_wrap">
              <!-- 로그인한 사용자와 게시물 작성자가 동일할 때 수정&삭제 버튼 출력 -->
              <c:if test="${ user_id != null && user_id == dto.writer }">
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
            <form name="commentFrm" method="post" class="comment_form" action="../freeBoard/writeComment.do" enctype="multipart/form-data" onsubmit="return validateCommentForm();">
              <input type="hidden" name="board_idx" value="${dto.board_idx}" />
              <!-- 댓글 작성자 정보 -->
              작성자 : ${user_name } <input type="text" name="com_writer" class="comment_writer blind" value="${user_id}" readonly="readonly" />
              <textarea name="com_contents" id="com_contents" rows="4" cols="50" class="comment_area" placeholder="댓글을 입력하세요"></textarea>
              <!-- 파일 업로드 기능 -->
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
	            <div class="comments_section" id="comments_section">
	              <h3>댓글 목록</h3>
				  <c:forEach var="comment" items="${comments}">
				    <div class="comment_item" id="comment_${comment.com_idx}" style="scroll-margin-top: 300px;">
				      <div class="txt_wrap">
				        <p>${comment.comWriterName} (<fmt:formatDate value="${comment.com_postdate}" pattern="yyyy.MM.dd HH:mm:ss" />)</p>
				        <!-- 댓글 내용 또는 수정 폼 -->
				        <c:choose>
				          <c:when test="${editingCommentId == comment.com_idx}">
				            <form action="../freeBoard/editComment.do" method="post" class="comment_edit_form" enctype="multipart/form-data">
				              <input type="hidden" name="com_idx" value="${comment.com_idx}" />
				              <input type="hidden" name="board_idx" value="${dto.board_idx}" />
	
				              <c:if test="${not empty comment.com_img}">
				                <div class="existing_images">
				                  <c:forEach var="image" items="${comment.com_img}">
				                    <div class="image_item">
				                      <img src="${image.image_url}" alt="Image" />
				                      <a href="../freeBoard/deleteCommentImage.do?image_idx=${image.image_idx}&board_idx=${dto.board_idx}&com_idx=${comment.com_idx}" onclick="return confirm('이미지를 삭제하시겠습니까?');">삭제</a>
				                    </div>
				                  </c:forEach>
				                </div>
				              </c:if>
				              <textarea name="com_contents" class="comment_area">${comment.com_contents}</textarea>
							  <div class="file_wrap">
							      <input type="text" class="file_name" readonly>
							      <input type="file" id="comment_edit_upload_${comment.com_idx}" class="blind" name="newImageFile" onchange="handleFileSelect(this)">
							      <label for="comment_edit_upload_${comment.com_idx}">파일선택</label>
							  </div>
							  <p class="file_note">이미지 파일은 10MB 이하 jpg, png, gif, webp 확장자 파일만 올릴 수 있습니다.</p>
				              
				              <button type="submit" class="btn comment_btn">수정완료</button>
				            </form>
				          </c:when>
							<c:otherwise>
							    <div class="comment_content">
							        <c:if test="${not empty comment.com_img}">
							            <div class="comment_images">
							                <c:forEach var="image" items="${comment.com_img}">
							                    <img src="${image.image_url}" alt="Image" />
							                </c:forEach>
							            </div>
							        </c:if>
							        <p class="comment_text">${comment.com_contents}</p>
							    </div>
							</c:otherwise>
				        </c:choose>
				      </div>
				      <!-- 댓글 수정/삭제 버튼 -->
				      <c:if test="${ user_id != null && user_id == comment.com_writer && editingCommentId != comment.com_idx }">
					    <div class="comment_buttons">
					        <!-- 수정 버튼 -->
					        <button type="button" class="btn comment_btn" onclick="location.href='?board_idx=${dto.board_idx}&editingCommentId=${comment.com_idx}#comment_${comment.com_idx}'">
					            수정하기
					        </button>
					        <!-- 삭제 버튼 -->
					        <form id="deleteCommentForm_${comment.com_idx}" action="../freeBoard/deleteComment.do" method="post" style="display: inline;">
					            <input type="hidden" name="com_idx" value="${comment.com_idx}" />
					            <input type="hidden" name="board_idx" value="${dto.board_idx}" />
					            <button type="button" class="btn comment_btn" onclick="deleteComment('${comment.com_idx}');">
					                삭제하기
					            </button>
					        </form>
					    </div>
				      </c:if>
				    </div>
				  </c:forEach>
			  </div>
              <c:if test="${empty comments}">
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
