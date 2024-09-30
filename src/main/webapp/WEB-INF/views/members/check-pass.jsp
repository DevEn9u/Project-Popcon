<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<title>POPCON | 팝컨 - 로그인</title>
	<link rel="stylesheet" href="/css/member.css">
	<script src="/js/login-validate.js?v=<?php echo time(); ?"></script>
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<script>
	window.onload = function() {
		const resultMsg = '<%= request.getAttribute("resultMsg") != null ? request.getAttribute("resultMsg") : "" %>';
	    if (resultMsg) {
	      alert(resultMsg);
		}
	};
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
                  <input type="password" name="pass" placeholder="비밀번호를 입력하세요.">
                </div>
                <!-- 로그인 실패시 실패 메세지 띄우기 -->
                <c:if test="${param.error != null }">
                	<p class="login_err_msg">아이디 또는 비밀번호가 잘못되었습니다.</p>
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