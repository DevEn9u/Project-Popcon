<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
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
	${common_header }
	<main id="mp_container">
        <h1>조직도</h1>
        <section class="my_page">
          <div class="my_list">
            <ul class="depth1">
              <li class="list_title on">
                <a href="/introduction/organization.do">팀 이름</a>
              </li>
            </ul>
            <ul class="depth1">
              <li class="list_title">
                <a href="/introduction/team-member.do">팀원 소개</a>
              </li>
              <ul class="depth2">
                <li><a href="/mypage/myPost.do">강인구</a></li>
                <li><a href="/mypage/myReview.do">박여은</a></li>
                <li><a href="/mypage/myReview.do">민경준</a></li>
                <li><a href="/mypage/myReview.do">육현희</a></li>
              </ul>
            </ul>
          </div>
          <div class="my_info_wrap">
          	<div class="tit_wrap">
	            <h2>Hash Map</h2> 
          	</div>
          	<div class="my_info">
              <div class="my_mile box1" >
                <div class="top" style="display:block;">
                  <strong>팀 명: Hash Map</strong>
                  <p class="teamname_intro">저희의 팀 명 Hash Map 은, <br/>
                  각각 다른 고유값인 Hash 가 모인 Map 처럼 <br/>
                  저희 팀 또한 각각 다른 고유의 개인이 모였다는 의미를 지니고 있습니다.
                  </p>
                </div>
              </div>
            </div>
            
          </div>
        </section>
      </main>
	  <footer id="footer">
	    <div class="inner">
	        ${common_footer}
	    </div>
	  </footer>
</body>
</html>