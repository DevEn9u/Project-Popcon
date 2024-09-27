function validateForm(form) {
	// 회원가입 폼 내용 검증
	if (!isFieldValid(form.id, "아이디를 입력하세요.") || 
	       !isFieldValid(form.pass, "비밀번호를 입력하세요.") || 
	       !isFieldValid(form.pass2, "비밀번호 확인을 위해 같은 비밀번호를 입력하세요.") || 
	       !isFieldValid(form.name, "이름을 입력하세요.") || 
	       !isFieldValid(form.email, "이메일을 입력하세요.") || 
	       !isFieldValid(form.phone, "전화번호를 입력하세요.")) {
	      	 return false;
	}
	if (form.pass.value !== form.pass2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			resetPasswords(form);
			return false;
	}

	let id = document.querySelector('.input_id').value.trim();
	let password = document.querySelector('.input_pass').value.trim();
	let email = document.querySelector('.input_email').value.trim();
	let phone = document.querySelector('.input_phone').value.trim();
	
	let businessInput = document.querySelector('.input_business');
	let business = businessInput ? businessInput.value.trim() : "";

	// 아이디, 비밀번호, 이메일, 핸드폰번호, 사업자번호 유효성 검사
	if (!isValidId(id)) {
	 	alert("유효하지 않은 아이디입니다.\n특수문자를 제외한 6-12자 이내의 아이디를 입력해주세요.");
		$('.input_id').focus();
      	return false;
  	}
  	if (!isValidPass(password)) {
   	   alert("비밀번호는 8자 이상이어야 하며, 영문자와 숫자를 포함해야 합니다.");
	   $('.input_pass').val("");
	   $('.input_pass2').val("");
	   $('.input_pass').focus();
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
// 비밀번호와 비밀번호 확인의 값이 다를때 비밀번호 입력값 초기화 
function resetPasswords(form) {
    form.pass.value = "";
    form.pass2.value = "";
    form.pass.focus();
}

// 아이디 중복 확인
function idCheck() {
	
	let id = $('.input_id').val().trim();
	console.log(id);
	if (id === '') {
		alert("아이디를 입력하세요.");
		$('.input_id').focus();
		return false;
	}
	
	$.ajax({
		url: '/register/checkId.do',
		type: 'GET',
		data: {
			input_id : id
		},
		success: function(response) {
			if (response.isDuplicated) {
				alert(response.msg);
				$('input[name="idDuplication"]').val("idUnchecked");
				$('.input_id').focus();
			} else {
				alert(response.msg);
				$('input[name="idDuplication"]').val("idChecked");
				$('.input_pass').focus();
			}
		},
        error: function(xhr, status, error) {
            console.error("AJAX 요청 오류: ", error); // 오류 발생 시 확인
        }
	});
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
  let phone = document.registerFrm.businessNumber.value;
  
  let cleanedInput = input.value.replace(/[^\d]/g, '');
  
  cleanedInput = cleanedInput.slice(0, 10);
  
  // 3번째 숫자와 5번째 숫자 뒤에 '-'를 추가하여 '010-12-345678' 구조로 만들기
  let dashInput = '';
  
  for (let i = 0; i < cleanedInput.length; i++) {
    if (i === 3 || i === 5) {
      dashInput += '-';
    }
    dashInput += cleanedInput[i];
  }
  input.value = dashInput;
}

/*********** 회원 가입 버튼 클릭시 유효성 검사 ************/
// 아이디 유효성 검사
function isValidId(id) {
    const regex = /^[a-zA-Z0-9]{6,12}$/; // 6-12자 영문자와 숫자만 허용
    return regex.test(id);
}
// 비밀번호 유효성 검사
function isValidPass(password) {
    const regex = /^(?=.*[0-9])(?=.*[a-zA-Z])(.{8,})$/;
    return regex.test(password);
}
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
function isValidBusiness(businessNumber) {
	// 사업자 번호는 000-11-22222 형태의 10자리
	const regex = /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
	return regex.test(businessNumber);
}
