<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
	<link rel="stylesheet" href="/css/popup_list.css?v=<?php echo time(); ?>">
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
	${common_header }
	<main id="mp_container">
        <h1>관리자 페이지</h1>
        <section class="my_page">
          <div class="my_list">
            <ul class="depth1">
              <li class="list_title on">
                <a href="/adpage/main.do" style="color: var(--txt-color-600)">게시물 관리</a>
              </li>
              <ul class="depth2">
                <li><a href="/adpage/popup.do" style="color: var(--point-color1);">팝업 게시판</a></li>
                <li><a href="/adpage/free.do">자유 게시판</a></li>
              </ul>
            </ul>
          </div>
        <div class="pl_main ad_pl_main">
            
            <nav class="kategorie_wrap">
                <ul class="pl_kategorie">
                    <p class="keyword">키워드</p>
                    <li class="digital_btn"><a href="./list.do">전체보기</a></li>
                    <li class="char_btn"><a href="./list.do?category=캐릭터">캐릭터</a></li>
                    <li class="fassion_btn"><a href="./list.do?category=패션/뷰티">패션/뷰티</a></li>
                    <li><a href="./list.do?category=식품">식품</a></li>
                    <li class="health_btn"><a href="./list.do?category=헬스/스포츠">헬스/스포츠</a></li>
                    <li><a href="./list.do?category=게임">게임</a></li>
                    <li><a href="./list.do?category=공공">공공</a></li>
                    <li><a href="./list.do?category=전시">전시</a></li>
                    <li class="digital_btn"><a href="./list.do?category=가전/디지털">가전/디지털</a></li>
                    <li class="char_btn"><a href="./list.do?category=아이돌">아이돌</a></li>
                </ul>
            </nav>

             <ul class="popup_wrap">
    <c:forEach var="popup" items="${popupList}">
    <li class="popup_banner">
        <a href="/popupBoard/view/${popup.board_idx}">
            <img src="${popup.thumb}" alt="Thumbnail" class="popup_thumbnail"/>
            <div class="txt_title">
<h2>
    ${popup.board_title}
    <form id="deleteForm_${popup.board_idx}" action="/adpage/delete.do" method="post">
        <input type="hidden" name="board_idx" value="${popup.board_idx}" />
        <button class="pv_delete_btn" type="button"
            onclick="event.stopPropagation(); event.preventDefault(); if(confirm('정말 삭제하시겠습니까?')) { document.getElementById('deleteForm_${popup.board_idx}').submit(); }">
            삭제하기
        </button>
    </form>    
</h2>

                <div class="popup_location">
                    <img src="../images/imgMGJ/pin.svg" />
                    <span class="location_span">${popup.popup_addr}</span>
                </div>
                <span class="popup_date">${popup.postdate}</span>
            </div>
        </a>
    </li>
</c:forEach>


</ul>

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