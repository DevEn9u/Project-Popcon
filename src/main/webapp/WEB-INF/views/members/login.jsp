<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<title>POPCON | 팝컨 - 로그인</title>
</head>
<link rel="stylesheet" href="/css/member.css">
<script src="/js/login-validate.js?v=<?php echo time(); ?"></script>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<script>
document.addEventListener('DOMContentLoaded', function() {
    let resultMsg = '${resultMsg}';
    if (resultMsg) {
        alert(resultMsg);
    }
});
</script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    let errorMsg = '${errorMsg}';
    if (errorMsg) {
        alert(errorMsg);  // errorMsg가 있을 때 alert을 띄운다.
    }
});
</script>
<body>
  <div id="skip_navi">
    <a href="#container">본문 바로가기</a>
  </div>
  <div id="wrap">
    ${common_header}
    <main id="container" class="login_page sub_container">
      <div class="contents">
        <div class="inner">
          <div class="logo_wrap">
            <h2 class="logo">
              <a href="/"></a>
              <span class="blind">팝콘로고</span>
            </h2>
            <h3>POPCON 로그인하기</h3>
          </div>
          <div class="login_area">
            <form name="loginFrm" action="/loginProc.do" method="post"
            	onsubmit="return validateLogin(this);">
              <fieldset>
                <legend>로그인</legend>
                <div class="row input_wrap1">
                  <input type="text" id="login_id" name="login_id" placeholder="아이디를 입력하세요."
                  	value="${savedId }">
                </div>
                <div class="row input_wrap2">
                  <input type="password" name="login_pw" placeholder="비밀번호를 입력하세요.">
                </div>
                <div class="row3 checkbox_wrap">
                  <input type="checkbox" id="saveCheck" name="saveCheck" class="blind"
                  	${isChecked ? 'checked' : '' }>
                  <label for="saveCheck">아이디 기억하기</label>
                  <input type="checkbox" id="remember-me" name="remember-me" class="blind">
                  <label for="remember-me">로그인 상태 유지</label>
                </div>
                <!-- 로그인 실패시 실패 메세지 띄우기 -->
                <c:if test="${param.error != null }">
                	<p class="login_err_msg">아이디 또는 비밀번호가 잘못되었습니다.</p>
                </c:if>
                <button type="submit" class="login_btn">로그인</button>
              </fieldset>
            </form>
          </div>
          <ul class="link_wrap">
            <li><a href="/register.do">회원가입</a></li>
            <li><a href="/findId.do">ID 찾기</a></li>
            <li><a href="/findPw.do">비밀번호 찾기</a></li>
          </ul>
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