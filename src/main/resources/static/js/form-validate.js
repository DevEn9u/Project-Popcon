function validateForm(form) {
	// 회원가입 폼 내용 검증
  if (form.id.value == "") {
	alert("아이디를 입력하세요.");
    form.id.focus();
    return false;
  }
  if (form.idDuplication.value != "idChecked") {
  	alert("아이디 중복체크를 해주세요.");
  	return false;
  }
  if (form.pass.value == "") {
    alert("비밀번호를 입력하세요.");
    form.pass.focus();
    return false;
  }
  if (form.pass2.value == "") {
    alert("비밀번호 확인을 위해 같은 비밀번호를 입력하세요.");
    form.pass2.focus();
    return false;
  }
  if (form.pass.value != form.pass2.value) {
    alert("비밀번호가 일치하지 않습니다.")
    form.pass.value = "";
    form.pass2.value = "";
    form.pass.focus();
    return false;
  }
  if (form.name.value == "") {
    alert("이름을 입력하세요.");
    form.name.focus();
    return false;
  }
  if (form.email.value == "") {
    alert("이메일을 입력하세요.");
    form.email.focus();
    return false;
  }
  if (form.phone.value == "") {
    alert("전화번호를 입력하세요.");
    form.phone.focus();
    return false;
  }
return true;
}

// 아이디 중복 확인
//function idCheck() {
//  let id = document.registerFrm.id.value;
//  if (id == '') {
//    alert("아이디를 입력하세요.");
//    document.registerFrm.id.focus();
//    return false;
//  }
//  else {
////  window.name = "parentForm";
////  window.open("../html/IdCheckForm.jsp?id=" + id,
////  window.open("./checkId.do",
////      "chkForm", "width=500, height=300, resizable = no, scrollbars = no" );
//	alert("사용 가능한 아이디입니다.");
//	registerFrm.idDuplication.value = "idChecked";
//	
//  }
//}

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