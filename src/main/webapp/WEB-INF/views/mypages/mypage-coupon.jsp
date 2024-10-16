<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<c:import url="../include/header.jsp" var="common_header" />
	<c:import url="../include/mypage-list.jsp" var="mypage_list" />
	<c:import url="../include/footer.jsp" var="common_footer" />
	<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
</head>
<body>
<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
	${common_header }
	      <main id="mp_container">
        <div class="title_wrap">
          <h1>마이페이지</h1>
          <span></span>
          <h2>보유 쿠폰</h2>
        </div>
        <section class="my_page">
          ${mypage_list }
          <div class="my_info_wrap">
            <div class="my_info">
              <div class="box3">
                <div class="coupon_wrap">
                  <div class="top_txt">
                    <p>좋아요 누른 팝업</p>
                  </div>
                  <div class="post_detail">
                    <p>최신순<span></span><strong>마감순</strong></p>
                    <div class="likes_list coupon">
                      <div class="likes_block">
                        <a href="/">
                          <span></span>
                          <p>쿠폰명</p>
                        </a>
                        <p class="d_day">남은 유효 기간<em>D-30</em></p>
                      </div>
                      <div class="likes_block">
                        <a href="/">
                          <span></span>
                          <p>쿠폰명</p>
                        </a>
                        <p class="d_day">남은 유효 기간<em>D-30</em></p>
                      </div>
                      <div class="likes_block">
                        <a href="/">
                          <span></span>
                          <p>쿠폰명</p>
                        </a>
                        <p class="d_day">남은 유효 기간<em>D-30</em></p>
                      </div>
                      <div class="likes_block">
                        <a href="/">
                          <span></span>
                          <p>쿠폰명</p>
                        </a>
                        <p class="d_day">남은 유효 기간<em>D-30</em></p>
                      </div>
                      <div class="likes_block">
                        <a href="/">
                          <span></span>
                          <p>쿠폰명</p>
                        </a>
                        <p class="d_day">남은 유효 기간<em>D-30</em></p>
                      </div>
                      <div class="likes_block">
                        <a href="/">
                          <span></span>
                          <p>쿠폰명</p>
                        </a>
                        <p class="d_day">남은 유효 기간<em>D-30</em></p>
                      </div>
                      <div class="likes_block">
                        <a href="/">
                          <span></span>
                          <p>쿠폰명</p>
                        </a>
                        <p class="d_day">남은 유효 기간<em>D-30</em></p>
                      </div>
                      <div class="likes_block">
                        <a href="/">
                          <span></span>
                          <p>쿠폰명</p>
                        </a>
                        <p class="d_day">남은 유효 기간<em>D-30</em></p>
                      </div>
                    </div>
                  </div>
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