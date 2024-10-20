<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="my_list">
    <ul class="depth1">
        <li class="list_title">
        	<a href="/mypage/main.do">마이페이지</a>
	        <ul class="depth2">
    	        <li data-page="myBooking"><a href="/mypage/myBooking.do">예약 확인</a></li>
        	    <li data-page="myPoint"><a href="/mypage/myPoint.do">포인트</a></li>
        	</ul>
        </li>
    </ul>
    <ul class="depth1">
        <li class="list_title">
        	<a href="/mypage/myPost.do">작성 게시물</a>
	        <ul class="depth2">
	            <li data-page="myPost"><a href="/mypage/myPost.do">내가 작성한 글</a></li>
	            <li data-page="myReview"><a href="/mypage/myReview.do">리뷰</a></li>
	        </ul>
        </li>
    </ul>
    <ul class="depth1">
        <li class="list_title">
        	<a href="/mypage/likes.do">팝업</a>
	        <ul class="depth2">
	            <li data-page="likes"><a href="/mypage/likes.do">관심 팝업</a></li>
	            <li data-page="myCoupon"><a href="/mypage/myCoupon.do">쿠폰</a></li>
	        </ul>
        </li>
    </ul>
</div>