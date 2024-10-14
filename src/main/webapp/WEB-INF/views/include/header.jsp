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
<script>
//앵커 링크 클릭 시 중앙으로 스크롤 이동
document.addEventListener('DOMContentLoaded', function() {
  const links = document.querySelectorAll('a[href^="../#"]');

  links.forEach(link => {
    link.addEventListener('click', function(event) {
      event.preventDefault(); // 기본 링크 동작 방지
      const sectionId = this.getAttribute('href').split('#')[1]; // ID 추출

      if (sectionId) {
        // 홈 페이지 URL 구성 
        const homeUrl = "../#" + sectionId; 

        // 홈 페이지로 이동
        window.location.href = homeUrl; 

        // 페이지가 로드된 후 섹션 중앙으로 스크롤 이동
        window.setTimeout(function() {
          const section = document.getElementById(sectionId);
          if (section) {
            const sectionTop = section.getBoundingClientRect().top + window.scrollY; // 섹션의 실제 위치
            const sectionHeight = section.clientHeight; // 섹션의 높이
            const windowHeight = window.innerHeight; // 창의 높이

            // 중앙으로 오도록 오프셋 계산
            const offset = sectionTop - (windowHeight / 2) + (sectionHeight / 2);
            window.scrollTo({ top: offset, behavior: 'auto' }); // 부드러운 스크롤을 사용하지 않음
          }
        }, 0); // 페이지가 바로 로드된 후 스크롤 이동
      }
    });
  });
});
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
          <a href="/introduction/poopcon.do">팝콘 소식</a>	
          <ul class="depth2">
            <li>
              <a href="/introduction/poopcon.do">플랫폼 소개</a>
              <a href="/introduction/organization.do">조직도</a>
              <a href="/introduction/location.do">오시는 길</a>
            </li>
          </ul>
        </li>
        <li class="depth1">
          <a href="/popupBoard/list.do">팝업 컨테이너</a>
          <ul class="depth2">
            <li>
              <a href="/popupBoard/list.do">전체 팝업</a>
			  <a href="../#pick_slider">담당자 PICK</a>
              <a href="../#popular_slider">이번달 인기</a>
              <a href="../#day_slider">오늘의 팝업</a>
        </li>
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