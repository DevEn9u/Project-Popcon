<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="../include/head.jsp" />
</head>

<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/board.css">
<script src="../js/file-upload.js"></script>
<script>
    function checkReset() {
        if (confirm("게시물을 다시 쓰시겠습니까?")) {
            let form = document.writeFrm;
            form.reset();
        } else {
            return false;
        }
    }

    function validateForm() {
        const title = document.querySelector('input[name="board_title"]');
        const contents = document.querySelector('textarea[name="contents"]');
        const popupFee = document.querySelector('input[name="popup_fee"]');
        const startDate = document.querySelector('input[name="start_date"]');
        const endDate = document.querySelector('input[name="end_date"]');
        const popupAddr = document.querySelector('input[name="popup_addr"]');
        const category = document.querySelector('input[name="category"]');
        const openDays = document.querySelector('input[name="open_days"]');
        const openHours = document.querySelector('input[name="open_hours"]');

        if (!title.value.trim()) {
            alert("제목을 입력해 주세요.");
            title.focus();
            return false;
        }
        if (!contents.value.trim()) {
            alert("내용을 입력해 주세요.");
            contents.focus();
            return false;
        }
        if (!popupFee.value.trim()) {
            alert("입장료를 입력해 주세요.");
            popupFee.focus();
            return false;
        }
        if (!/^\d+$/.test(popupFee.value.trim())) {
            alert("입장료는 숫자만 입력해 주세요.");
            popupFee.focus();
            return false;
        }
        if (!startDate.value.trim()) {
            alert("시작 날짜를 입력해 주세요.");
            startDate.focus();
            return false;
        }
        if (!endDate.value.trim()) {
            alert("종료 날짜를 입력해 주세요.");
            endDate.focus();
            return false;
        }
        if (!/^\d{4}-\d{2}-\d{2}$/.test(startDate.value.trim())) {
            alert("시작 날짜는 YYYY-MM-DD 형식으로 입력해 주세요.");
            startDate.focus();
            return false;
        }
        if (!/^\d{4}-\d{2}-\d{2}$/.test(endDate.value.trim())) {
            alert("종료 날짜는 YYYY-MM-DD 형식으로 입력해 주세요.");
            endDate.focus();
            return false;
        }
        if (!popupAddr.value.trim()) {
            alert("주소를 입력해 주세요.");
            popupAddr.focus();
            return false;
        }
        if (!category.value.trim()) {
            alert("카테고리를 입력해 주세요.");
            category.focus();
            return false;
        }
        if (!openDays.value.trim()) {
            alert("오픈 요일을 입력해 주세요.");
            openDays.focus();
            return false;
        }
        if (!openHours.value.trim()) {
            alert("오픈 시간을 입력해 주세요.");
            openHours.focus();
            return false;
        }
        
        return true;
    }

    function handleSubmit(event) {
        event.preventDefault();
        if (validateForm()) {
            document.writeFrm.submit(); // 이 줄에서 폼을 제출
        }
    }
    

    function dateRule(event) {
        const input = event.target;
        let value = input.value.replace(/[^0-9]/g, ''); 
        if (value.length >= 4) {
            value = value.substring(0, 4) + '-' + value.substring(4);
        }
        if (value.length >= 7) {
            value = value.substring(0, 7) + '-' + value.substring(7);
        }
        input.value = value;
    }

    function payRule(event) {
        const input = event.target;
        input.value = input.value.replace(/[^0-9]/g, ''); 
    }

    window.onload = function() {
        const startDateInput = document.querySelector('input[name="start_date"]');
        const endDateInput = document.querySelector('input[name="end_date"]');
        const popupFeeInput = document.querySelector('input[name="popup_fee"]');
        
        startDateInput.addEventListener('input', dateRule);
        endDateInput.addEventListener('input', dateRule);
        popupFeeInput.addEventListener('input', payRule);
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

    function handleThumbSelect(input) {
        const files = input.files;
        const fileNames = [];
        const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
        const maxSize = 10 * 1024 * 1024; // 10MB

        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            if (!allowedTypes.includes(file.type)) {
                alert('허용되지 않은 썸네일 파일 형식입니다: ' + file.name);
                input.value = '';
                document.querySelector(".thumb_name").value = ''; // Clear the file name display
                return;
            }
            if (file.size > maxSize) {
                alert('썸네일 파일 크기는 10MB 이하이어야 합니다: ' + file.name);
                input.value = '';
                document.querySelector(".thumb_name").value = ''; // Clear the file name display
                return;
            }
            fileNames.push(file.name);
        }

        document.querySelector(".thumb_name").value = fileNames.join(', ');
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
          <h2>팝업게시판 - 수정</h2>
        </div>
      </div>
      <div class="contents">
        <div class="inner">
          <h3>게시글 수정</h3>
          <div class="board_write">
            <form name="writeFrm" method="post" enctype="multipart/form-data" action="../popupBoard/edit.do" onsubmit="return validateForm(this);">
              <!-- 게시글 수정에 필요한 ID -->
              <input type="hidden" name="board_idx" value="${ popup.board_idx }" />
              <table>
                <caption class="nohead">게시글 수정</caption>
                <tr>
                  <th>제목</th>
                  <td><input type="text" name="board_title" placeholder="제목을 입력해주세요" value="${ popup.board_title }" required></td>
                </tr>
                <tr>
                  <th>내용</th>
                  <td>
                    <textarea cols="30" rows="20" name="contents" placeholder="내용을 입력해 주세요." required>${ popup.contents }</textarea>
                  </td>
                </tr>
                <tr>
                  <th>입장료</th>
                  <td><input type="text" name="popup_fee" placeholder="숫자만 입력해 주세요" value="${ popup.popup_fee }" required></td>
                </tr>
                <tr>
                  <th>팝업일정</th>
                  <td>
                    <input type="text" name="start_date" placeholder="시작: YYYY-MM-DD" value="${ popup.start_date }" required>
                    <input type="text" name="end_date" placeholder="종료: YYYY-MM-DD" value="${ popup.end_date }" required>
                  </td>
                </tr>
                <tr>
                  <th>주소</th>
                  <td><input type="text" name="popup_addr" placeholder="주소를 입력해 주세요" value="${ popup.popup_addr }" required></td>
                </tr>
                <tr>
                  <th>카테고리</th>
                  <td><input type="text" name="category" placeholder="카테고리를 입력해 주세요" value="${ popup.category }" required></td>
                </tr>
                <tr>
                  <th>오픈 요일</th>
                  <td><input type="text" name="open_days" placeholder="오픈 요일을 입력해 주세요" value="${ popup.open_days }" required></td>
                </tr>
                <tr>
                  <th>오픈 시간</th>
                  <td><input type="text" name="open_hours" placeholder="오픈 시간을 입력해 주세요" value="${ popup.open_hours }" required></td>
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
				<c:if test="${not empty images}">
				    <tr>
				        <th>기존 이미지</th>
				        <td>
				            <c:forEach var="image" items="${images}">
				                <div class="existing_image">
				                    <img src="${pageContext.request.contextPath}${image.image_url}" alt="Image" />
				                    <a href="deleteImage.do?image_idx=${image.image_idx}&board_idx=${popup.board_idx}" onclick="return confirm('이미지를 삭제하시겠습니까?');">삭제</a>
				                </div>
				            </c:forEach>
				        </td>
				    </tr>
				</c:if>
				<tr>
				    <th>썸네일 이미지</th>
				    <td class="td_flex">
				        <div class="file_wrap">
				            <input type="text" class="thumb_name" readonly>
				            <input type="file" id="thumbUpload" class="blind" name="thumbFile" onchange="handleThumbSelect(this)">
				            <label for="thumbUpload">썸네일 선택</label>
				        </div>
				        <p class="file_note">썸네일 이미지 파일은 10MB 이하 jpg, png, gif, webp 확장자 파일만 올릴 수 있습니다.</p>
				    </td>
				</tr>
				<c:if test="${not empty popup.thumb}">
				    <tr>
				        <th>기존 썸네일 이미지</th>
				        <td>
				            <div class="existing_thumbnail">
				                <img src="${pageContext.request.contextPath}${popup.thumb}" alt="Thumbnail" />
				                <a href="deleteThumbnail.do?board_idx=${popup.board_idx}&thumb=${popup.thumb}" 
				                   onclick="return confirm('썸네일 이미지를 삭제하시겠습니까?');">삭제</a>
				            </div>
				        </td>
				    </tr>
				</c:if>
              
              </table>
              <div class="btn_area">
                <button type="submit" class="submit_btn btn">수정하기</button>
                <button type="button" class="reset_btn btn" onclick="location.href='./list.do';">목록으로</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </main>
    	<!-- 경로 문제로 footer 직접 추가하였습니다. -->
	<footer id="footer">
		<div class="inner">
			<section class="footer_wrap">
				<div class="footer_top">
					<div class="txt_wrap">
						<ul class="txt">
							<li><a href="#">서비스 이용약관</a></li>
							<li><a href="#">개인정보 처리방침</a></li>
							<li><a href="#">마케팅 수신 동의</a></li>
							<li><a href="#">고객센터</a></li>
							<li><a href="#">비즈니스</a></li>
						</ul>
					</div>
				</div>
				<div class="footer_bottom">
					<div class="col1">
						<div class="company_wrap">
							<p>(주)플로팅플래닛</p>
							<p>주소 : 서울 종로구 삼일대로17길 51 스타골드빌딩 5층</p>
							<p>문의전화 : (02)333-4567</p>
							<p>이메일 : popcon@popcon.co.kr</p>
							<p>대표전화 : (02)333-4567</p>
							<p>FAX : (02)333-5432</p>
						</div>
					</div>
					<div class="col2">
						<div class="sns_wrap">
							<ul class="sns">
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-kakao.svg">
										카카오톡
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-instagram.svg">
										인스타그램
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-facebook.svg">
										페이스북
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/images/main/footer_sns_images/icon-naverblog.svg">
										블로그
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<span class="copyright">Copyright 2024. Floating Planet
					Co.,Ltd. All rights reserved</span>
				<div class="footer_logo">
					<img
						src="${pageContext.request.contextPath}/images/main/footer_awards.png"
						alt="">
				</div>
			</section>
		</div>
	</footer>
  </div>
</body>
</html>
