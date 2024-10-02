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
            <form name="checkCodeFrm" action="/sendVerificationCode.do" method="POST" id="checkCodeFrm">
              <fieldset>
                <legend>아이디 찾기</legend>
                <div class="row input_wrap1">
                  <input type="text" class="input_name" name="name" id="name" placeholder="이름을 입력하세요." required>
                  <input type="text" class="input_email" name="email" id="email" placeholder="이메일을 입력하세요." required>
                </div>
                <button type="button" class="check_btn login_btn btn" onclick="sendVerificationCode()">인증코드 발송하기</button>
                <div class="emailSentResult"></div>
                <!-- 인증번호 입력 -->
                <div class="row input_wrap2">
<!--                   <input type="hidden" class="sent_code" name="sent_code" value="" /> -->
                  <input type="text" class="input_code" name="input_code" id="input_code" placeholder="인증번호를 입력하세요." required>
                  <div class="checkCodeResult"></div>
                </div>
                <button type="button" class="check_btn login_btn btn" onclick="verifyCode()">인증하기</button>
              </fieldset>
            </form>
            <div id="resultMessage"></div> <!-- 결과 메시지 표시할 영역 -->
          </div>
        </div>
      </div>
    </main>
    <script>
function sendVerificationCode() {
    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;

    fetch('/sendVerificationCode.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ name, email }),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            document.querySelector('.emailSentResult').innerText = "인증 코드가 발송되었습니다.";
        } else {
            document.querySelector('.emailSentResult').innerText = "오류 발생: " + data.message;
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

function verifyCode() {
    const inputCode = document.getElementById("input_code").value;
    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;

    fetch('/verifyCode.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ inputCode, name, email }),
    })
    .then(response => response.json())
    .then(data => {
        if (data.valid) {
            document.getElementById('resultMessage').innerHTML =
            	`인증이 완료되었습니다.<br> 아이디: ` + data.userId;
        } else {
            document.getElementById('resultMessage').innerText = "인증 코드가 일치하지 않습니다.";
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}
</script>
    <footer id="footer">
      <div class="inner">
        ${common_footer}
      </div>
    </footer>
  </div>
</body>
</html>