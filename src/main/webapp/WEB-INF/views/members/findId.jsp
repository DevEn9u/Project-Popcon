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
            <form name="checkCodeFrm" action="/sendCode.do" method="POST" id="checkCodeFrm">
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
                  <input type="hidden" class="sent_code" name="sent_code" value="" />
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
    <footer id="footer">
      <div class="inner">
        ${common_footer}
      </div>
    </footer>
  </div>
</body>
</html>