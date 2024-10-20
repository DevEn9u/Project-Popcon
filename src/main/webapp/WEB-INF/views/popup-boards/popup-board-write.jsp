<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/popup_write.css">
<script src="../js/file-upload.js"></script>
</head>

<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<script>
    $(function() {
        // 시작 날짜 및 종료 날짜 입력 필드에 날짜 선택기 초기화
        $('input[name="start_date"]').datepicker({
            dateFormat: 'yy-mm-dd', // 형식을 YYYY-MM-DD로 설정
            changeMonth: true,
            changeYear: true
        });

        $('input[name="end_date"]').datepicker({
            dateFormat: 'yy-mm-dd', // 형식을 YYYY-MM-DD로 설정
            changeMonth: true,
            changeYear: true
        });
    });
</script>
<script>
	function checkReset() {
		if (confirm("게시물을 다시 쓰시겠습니까?")) {
			let form = document.writeFrm;
			form.reset();
		} else {
			return false;
		}
		;
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
		
		// 이미지 파일 개수 체크 추가
		const generalFiles = document.querySelector('input[name="imageFile"]');
		if (generalFiles.files.length > 2) {
			alert("사진은 2개까지만 첨부 가능합니다.");
			generalFiles.focus();
			return false;
		}

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

	
	function payRule(event) {
		const input = event.target;
		input.value = input.value.replace(/[^0-9]/g, '');
	}
	
	document.addEventListener('DOMContentLoaded', function() {
	    function formatDateInput(input) {
	        let value = input.value.replace(/[^0-9]/g, ''); // 숫자 외 문자 제거
	        let formattedValue = '';

	        if (value.length >= 4) {
	            // 연도(YYYY) 입력 후 자동으로 '-' 추가
	            formattedValue = value.substr(0, 4);
	            if (value.length > 4) {
	                // 월(MM) 입력 후 자동으로 '-' 추가
	                formattedValue += '-' + value.substr(4, 2);
	                if (value.length > 6) {
	                    // 일(DD) 입력, 더 이상 자동 추가 없음
	                    formattedValue += '-' + value.substr(6, 2);
	                }
	            }
	        } else {
	            // 아직 연도 4자리가 입력되지 않았으면 그대로 표시
	            formattedValue = value;
	        }

	        input.value = formattedValue;
	    }

	    // 날짜 입력 필드에 자동으로 '-' 추가
	    const startDateInput = document.querySelector('input[name="start_date"]');
	    const endDateInput = document.querySelector('input[name="end_date"]');

	    if (startDateInput) {
	        startDateInput.addEventListener('input', function() {
	            formatDateInput(this);
	        });
	    }

	    if (endDateInput) {
	        endDateInput.addEventListener('input', function() {
	            formatDateInput(this);
	        });
	    }
	});


	// 이미지 파일 선택 시 파일 이름 표시 및 유효성 검사
	function handleFileSelect(input) {
		const files = input.files;
		const fileNames = [];
		const allowedTypes = [ 'image/jpeg', 'image/png', 'image/gif',
				'image/webp' ];
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
		const allowedTypes = [ 'image/jpeg', 'image/png', 'image/gif',
				'image/webp' ];
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

<script>
//주소 입력 시 api 쓰기
function openPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.querySelector('input[name="popup_addr"]').value = data.address;
        }
    }).open();
}
</script>

<script>
// 요일 저장
function updateOpenDays() {
    const checkboxes = document.querySelectorAll('input[name="week"]:checked');
    const openDaysArray = Array.from(checkboxes).map(checkbox => checkbox.value);
    const openDays = openDaysArray.join(', '); // 체크된 요일 값을 가져와서 ','로 연결
    
    // 마지막 요일 뒤에 , 제거
    const formattedOpenDays = openDays.endsWith(', ') ? openDays.slice(0, -2) : openDays;

    document.getElementById('open_days').value = formattedOpenDays; // hidden input에 저장
}
</script>

