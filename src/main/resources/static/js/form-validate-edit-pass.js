function validateForm(form) {
	// 회원가입 폼 내용 검증
	if (!isFieldValid(form.pass, "비밀번호를 입력하세요.") || 
	       !isFieldValid(form.pass2, "비밀번호 확인을 위해 같은 비밀번호를 입력하세요.")) {
	      	 return false;
	}

	if (form.pass.value !== form.pass2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			resetPasswords(form);
			return false;
	}

	let password = document.querySelector('.input_pass').value.trim();


  	if (!isValidPass(password)) {
   	   alert("비밀번호는 8자 이상이어야 하며, 영문자와 숫자를 포함해야 합니다.");
	   $('.input_pass').val("");
	   $('.input_pass2').val("");
	   $('.input_pass').focus();
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

//정보 수정 버튼 클릭시 유효성 검사
function isValidPass(password) {
    const regex = /^(?=.*[0-9])(?=.*[a-zA-Z])(.{8,})$/;
    return regex.test(password);
}
