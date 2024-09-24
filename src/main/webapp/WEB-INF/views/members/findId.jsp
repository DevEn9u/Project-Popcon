<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
  <body>
    <div id="wrap">
	${common_header}
      <main id="sub_container">
        <div class="find">
          <div class="logo">
            <h2>
              <a href="main.html">
              <img src="/images/logo.png">
              </a>
            </h2>
          </div>
          <div class="contents">
            <p class="title">아이디 찾기</p>
            <p class="txt">회원가입시 설정한 이메일을 입력해주세요.</p>
            <fieldset class="row1">
              <strong class="item">이메일</strong>
              <div class="input_email">
                <input type="email" class="email" name="email" placeholder="이메일을 입력하세요" />
              </div>
            </fieldset>
            <fieldset class="row2">
              <strong class="item">인증번호</strong>
              <div class="input_num">
                <input type="text" class="check_num" name="check_num" placeholder="이메일로 전송된 인증번호를 입력하세요" />
                <button type="button" class="num_btn">인증하기</button>
              </div>
            </fieldset>
            <div class="btn_wrap">
              <button class="send_btn">아이디 찾기</button>
            </div>
            <ul class="link_wrap">
              <li><a href="#">비밀번호 찾기</a></li>
              <li><a href="#">회원 가입</a></li>
              <li><a href="#">로그인</a></li>
            </ul>
          </div>
        </div>
      </main>
      ${common_footer } 
    </div>
  </body>
</html>
