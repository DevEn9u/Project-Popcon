<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<c:import url="../include/header.jsp" var="common_header" />
	<c:import url="../include/mypage-list.jsp" var="mypage_list" />
	<c:import url="../include/footer.jsp" var="common_footer" />
	<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
	<script src="/js/mypage.js"></script>
</head>
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
          <h2>포인트</h2>
        </div>
        <section class="my_page">
          ${mypage_list }
          <div class="my_info_wrap">
            <div class="my_info">
              <div class="box3">
                <div class="point_wrap">
                  <div class="point_txt">
                    <p>보유 포인트</p>
                    <strong>${point }P</strong>
                  </div>
                  <div class="point_detail">
                    <h2>포인트 상세 내역</h2>
                    <div class="point_block_wrap">
                      <c:forEach var="pointRecord" items="${pointDTO }">
	                    <c:if test="${pointRecord.p_user eq user_id }">
	                       	<div class="point_block">
		                       	<c:choose>
		                       		<c:when test="${pointRecord.p_change > 0 }">
			                        <div class="left">
			                          <span><fmt:formatDate value="${pointRecord.p_change_date}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></span>
			                          <p>포인트 적립 - 리뷰 작성</p>
			                        </div>
			                        	+<fmt:formatNumber value="${pointRecord.p_change}" />P
		                       		</c:when>
		                       		<c:when test="${pointRecord.p_change < 0 }">
			                        <div class="left">
			                          <span><fmt:formatDate value="${pointRecord.p_change_date}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></span>
			                          <p>포인트 차감 - 쿠폰 구매</p>
			                        </div>
			                        	<fmt:formatNumber value="${pointRecord.p_change}" />P
		                       		</c:when>
		                       	</c:choose>
	                      	</div> 
	                    </c:if>
                      </c:forEach>
                       <div class="point_block">
                        <div class="left">
                          <span> <fmt:formatDate value="${memberDTO.register_date}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></span>
                          <p>가입 축하 포인트 적립</p>
                        </div>
                        	+1,000P
                      	</div> 
                     </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
	        </section>
	      </main>
          </div>
	  <footer id="footer">
	    <div class="inner">
	        ${common_footer}
	    </div>
	  </footer>
</body>
</html>