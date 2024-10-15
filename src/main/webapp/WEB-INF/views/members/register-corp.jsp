<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<link rel="stylesheet" href="/css/member.css">
	<script src="/js/form-validate.js"></script>
	<title>POPCON | 팝컨 - 회원가입</title>
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />

<body>
 
<script>
	//이름 입력 시 20자까지만 허용
		function validateForm(form) {
			// 이름 입력값 검증
			const nameInput = form.name.value;
			if (nameInput.length > 20) {
				alert("상호명은 20자까지 입력 가능합니다.");
				form.name.focus();
				return false;
			}
			return true;
		}
	</script>
  <div id="skip_navi">
    <a href="#container">본문 바로가기</a>
  </div>
  <div id="wrap">
  	${common_header}
    <main id="container" class="register_page login_page sub_container">
      <div class="contents">
        <div class="inner">
          <div class="logo_wrap">
            <h2 class="logo">
              <a href="/"></a>
              <span class="blind">팝콘로고</span>
            </h2>
          </div>
          <!-- 회원가입 폼 -->
          <div class="register_wrap">
          	<form name="registerFrm" method="post" action="./corp.do" onsubmit="return validateForm(this);">
              <div class="input_wrap">
                <div class="item_id">아이디 :</div>
                <input type="text" name="id" class="input_id" placeholder="6-12자 이내의 아이디를 입력해주세요." autofocus="autofocus">
                <button type="button" class="check_btn" onclick="idCheck()">아이디 중복 확인</button>
                <input type="hidden" name="idDuplication" value="idUnchecked" />
              </div>
              <div class="input_wrap">
                <div class="item_pass">비밀번호 :</div>
                <input type="password" name="pass" class="input_pass" placeholder="8자 이상의 비밀번호를 입력해주세요." autocomplete="off">
                <div class="item_pass2">비밀번호 확인 :</div>
                <input type="password" name="pass2" class="input_pass2" placeholder="비밀번호 확인을 위해 같은 비밀번호를 입력해주세요." autocomplete="off">
              </div>
              <div class="input_wrap">
                <div class="item_com_name">회사명 :</div>
                <input type="text" name="name" class="input_com_name" />
              </div>
              <div class="input_wrap">
                <div class="item_email">Email :</div>
                <input type="text" name="email" class="input_email">
              </div>
              <div class="input_wrap">
                <div class="item_phone">전화번호 :</div>
                <input type="text" name="phone" class="input_phone" oninput="formatPhoneNumber(this)" placeholder="숫자만 입력해주세요." >
                <div class="item_business">사업자번호 :</div>
                <input type="text" name="business_number" class="input_business" oninput="formatBusinessNumber(this)" placeholder="숫자만 입력해주세요." >
              </div>
              <div class="btn_wrap">
                <button type="submit" class="btn register_btn">회원가입</button>
                <button type="button" class="btn main_btn" onclick="location.href='../login.do'">취소</button>
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