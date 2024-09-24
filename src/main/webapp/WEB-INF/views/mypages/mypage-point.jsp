<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
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
          <h2>포인트 내역</h2>
        </div>
        <section class="my_page">
          <div class="my_list">
            <ul class="depth1">
              <li class="list_title active">
                <a href="mypage_main.html">마이페이지</a>
              </li>
              <ul class="depth2">
                <li><a href="mypage_booking.html">예약 확인</a></li>
                <li class="on">
                  <a href="mypage_point.html">포인트 내역</a>
                </li>
              </ul>
            </ul>
            <ul class="depth1">
              <li class="list_title">
                <a href="mypage_post.html">내가 작성한 글</a>
              </li>
              <ul class="depth2">
                <li><a href="mypage_post.html">내가 작성한 게시글</a></li>
                <li><a href="mypage_review.html">내가 작성한 리뷰</a></li>
              </ul>
            </ul>
            <ul class="depth1">
              <li class="list_title"><a href="mypage_likes.html">팝업</a></li>
              <ul class="depth2">
                <li><a href="mypage_likes.html">좋아요 누른 팝업</a></li>
                <li><a href="mypage_coupon.html">구매한 쿠폰</a></li>
              </ul>
            </ul>
          </div>
          <div class="my_info_wrap">
            <div class="my_info">
              <div class="box3">
                <div class="point_wrap">
                  <div class="point_txt">
                    <p>보유 포인트</p>
                    <strong>12,345</strong>
                  </div>
                  <div class="point_detail">
                    <h2>포인트 상세 내역</h2>
                    <div class="point_block_wrap">
                      <div class="point_block">
                        <div class="left">
                          <span>2024.10.10</span>
                          <p>리뷰작성 포인트 적립</p>
                        </div>
                        +10
                      </div>
                      <div class="point_block">
                        <div class="left">
                          <span>2024.10.10</span>
                          <p>리뷰작성 포인트 적립</p>
                        </div>
                        +10
                      </div>
                      <div class="point_block use">
                        <div class="left">
                          <span>2024.10.10</span>
                          <p>{상호명} {쿠폰명} 구매</p>
                        </div>
                        -10
                      </div>
                      <div class="point_block">
                        <div class="left">
                          <span>2024.10.10</span>
                          <p>리뷰작성 포인트 적립</p>
                        </div>
                        +10
                      </div>
                      <div class="point_block use">
                        <div class="left">
                          <span>2024.10.10</span>
                          <p>{상호명} {쿠폰명} 구매</p>
                        </div>
                        -10
                      </div>
                      <div class="point_block">
                        <div class="left">
                          <span>2024.10.10</span>
                          <p>리뷰작성 포인트 적립</p>
                        </div>
                        +10
                      </div>
                      <div class="point_block use">
                        <div class="left">
                          <span>2024.10.10</span>
                          <p>{상호명} {쿠폰명} 구매</p>
                        </div>
                        -10
                      </div>
                      <div class="point_block">
                        <div class="left">
                          <span>2024.10.10</span>
                          <p>리뷰작성 포인트 적립</p>
                        </div>
                        +10
                      </div>
                      <div class="point_block use">
                        <div class="left">
                          <span>2024.10.10</span>
                          <p>{상호명} {쿠폰명} 구매</p>
                        </div>
                        -10
                      </div>
                      <div class="point_block">
                        <div class="left">
                          <span>2024.10.10</span>
                          <p>리뷰작성 포인트 적립</p>
                        </div>
                        +10
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
	${common_footer }
</body>
</html>