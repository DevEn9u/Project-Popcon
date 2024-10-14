<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<title>POPCON | 팝컨 - 로그인</title>
	<link rel="stylesheet" href="/css/member.css">
	<script src="/js/login-validate.js"></script>
</head>
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
            <h3>비밀번호 확인</h3>
          </div>
          <div class="login_area">
            <form name="checkPassFrm" action="/member/checkPass.do" method="post"
            	onsubmit="return validateLogin(this);">
              <fieldset>
                <legend>비밀번호 확인</legend>
                <div class="row input_wrap1">
                  <input type="hidden" id="login_id" name="id" value="${user_id }" readonly="readonly">
                </div>
                <div class="row input_wrap2">
                  <input type="password" name="pass" placeholder="비밀번호를 입력하세요." autocomplete="off">
                </div>
				<c:if test="${not empty resultMsg}">
				    <p class="error_msg">${resultMsg}</p>
				</c:if>
                <button type="submit" class="check_btn login_btn">비밀번호 확인</button>
              </fieldset>
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