<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<header id="header">
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
              <a href="#">조직도</a>
              <a href="#">오시는 길</a>
            </li>
          </ul>
        </li>
        <li class="depth1">
          <a href="#">팝업 안내</a>
          <ul class="depth2">
            <li>
              <a href="#">전체 팝업</a>
              <a href="#">담당자 PICK</a>
              <a href="#">이번달 인기</a>
              <a href="#">오늘의 팝업</a>
            </li>
          </ul>
        </li>
        <li class="depth1">
          <a href="/board/notice-board-list.do">공지사항</a>
        </li>
        <li class="depth1">
          <a href="/board/free-board-list.do">커뮤니티</a>
          <ul class="depth2">
            <li>
              <a href="/board/free-board-list.do">자유 게시판</a>
              <a href="#">POINT SHOP</a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <div class="search">
      <input type="text" placeholder="검색어를 입력하세요" />
      <button type="button" class="search_btn">
        <span class="blind">검색버튼</span>
      </button>
    </div>
    <div class="login_wrap">
      <div class="login">
        <button type="button" class="login_btn" onclick="location.href='/login.do'">
          <span class="blind">로그인</span>
        </button>
      </div>
      <div class="logout">
        <button type="button" class="logout_btn">로그아웃</button>
        <a class="mypage" href="#">마이페이지</a>
      </div>
    </div>
  </div>
</header>