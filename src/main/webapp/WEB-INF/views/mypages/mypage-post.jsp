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
          <h2>내가 작성한 글</h2>
        </div>
        <section class="my_page">
          <div class="my_list">
            <ul class="depth1">
              <li class="list_title">
                <a href="mypage_main.html">마이페이지</a>
              </li>
              <ul class="depth2">
                <li><a href="mypage_booking.html">예약 확인</a></li>
                <li><a href="mypage_point.html">포인트 내역</a></li>
              </ul>
            </ul>
            <ul class="depth1">
              <li class="list_title active">
                <a href="mypage_post.html">내가 작성한 글</a>
              </li>
              <ul class="depth2">
                <li class="on">
                  <a href="mypage_post.html">내가 작성한 게시글</a>
                </li>
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
                <div class="post_wrap">
                  <div class="top_txt">
                    <p>최근 내가 작성한 게시글</p>
                  </div>
                  <div class="post_detail">
                    <table class="post_table">
                      <thead>
                        <tr>
                          <th class="tnum">번호</th>
                          <th>제목</th>
                          <th class="bname">게시판</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="tnum">1</td>
                          <td><a href="/">제목입니다123123</a></td>
                          <td class="bname">자유게시판</td>
                        </tr>
                        <tr>
                          <td class="tnum">2</td>
                          <td><a href="/">제목입니다456456</a></td>
                          <td class="bname">자유게시판</td>
                        </tr>
                        <tr>
                          <td class="tnum">3</td>
                          <td><a href="/">제목입니다123455</a></td>
                          <td class="bname">자유게시판</td>
                        </tr>
                        <tr>
                          <td class="tnum">4</td>
                          <td><a href="/">제목입니다3255346</a></td>
                          <td class="bname">자유게시판</td>
                        </tr>
                        <tr>
                          <td class="tnum">5</td>
                          <td><a href="/">제목입니다123124</a></td>
                          <td class="bname">자유게시판</td>
                        </tr>
                        <tr>
                          <td class="tnum">6</td>
                          <td><a href="/">제목입니다123124124</a></td>
                          <td class="bname">자유게시판</td>
                        </tr>
                        <tr>
                          <td class="tnum">7</td>
                          <td><a href="/">제목입니다45645645</a></td>
                          <td class="bname">자유게시판</td>
                        </tr>
                        <tr>
                          <td class="tnum">8</td>
                          <td><a href="/">제목입니다4564234</a></td>
                          <td class="bname">자유게시판</td>
                        </tr>
                        <tr>
                          <td class="tnum">9</td>
                          <td><a href="/">제목입니다2342365</a></td>
                          <td class="bname">자유게시판</td>
                        </tr>
                        <tr>
                          <td class="tnum">10</td>
                          <td><a href="/">제목입니다2345</a></td>
                          <td class="bname">자유게시판</td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="pagenation_wrap">
                      <a href="/" class="next"></a>
                      <div class="page_num">
                        <a href="/" class="on">1</a>
                        <a href="/">2</a>
                        <a href="/">3</a>
                        <a href="/">4</a>
                        <a href="/">5</a>
                      </div>
                      <a href="/" class="prev"></a>
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