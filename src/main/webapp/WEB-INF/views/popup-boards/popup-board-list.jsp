<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/popup_list.css?v=<?php echo time(); ?>">
<body>
${common_header}
<main id="popup_list_container">
    <div class="popup_list_inner">
        <div class="popup_list_title_wrap">
            <h2 class="popup_list_title"><a href="./list.do">팝업안내</a></h2>
        </div>
        <div class="pl_main">
            <button class="pl_write_btn" onclick="location.href='./write.do';">게시물 작성하기</button>
            
            <nav class="kategorie_wrap">
                <ul class="pl_kategorie">
                    <p class="keyword">키워드</p>
                    <li class="char_btn"><a href="./list.do?category=캐릭터">캐릭터</a></li>
                    <li class="fassion_btn"><a href="./list.do?category=패션/뷰티">패션/뷰티</a></li>
                    <li><a href="./list.do?category=식품">식품</a></li>
                    <li class="health_btn"><a href="./list.do?category=헬스/스포츠">헬스/스포츠</a></li>
                    <li><a href="./list.do?category=게임">게임</a></li>
                    <li><a href="./list.do?category=공공">공공</a></li>
                    <li><a href="./list.do?category=전시">전시</a></li>
                    <li class="digital_btn"><a href="./list.do?category=가전/디지털">가전/디지털</a></li>
                    <li class="char_btn"><a href="./list.do?category=아이돌">아이돌</a></li>
                    <li class="digital_btn"><a href="./list.do">키워드해제</a></li>
                </ul>
            </nav>

            <ul class="popup_wrap">
                <c:forEach var="popup" items="${popupList}">
                    <li class="popup_banner">
                        <a href="/popupBoard/view/${popup.board_idx}">
                            <img src="../images/imgMGJ/popup_img.png" class="popup_img" />
                            <div class="txt_title">
                                <h2>
                                    ${popup.board_title}
                                    <img src="../images/imgMGJ/like_btn.svg" class="pl_like_btn"/>
                                </h2>
                                <span class="popup_location">
                                    <img src="../images/imgMGJ/pin.svg" />
                                    ${popup.popup_addr}
                                </span>
                                <span class="popup_date">
                                    ${popup.postdate}
                                </span>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</main>
<footer id="footer">
    <div class="inner">
        ${common_footer}
    </div>
</footer>
</body>
</html>
