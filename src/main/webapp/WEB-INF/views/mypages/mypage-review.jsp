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
          <h2>내가 작성한 리뷰</h2>
        </div>
        <section class="my_page">
          <div class="my_list">
            <ul class="depth1">
              <li class="list_title">
                <a href="/mypage/mypage.do">마이페이지</a>
              </li>
              <ul class="depth2">
                <li><a href="/mypage/myBooking.do">예약 확인</a></li>
                <li><a href="/mypage/myPoint.do">포인트 내역</a></li>
              </ul>
            </ul>
            <ul class="depth1">
              <li class="list_title active">
                <a href="/mypage/myPost.do">내가 작성한 글</a>
              </li>
              <ul class="depth2">
                <li>
                  <a href="/mypage/myPost.do">내가 작성한 게시글</a>
                </li>
                <li class="on">
                  <a href="/mypage/myReview.do">내가 작성한 리뷰</a>
                </li>
              </ul>
            </ul>
            <ul class="depth1">
              <li class="list_title"><a href="/mypage/likes.do">팝업</a></li>
              <ul class="depth2">
                <li><a href="/mypage/likes.do">좋아요 누른 팝업</a></li>
                <li><a href="/mypage/myCoupon.do">구매한 쿠폰</a></li>
              </ul>
            </ul>
          </div>
          <div class="my_info_wrap">
            <div class="my_info my_review">
              <div class="box3">
                <div class="review_wrap">
                  <div class="top_txt">
                    <p>최근 내가 작성한 REVIEW</p>
                  </div>
                  <div class="review_contents_wrap">
                    <div class="review_block_wrap">
                      <div class="popup_txt">
                        <span class="pop_icon"></span>
                        <div class="info_wrap">
                          <strong
                            >팝업명-한줄넘어가면 말줄임한줄넘어가면
                            말줄임</strong
                          >
                          <div class="dayman_wrap">방문 날짜</div>
                        </div>
                      </div>
                      <div class="review_block">
                        <a href="/">
                          <span class="img"></span>
                          <p>
                            리뷰 내용입니다. 사진을 메인으로 보이고 아래에
                            리뷰에 작성한 내용을 블라블라 적어주세요 3줄이
                            넘어갈 경우에는 말줄임 표시리뷰 내용입니다. 사진을
                            메인으로 보이고 아래에 리뷰에 작성한 내용을 블라블라
                            적어주세요 3줄이 넘어갈 경우에는 말줄임 표시
                          </p>
                        </a>
                        <span>작성일 : 2024.10.10</span>
                      </div>
                    </div>
                    <div class="review_block_wrap">
                      <div class="popup_txt">
                        <span class="pop_icon"></span>
                        <div class="info_wrap">
                          <strong
                            >팝업명-한줄넘어가면 말줄임한줄넘어가면
                            말줄임</strong
                          >
                          <div class="dayman_wrap">방문 날짜</div>
                        </div>
                      </div>
                      <div class="review_block">
                        <a href="/">
                          <span class="img"></span>
                          <p>
                            리뷰 내용입니다. 사진을 메인으로 보이고 아래에
                            리뷰에 작성한 내용을 블라블라 적어주세요 3줄이
                            넘어갈 경우에는 말줄임 표시리뷰 내용입니다. 사진을
                            메인으로 보이고 아래에 리뷰에 작성한 내용을 블라블라
                            적어주세요 3줄이 넘어갈 경우에는 말줄임 표시
                          </p>
                        </a>
                        <span>작성일 : 2024.10.10</span>
                      </div>
                    </div>
                    <div class="review_block_wrap">
                      <div class="popup_txt">
                        <span class="pop_icon"></span>
                        <div class="info_wrap">
                          <strong
                            >팝업명-한줄넘어가면 말줄임한줄넘어가면
                            말줄임</strong
                          >
                          <div class="dayman_wrap">방문 날짜</div>
                        </div>
                      </div>
                      <div class="review_block">
                        <a href="/">
                          <span class="img"></span>
                          <p>
                            리뷰 내용입니다. 사진을 메인으로 보이고 아래에
                            리뷰에 작성한 내용을 블라블라 적어주세요 3줄이
                            넘어갈 경우에는 말줄임 표시리뷰 내용입니다. 사진을
                            메인으로 보이고 아래에 리뷰에 작성한 내용을 블라블라
                            적어주세요 3줄이 넘어갈 경우에는 말줄임 표시
                          </p>
                        </a>
                        <span>작성일 : 2024.10.10</span>
                      </div>
                    </div>
                    <div class="review_block_wrap">
                      <div class="popup_txt">
                        <span class="pop_icon"></span>
                        <div class="info_wrap">
                          <strong
                            >팝업명-한줄넘어가면 말줄임한줄넘어가면
                            말줄임</strong
                          >
                          <div class="dayman_wrap">방문 날짜</div>
                        </div>
                      </div>
                      <div class="review_block">
                        <a href="/">
                          <span class="img"></span>
                          <p>
                            리뷰 내용입니다. 사진을 메인으로 보이고 아래에
                            리뷰에 작성한 내용을 블라블라 적어주세요 3줄이
                            넘어갈 경우에는 말줄임 표시리뷰 내용입니다. 사진을
                            메인으로 보이고 아래에 리뷰에 작성한 내용을 블라블라
                            적어주세요 3줄이 넘어갈 경우에는 말줄임 표시
                          </p>
                        </a>
                        <span>작성일 : 2024.10.10</span>
                      </div>
                    </div>
                    <div class="review_block_wrap">
                      <div class="popup_txt">
                        <span class="pop_icon"></span>
                        <div class="info_wrap">
                          <strong
                            >팝업명-한줄넘어가면 말줄임한줄넘어가면
                            말줄임</strong
                          >
                          <div class="dayman_wrap">방문 날짜</div>
                        </div>
                      </div>
                      <div class="review_block">
                        <a href="/">
                          <span class="img"></span>
                          <p>
                            리뷰 내용입니다. 사진을 메인으로 보이고 아래에
                            리뷰에 작성한 내용을 블라블라 적어주세요 3줄이
                            넘어갈 경우에는 말줄임 표시리뷰 내용입니다. 사진을
                            메인으로 보이고 아래에 리뷰에 작성한 내용을 블라블라
                            적어주세요 3줄이 넘어갈 경우에는 말줄임 표시
                          </p>
                        </a>
                        <span>작성일 : 2024.10.10</span>
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