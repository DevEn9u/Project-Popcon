function validateForm(form) {
	// 회원가입 폼 내용 검증
	if (!isFieldValid(form.name, "이름을 입력하세요.") || 
	       !isFieldValid(form.email, "이메일을 입력하세요.") || 
	       !isFieldValid(form.phone, "전화번호를 입력하세요.")) {
	      	 return false;
	}
	
	if (form.idDuplication.value != "idChecked") {
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	if (form.pass.value !== form.pass2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			resetPasswords(form);
			return false;
	}

	let email = document.querySelector('.input_email').value.trim();
	let phone = document.querySelector('.input_phone').value.trim();
	
	let businessInput = document.querySelector('.input_business');
	let business = businessInput ? businessInput.value.trim() : "";

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