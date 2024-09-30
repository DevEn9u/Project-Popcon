function validateForm(form) {
	// 변수 초기화
	let email = form.email.value.trim();
	let phone = form.phone.value.trim();
	
	let business = form.business_number ? form.business_number.value.trim() : "";

		// 회원가입 폼 내용 검증
	if (!isFieldValid(form.email, "이메일을 입력하세요.") ||
			!isFieldValid(form.phone, "전화번호를 입력하세요.") ||
			(business && !isFieldValid(form.business_number, "사업자번호를 입력하세요."))) {
	      	 return false;
	}


  	if (!isValidEmail(email)) {
      alert("유효하지 않은 이메일 주소입니다.");
	  $('.input_email').focus();
      return false;
  	}
  	if (!isValidPhone(phone)) {
      alert("휴대폰 번호 11자리를 입력해주세요.\n예시]010-1234-5678");
	  $('.input_phone').val("");
	  $('.input_phone').focus();
      return false;
  	}
		
  	if (business && !isValidBusiness(business)) {
      alert("사업자 번호 10자리를 입력해주세요.\n예시]111-12-56789");
	  $('.input_business').focus();
      return false;
  	}
	return true;
}

// 폼값 미입력시 알림 
function isFieldValid(field, errorMsg) {
    if (field.value.trim() === "") {
        alert(errorMsg);
        field.focus();
        return false;
    }
    return true;
}

// 가입시 핸드폰 번호 포맷
function formatPhoneNumber(input) {
  let phone = document.registerFrm.phone.value;
  
  let cleanedInput = input.value.replace(/[^\d]/g, '');
  
  cleanedInput = cleanedInput.slice(0, 11);
  
  // 3번째 숫자와 7번째 숫자 뒤에 '-'를 추가하여 '010-1234-5678' 구조로 만들기
  let dashInput = '';
  
  for (let i = 0; i < cleanedInput.length; i++) {
    if (i === 3 || i === 7) {
      dashInput += '-';
    }
    dashInput += cleanedInput[i];
  }
  input.value = dashInput;
}

// 가입시 사업자 번호 포맷
function formatBusinessNumber(input) {
  let cleanedInput = input.value.replace(/[^\d]/g, '');
  
  cleanedInput = cleanedInput.slice(0, 10);
  
  // 3번째 숫자와 5번째 숫자 뒤에 '-'를 추가하여 '010-12-34567' 구조로 만들기
  let dashInput = '';
  
  for (let i = 0; i < cleanedInput.length; i++) {
    if (i === 3 || i === 5) {
      dashInput += '-';
    }
    dashInput += cleanedInput[i];
  }
  input.value = dashInput;
}

/*********** 정보 수정 버튼 클릭시 유효성 검사 ************/
// 이메일 유효성 검사
function isValidEmail(email) {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
}
// 핸드폰번호 유효성 검사
function isValidPhone(phone) {
	// 휴대폰 번호는 010으로 시작한 11자리여야 한다.
	const regex = /^010-[0-9]{4}-[0-9]{4}$/;
	return regex.test(phone);
}
// 사업자번호 유효성 검사
function isValidBusiness(business_number) {
	// 사업자 번호는 000-11-22222 형태의 10자리
	const regex = /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
	return regex.test(business_number);
}