<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <c:import url="../include/head.jsp" />
  <link rel="stylesheet" href="/css/member.css">
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />

<body>
  <div id="skip_navi">
    <a href="#container">본문 바로가기</a>
  </div>
  <div id="wrap">
    ${common_header}
    <main id="container" class="find_page login_page sub_container">
      <div class="contents">
        <div class="inner">
          <div class="logo_wrap">
            <h2 class="logo">
              <a href="/"></a>
              <span class="blind">팝콘로고</span>
            </h2>
            <h3>POPCON 아이디 찾기</h3>
          </div>
          <div class="find_area login_area">
            <form name="checkCodeFrm" id="checkCodeFrm">
              <fieldset>
                <legend>아이디 찾기</legend>
                <div class="row input_wrap1">
                  <input type="text" class="input_email" name="email" id="email" placeholder="이메일을 입력하세요." required>
                </div>
                <button type="button" class="check_btn login_btn btn" onclick="sendVerificationCode()">인증코드 발송하기</button>
                <div class="row input_wrap2">
                  <input type="text" class="check_num" name="check_num" id="check_num" placeholder="인증번호를 입력하세요." required>
                </div>
                <button type="button" class="check_btn login_btn btn" onclick="verifyCode()">인증하기</button>
              </fieldset>
            </form>
            <div id="resultMessage"></div> <!-- 결과 메시지 표시할 영역 -->
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

  <script>
  	function sendVerificationCode() {
  		const email = document.getElementById('email').value;
		fetch('/findId.do', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ email: email }),
		})
		.then(response => response.text())
		.then(data => {
			alert(data); // 서버 응답 메시지 표시
		})
		.catch(error => console.error('Error:', error));
  	}

  	function verifyCode() {
  		const email = document.getElementById('email').value;
  		const checkNum = document.getElementById('check_num').value;
		fetch('/verify-code.do', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ email: email, code: checkNum }),
		})
		.then(response => response.text())
		.then(data => {
			document.getElementById('resultMessage').innerText = data; // 결과 메시지 표시
		})
		.catch(error => console.error('Error:', error));
  	}
  </script>
</body>
</html>