<script>
function updateOpenHours() {
    const startHour = document.getElementById('start_hour').value;
    const endHour = document.getElementById('end_hour').value;

    // 시간 포맷팅
    const formattedStartHour = startHour.padStart(2, '0') + ':00'; // 예: '5' -> '05:00'
    const formattedEndHour = endHour.padStart(2, '0') + ':00'; // 예: '17' -> '17:00'

    // 오픈 시간을 '시작 시간 ~ 종료 시간' 형식으로 설정
    document.getElementById('open_hours').value = formattedStartHour + ' ~ ' + formattedEndHour;
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
						<form name="writeFrm" method="post" enctype="multipart/form-data"
							action="/popupBoard/write.do"
							onsubmit="return validateForm(this)">
							<table>
								<caption class="nohead">게시글 작성</caption>
								<tr>
									<th>제목</th>
									<td><input type="text" name="board_title"
										placeholder="제목을 입력해주세요" required></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea cols="30" rows="20" name="contents"
											placeholder="내용을 입력해 주세요." required></textarea></td>
								</tr>
								<tr>
									<th>입장료</th>
									<td><input type="text" name="popup_fee"
										placeholder="숫자만 입력해 주세요" required></td>
								</tr>
								<tr>
									<th>팝업일정</th>
									<td><input type="text" name="start_date"
										placeholder="시작 날짜" class="pw_start_date" required> <input type="text"
										name="end_date" placeholder="종료 날짜" required></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" name="popup_addr" id="main_addr"
										placeholder="주소를 입력해 주세요" style="width: 30%;" required>
										<button type="button" onclick="openPostcode()" class="btn addr_btn">우편번호
											검색</button> <input type="text" name="popup_addr" id="detail_addr"
										placeholder="상세주소를 입력해 주세요" onblur="combineAddresses()">
									</td>
								</tr>


								<tr>
									<th>카테고리</th>
									<td><input type="text" name="category"
										placeholder="카테고리를 입력해 주세요" required></td>
								</tr>
								<tr>
									<th>오픈 요일</th>
									<td>
										<form id="popupOpendays">
											<input type="checkbox" id="mon" name="week" value="월"
												onchange="updateOpenDays()" /><label for="mon">월</label> <input
												type="checkbox" id="tue" name="week" value="화"
												onchange="updateOpenDays()" /><label for="tue">화</label> <input
												type="checkbox" id="wed" name="week" value="수"
												onchange="updateOpenDays()" /><label for="wed">수</label> <input
												type="checkbox" id="thur" name="week" value="목"
												onchange="updateOpenDays()" /><label for="thur">목</label> <input
												type="checkbox" id="fri" name="week" value="금"
												onchange="updateOpenDays()" /><label for="fri">금</label> <input
												type="checkbox" id="sat" name="week" value="토"
												onchange="updateOpenDays()" /><label for="sat">토</label> <input
												type="checkbox" id="sun" name="week" value="일"
												onchange="updateOpenDays()" /><label for="sun">일</label>
										</form> <input type="hidden" name="open_days" id="open_days" />
									</td>
								</tr>
								<tr>
									<th>오픈 시간</th>
									<td><select name="start_hour" id="start_hour"
										onchange="updateOpenHours()"
										style="width: 50px; text-align: center; color: black;">
											<c:forEach var="hour" begin="0" end="23">
												<option value="${hour}">
													<fmt:formatNumber value="${hour}" pattern="00" />:00
												</option>
											</c:forEach>
									</select> ~ <select name="end_hour" id="end_hour"
										onchange="updateOpenHours()"
										style="width: 50px; text-align: center; color: black;">
											<c:forEach var="hour" begin="0" end="23">
												<option value="${hour}">
													<fmt:formatNumber value="${hour}" pattern="00" />:00
												</option>
											</c:forEach>
									</select> <input type="hidden" name="open_hours" id="open_hours" /></td>
								</tr>


								<tr>
									<th>첨부파일</th>
									<td class="td_flex">
										<div class="file_wrap">
											<input type="text" class="file_name" readonly> <input
												type="file" id="upload" class="blind" name="imageFile"
												multiple onchange="handleFileSelect(this)"> <label
												for="upload">파일선택</label>
										</div>
										<p class="file_note">이미지 파일은 10MB 이하 jpg, png, gif, webp
											확장자 파일만 올릴 수 있습니다.</p>
									</td>
								</tr>

								<tr>
									<th>썸네일 이미지</th>
									<td class="td_flex">
										<div class="file_wrap">
											<input type="text" class="thumb_name" readonly> <input
												type="file" id="thumbUpload" class="blind" name="thumbFile"
												onchange="handleThumbSelect(this)"> <label
												for="thumbUpload">썸네일 선택</label>
										</div>
										<p class="file_note">썸네일 이미지 파일은 10MB 이하 jpg, png, gif,
											webp 확장자 파일만 올릴 수 있습니다.</p>
									</td>
								</tr>
							</table>
							<div class="btn_wrap">
								<button type="submit" class="btn board_btn"
									onclick="submitForm()">등록</button>
								<button type="button" class="btn board_btn cancel_btn"
									onclick="checkReset();">다시쓰기</button>
								<button type="button" onclick="location.href='./list.do';"
									class="btn board_btn cancel_btn">목록</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
	</div>
</body>
</html>
