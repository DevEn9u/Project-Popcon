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
<script src="/js/form-validate-edit-info.js" ></script>
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
    <main id="container" class="register_page login_page sub_container">
      <div class="contents">
        <div class="inner">
          <div class="logo_wrap">
            <h2 class="logo">
              <a href="/"></a>
              <span class="blind">팝콘로고</span>
            </h2>
          </div>
          <div class="register_wrap">
           	<p>
          		<c:choose>
          			<c:when test="${memberDTO.authority == 'ROLE_NORMAL' }">일반회원</c:when>
          			<c:otherwise>기업회원</c:otherwise>
          		</c:choose>
          	</p>
          	<form name="registerFrm" method="post" action="./edit-info.do" onsubmit="return validateForm(this);">
              <div class="input_wrap">
                <div class="item_id">아이디 :</div>
                <input type="text" name="id" class="input_id" value="${user_id}" readonly="readonly">
              </div>

              <div class="input_wrap">
                <div class="item_name">이름 :</div>
                <input type="text" name="name" class="input_name" value="${memberDTO.name }" readonly="readonly" />
              </div>	
              <div class="input_wrap">
                <div class="item_email">Email :</div>
                <input type="text" name="email" class="input_email" value="${memberDTO.email }">
              </div>
              <div class="input_wrap">
                <div class="item_phone">전화번호 :</div>
                <input type="text" name="phone" class="input_phone" oninput="formatPhoneNumber(this)" placeholder="숫자만 입력해주세요." value="${memberDTO.phone }">
                <c:if test="${memberDTO.authority == 'ROLE_CORP' }">
	                <div class="item_business">사업자번호 :</div>
    	            <input type="text" name="business_number" class="input_business" oninput="formatBusinessNumber(this)" placeholder="숫자만 입력해주세요." value="${memberDTO.business_number }" >
                </c:if>
                <c:if test="${memberDTO.authority != 'ROLE_CORP' }">
	                <input type="hidden" name="business_number" value="" />  
	            </c:if>         
              </div>
              <div class="btn_wrap">
                <button type="submit" class="btn register_btn">수정</button>
                <button type="button" class="btn main_btn" onclick="location.href='/mypage/main.do'">취소</button>
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