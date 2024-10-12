<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<header id="header">

<script>
  //태그 검색 기능
  function performSearch() {
    var searchKeyword = document.getElementById("searchInput").value;
    if (searchKeyword.trim() !== "") {
      var searchUrl = "/popupBoard/list.do?category=" + encodeURIComponent(searchKeyword);
      window.location.href = searchUrl;
    } else {
      alert("검색어를 입력해주세요.");
    }
  }
  //검색어 입력 필드에서 엔터 키 감지
  window.onload = function() {
	    var searchButton = document.querySelector(".search_btn");
	    searchButton.addEventListener("click", performSearch);
	    var searchInput = document.getElementById("searchInput");
	    searchInput.addEventListener("keyup", function(event) {
	      if (event.key === "Enter") {
	        performSearch();
	      }
	    });
	  }
</script>
  <div class="inner">
    <h1 class="logo">
      <a href="/">
        <img src="/images/logo.png" alt="팝콘 로고">
      </a>
    </h1>
    <nav class="gnb_wrap">
      <ul class="gnb">
        <li class="depth1">
          <a href="#">팝콘 소식</a>	
          <ul class="depth2">
            <li>
              <a href="#">플랫폼 소개</a>
              <a href="/introduction/organization.do">조직도</a>
              <a href="/introduction/location.do">오시는 길</a>
            </li>
          </ul>
        </li>
        <li class="depth1">
          <a href="/popupBoard/list.do">팝업 안내</a>
          <ul class="depth2">
            <li>
              <a href="/popupBoard/list.do">전체 팝업</a>
              <a href="#">담당자 PICK</a>
              <a href="#">이번달 인기</a>
              <a href="#">오늘의 팝업</a>
            </li>
          </ul>
        </li>
        <li class="depth1">
          <a href="/noticeBoard/list.do">공지사항</a>
        </li>
        <li class="depth1">
          <a href="/freeBoard/list.do">커뮤니티</a>
          <ul class="depth2">
            <li>
              <a href="/freeBoard/list.do">자유 게시판</a>
              <a href="#">POINT SHOP</a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <div class="search">
      <input type="text" id="searchInput" placeholder="키워드를 입력해주세요" />
      <button type="button" class="search_btn" onclick="performSearch()">
        <span class="blind">검색버튼</span>
      </button>
    </div>
    <c:if test="${empty user_id }">
		<div class="login_wrap">
	      <div class="login">
	        <button type="button" class="login_btn" onclick="location.href='/login.do'">
	          <span class="blind">로그인</span>
	        </button>
    	</div>
    </c:if>
    <c:if test="${not empty user_id}">
      <div class="logout">
        <button type="button" class="logout_btn" onclick="location.href='/logout.do'">로그아웃</button>
        <a class="mypage" href="/mypage/mypage.do">마이페이지</a>
      </div>
    </c:if>
    </div>
  </div>
</header>