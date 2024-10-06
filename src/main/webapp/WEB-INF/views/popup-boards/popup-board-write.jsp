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
      };
    };

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
        const thumbnailFile = document.querySelector('input[name="thumbFile"]');
        const generalFile = document.querySelector('input[name="imageFile"]');

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
        
        if (!generalFile.files.length) {
            alert("이미지를 2장 업로드 해주세요.");
            generalFile.focus();
            return false;
        }
        
        if (!thumbnailFile.files.length) {
            alert("썸네일 이미지를 업로드 해주세요.");
            thumbnailFile.focus();
            return false;
        }
        
        
        return true;
    }

    function handleSubmit(event) {
        event.preventDefault();
        if (validateForm()) {
            document.querySelector('form').submit();
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
          <h2>팝업게시판 - 작성</h2>
        </div>
      </div>
      <div class="contents">
        <div class="inner">
          <h3>게시글 작성</h3>
          <div class="board_write">
            <form name="writeFrm" method="post" enctype="multipart/form-data" action="/popupBoard/write.do" onsubmit="return validateForm(this)">
              <table>
                <caption class="nohead">게시글 작성</caption>
                <tr>
                  <th>제목</th>
                  <td><input type="text" name="board_title" placeholder="제목을 입력해주세요" required></td>
                </tr>
                <tr>
                  <th>내용</th>
                  <td>
                    <textarea cols="30" rows="20" name="contents" placeholder="내용을 입력해 주세요." required></textarea>
                  </td>
                </tr>
                <tr>
                  <th>입장료</th>
                  <td><input type="text" name="popup_fee" placeholder="숫자만 입력해 주세요" required></td>
                </tr>
                <tr>
                  <th>팝업일정</th>
                  <td>
                    <input type="text" name="start_date" placeholder="시작: YYYY-MM-DD" required>
                    <input type="text" name="end_date" placeholder="종료: YYYY-MM-DD" required>
                  </td>
                </tr>
                <tr>
                  <th>주소</th>
                  <td><input type="text" name="popup_addr" placeholder="주소를 입력해 주세요" required></td>
                </tr>
                <tr>
                  <th>카테고리</th>
                  <td><input type="text" name="category" placeholder="카테고리를 입력해 주세요" required></td>
                </tr>
                <tr>
                  <th>오픈 요일</th>
                  <td><input type="text" name="open_days" placeholder="월 ~ 금 또는 월, 수, 금 형식으로 입력" required></td>
                </tr>
                <tr>
                  <th>오픈 시간</th>
                  <td><input type="text" name="open_hours" placeholder="예: 11:00 ~ 17:00" required></td>
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
              </table>
              <div class="btn_wrap">
                <button type="submit" class="btn board_btn">등록</button>
                <button type="button" class="btn board_btn cancel_btn" onclick="checkReset();">다시쓰기</button>
                <button type="button" onclick="location.href='./list.do';" class="btn board_btn cancel_btn">목록</button>
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
