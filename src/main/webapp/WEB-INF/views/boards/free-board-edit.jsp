<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/board.css">
<script src="../js/file-upload.js"></script>
<script>
    function checkReset() {
        if (confirm("게시물을 다시 쓰시겠습니까?")) {
            let form = document.writeFrm;
            form.reset();
        }
        else {
            return false;
        }
    }

    function validateForm(form) {
        if (form.board_title.value.trim() === "") {
            alert("제목을 입력해주세요.");
            form.board_title.focus();
            return false;
        }
        if (form.contents.value.trim() === "") {
            alert("내용을 입력해주세요.");
            form.contents.focus();
            return false;
        }
        return true;
    }

    // 이미지 파일 선택 시 파일 이름 표시 및 유효성 검사
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

        document.querySelector(".file_name").value = fileNames.join(', ');
    }
</script>
<body>
  <div id="skip_navi">
    <a href="#container">본문 바로가기</a>
  </div>
  <div id="wrap">
  	${common_header}
    <main id="container" class="board_page board_write sub_container">
      <div class="sub_top">
        <div class="inner">
          <h2>자유게시판 - 수정</h2>
        </div>
      </div>
      <div class="contents">
        <div class="inner">
          <h3>게시글 수정</h3>
          <div class="board_write">
            <form name="writeFrm" method="post" action="../freeBoard/update.do" enctype="multipart/form-data" onsubmit="return validateForm(this)">
              <!-- 삭제시 idx를 이용해 삭제 -->
              <input type="hidden" name="board_idx" value="${ dto.board_idx }" />       	 
              <table>
               <caption class="nohead">게시글 작성</caption>
               <tr>
                 <th>이름</th>
                 <td><input class="blind" type="text" name="name" readonly="readonly" value="${ dto.writer }"><input type="text" name="name" readonly="readonly" value="${ user_name}"></td>
               </tr>
               <tr>
                 <th>제목</th>
                 <td><input type="text" name="board_title" placeholder="제목을 입력해주세요." value="${ dto.board_title }"></td>
               </tr>
               <tr> 
                 <th class="t_area">내용</th>
                 <td>
                   <textarea cols="30" rows="20" name="contents"
                     placeholder="필수 입력사항을 작성하고 입력해주세요.&#10;비방, 욕설, 도배글 등은 서비스 이용 제한의 사유가 됩니다.">${ dto.contents }</textarea>
                 </td>
               </tr>
               <tr>
                <th>첨부파일</th>
                <td class="td_flex">
                  <div class="file_wrap">
                    <input type="text" class="file_name" readonly>
                    <input type="file" id="upload" class="blind" name="imageFile" multiple onchange="handleFileSelect(this)">
                    <label for="upload">파일선택</label>
                  </div>
                  <p class="file_note">이미지 파일은 10MB 이하 jpg, png, gif, webp 확장자 파일만 올릴 수 있습니다.</p>
                </td>
              </tr>
              <tr>
                <th>기존 이미지</th>
                <td>
                <div id="image_section" style="scroll-margin-top: 300px;">
	                  <c:forEach var="image" items="${images}">
	                    <div class="existing_image">
	                      <img src="${pageContext.request.contextPath}${image.image_url}" alt="Image" />
	                      <a href="deleteImage.do?image_idx=${image.image_idx}&board_idx=${dto.board_idx}" onclick="return confirm('이미지를 삭제하시겠습니까?');">
	                      <img src="${pageContext.request.contextPath}/images/imgMGJ/delete_btn.svg" style="filter: invert(34%) sepia(94%) saturate(7482%) hue-rotate(-1deg) brightness(95%) contrast(102%);" /></a>
	                    </div>
	                  </c:forEach>
                  </div>
                </td>
              </tr>
              </table>
              <div class="btn_wrap">
                <button type="submit" class="btn board_btn">등록</button>
                <button type="button" class="btn board_btn cancel_btn" onclick="checkReset();">다시쓰기</button>
                <button type="button" onclick="location.href='./view.do?board_idx=${dto.board_idx}';" class="btn board_btn cancel_btn">수정취소</button>
              </div>
            </form>
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
