<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/member.css">
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
              <a href="/main.do"></a>
              <span class="blind">팝콘로고</span>
            </h2>
            <h3>POPCON 로그인하기</h3>
          </div>
          <div class="login_area">
            <form name="loginFrm" method="post" action="./loginProc.do"
            	onsubmit="return validateLogin(this);">
              <fieldset>
                <legend>로그인</legend>
                <div class="row input_wrap1">
                  <input type="text" name="login_id" placeholder="아이디를 입력하세요.">
                </div>
                <div class="row input_wrap2">
                  <input type="password" name="login_pw" placeholder="비밀번호를 입력하세요.">
                </div>
                <div class="row3 checkbox_wrap">
                  <input type="checkbox" id="check1" class="blind">
                  <label for="check1">로그인 상태 유지</label>
                </div>
                <button type="submit" class="login_btn">로그인</button>
              </fieldset>
            </form>
          </div>
          <ul class="link_wrap">
            <li><a href="../register.do">회원가입</a></li>
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