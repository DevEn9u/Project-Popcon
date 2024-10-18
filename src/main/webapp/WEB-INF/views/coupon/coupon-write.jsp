<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<c:import url="../include/header.jsp" var="common_header" />
	<c:import url="../include/footer.jsp" var="common_footer" />
	<link rel="stylesheet" href="/css/board.css">
	<script src="../js/file-upload.js"></script>
</head>

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

		if (!title.value.trim()) {
			alert("쿠폰 이름을 입력해 주세요.");
			title.focus();
			return false;
		}
		if (!contents.value.trim()) {
			alert("간략한 설명을 입력해 주세요.");
			contents.focus();
			return false;
		}
		if (!popupFee.value.trim()) {
			alert("가격(포인트)를 입력해 주세요.");
			popupFee.focus();
			return false;
		}
		if (!/^\d+$/.test(popupFee.value.trim())) {
			alert("가격은 숫자만 입력해 주세요.");
			popupFee.focus();
			return false;
		}
		if (!thumbnailFile.files.length) {
			alert("쿠폰 이미지를 업로드 해주세요.");
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

	function handleThumbSelect(input) {
		const files = input.files;
		const fileNames = [];
		const allowedTypes = [ 'image/jpeg', 'image/png', 'image/gif',
				'image/webp' ];
		const maxSize = 10 * 1024 * 1024; // 10MB

		for (let i = 0; i < files.length; i++) {
			const file = files[i];
			if (!allowedTypes.includes(file.type)) {
				alert('허용되지 않은 이미지 파일 형식입니다: ' + file.name);
				input.value = '';
				document.querySelector(".thumb_name").value = ''; // Clear the file name display
				return;
			}
			if (file.size > maxSize) {
				alert('이미지 파일 크기는 10MB 이하이어야 합니다: ' + file.name);
				input.value = '';
				document.querySelector(".thumb_name").value = ''; // Clear the file name display
				return;
			}
			fileNames.push(file.name);
		}

		document.querySelector(".thumb_name").value = fileNames.join(', ');
	}
	// 에러메세지 있을시 alert
	document.addEventListener('DOMContentLoaded', function() {
	    let resultMsg = '${resultMsg}';
	    if (resultMsg) {
	        alert(resultMsg);
	    }
	});
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
					<h2>CUPON SHOP - 쿠폰 등록</h2>
				</div>
			</div>
			<div class="contents">
				<div class="inner">
					<h3>쿠폰 등록</h3>
					<div class="board_write">
						<form name="writeFrm" method="post" enctype="multipart/form-data"
							action="/coupon/write.do"
							onsubmit="return validateForm(this)">
							<table>
								<caption class="nohead">쿠폰 등록</caption>
								<tr>
									<th>쿠폰 이름</th>
									<td><input type="text" name="coupon_name"
										placeholder="쿠폰 이름을 입력해주세요"></td>
								</tr>
								<tr>
									<th>간략한 설명</th>
									<td><textarea cols="30" rows="20" name="coupon_description"
											placeholder="간략한 설명을 입력해 주세요."></textarea></td>
								</tr>
								<tr>
									<th>가격</th>
									<td><input type="number" name="points"
										placeholder="숫자만 입력해 주세요"></td>
								</tr>
								<tr>
									<th>쿠폰 이미지</th>
									<td class="td_flex">
										<div class="file_wrap">
											<input type="text" class="thumb_name" readonly> <input
												type="file" id="thumbUpload" class="blind" name="imageFile"
												onchange="handleThumbSelect(this)"> <label
												for="thumbUpload">이미지 선택</label>
										</div>
										<p class="file_note">쿠폰 이미지 파일은 10MB 이하 jpg, png, gif,
											webp 확장자 파일만 올릴 수 있습니다.</p>
									</td>
								</tr>
							</table>
							<div class="btn_wrap">
								<button type="submit" class="btn board_btn">등록</button>
								<button type="button" class="btn board_btn cancel_btn"
									onclick="checkReset();">다시쓰기</button>
								<button type="button" onclick="location.href='./main.do';"
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
