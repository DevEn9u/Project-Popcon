function validateLogin(form) {
	// 로그인 폼 검증
	if (!form.login_id.value) {
		alert("아이디를 입력하세요.");
		form.login_id.focus();
		return false;
	}
	if (form.login_pw.value == "") {
		alert("패스워드를 입력하세요.");
		form.login_pw.focus();
		return false;
	}
}