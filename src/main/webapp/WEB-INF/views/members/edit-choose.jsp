<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<title>POPCON | 팝컨 - 정보수정</title>
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/member.css">
<body>
  <div id="skip_navi">
    <a href="#container">본문 바로가기</a>
  </div>
  <div id="wrap">
  	${common_header }
    <main id="container" class="edit_page register_page login_page sub_container">
      <div class="contents">
        <div class="inner">
          <div class="logo_wrap">
            <h2 class="logo">
              <a href="/"></a>
              <span class="blind">팝콘로고</span>
            </h2>
          </div>
          <div class="choose_wrap">
            <p>수정할 정보를 선택하세요.</p>
            <ul class="choose_type">
            	<c:if test="${memberDTO.authority == 'ROLE_NORMAL' }">
	              <li><a href="./edit-normal-info.do">가입 정보 변경</a></li>
    	          <li><a href="./edit-normal-pass.do">비밀번호 변경</a></li>
            	</c:if>
            	<c:if test="${memberDTO.authority == 'ROLE_CORP' }">
              		<li><a href="./edit-corp-info.do">가입 정보 변경</a></li>
              		<li><a href="./edit-corp-pass.do">비밀번호 변경</a></li>
              	</c:if>
            </ul>
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