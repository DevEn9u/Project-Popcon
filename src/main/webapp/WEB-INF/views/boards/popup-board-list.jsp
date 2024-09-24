<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/popup_list.css?v=<?php echo time(); ?>">
  <body>
  ${common_header }
    <main id="popup_list_container">
      <div class="popup_list_inner">
        <div class="popup_list_title_wrap">
          <h2 class="popup_list_title">팝업안내</h2>
        </div>
        <div class="pl_main">
          <button class="write">게시물 작성하기</button>
          <nav class="kategorie_wrap">
            <ul class="pl_kategorie">
              <p class="keyword">키워드</p>
              <li class="char_btn"><a href="#">캐릭터</a></li>
              <li class="fassion_btn"><a href="#">패션/뷰티</a></li>
              <li><a href="#">식품</a></li>
              <li class="health_btn"><a href="#">헬스/스포츠</a></li>
              <li><a href="#">게임</a></li>
              <li><a href="#">공공</a></li>
              <li><a href="#">전시</a></li>
              <li class="digital_btn"><a href="#">가전/디지털</a></li>
              <li class="char_btn"><a href="#">아이돌</a></li>
            </ul>
          </nav>

          <ul class="popup_wrap">
            <li class="popup_banner">
              <a href="./view.do">
                <img src="../images/imgMGJ/popup_img.png" class="popup_img" />
                <div class="txt_title">
                  <h2>
                    제주 삼다수 팝업 in 성수 <img src="../images/imgMGJ/like_btn.svg" />
                  </h2>

                  <span class="popup_location"
                    ><img src="../images/imgMGJ/pin.svg" />서울특별시 성동구</span
                  >
                  <span class="popup_date">24.09.18 ~ 24.12.31</span>
                </div>
              </a>
            </li>
            <li class="popup_banner">
              <a href="./view.do">
                <img src="../images/imgMGJ/popup_img.png" class="popup_img" />
                <div class="txt_title">
                  <h2>
                    제주 삼다수 팝업 in 성수 <img src="../images/imgMGJ/like_btn.svg" />
                  </h2>
                  <span class="popup_location"
                    ><img src="../images/imgMGJ/pin.svg" />서울특별시 성동구</span
                  >
                  <span class="popup_date">24.09.18 ~ 24.12.31</span>
                </div>
              </a>
            </li>
            <li class="popup_banner">
              <a href="#">
                <img src="../images/imgMGJ/popup_img.png" class="popup_img" />
                <div class="txt_title">
                  <h2>
                    제주 삼다수 팝업 in 성수 <img src="../images/imgMGJ/like_btn.svg" />
                  </h2>
                  <span class="popup_location"
                    ><img src="../images/imgMGJ/pin.svg" />서울특별시 성동구</span
                  >
                  <span class="popup_date">24.09.18 ~ 24.12.31</span>
                </div>
              </a>
            </li>
            <li class="popup_banner">
              <a href="#">
                <img src="../images/imgMGJ/popup_img.png" class="popup_img" />
                <div class="txt_title">
                  <h2>
                    제주 삼다수 팝업 in 성수 <img src="../images/imgMGJ/like_btn.svg" />
                  </h2>
                  <span class="popup_location"
                    ><img src="../images/imgMGJ/pin.svg" />서울특별시 성동구</span
                  >
                  <span class="popup_date">24.09.18 ~ 24.12.31</span>
                </div>
              </a>
            </li>
            <li class="popup_banner">
              <a href="#">
                <img src="../images/imgMGJ/popup_img.png" class="popup_img" />
                <div class="txt_title">
                  <h2>
                    제주 삼다수 팝업 in 성수 <img src="../images/imgMGJ/like_btn.svg" />
                  </h2>
                  <span class="popup_location"
                    ><img src="../images/imgMGJ/pin.svg" />서울특별시 성동구</span
                  >
                  <span class="popup_date">24.09.18 ~ 24.12.31</span>
                </div>
              </a>
            </li>
            <li class="popup_banner">
              <a href="#">
                <img src="../images/imgMGJ/popup_img.png" class="popup_img" />
                <div class="txt_title">
                  <h2>
                    제주 삼다수 팝업 in 성수 <img src="../images/imgMGJ/like_btn.svg" />
                  </h2>
                  <span class="popup_location"
                    ><img src="../images/imgMGJ/pin.svg" />서울특별시 성동구</span
                  >
                  <span class="popup_date">24.09.18 ~ 24.12.31</span>
                </div>
              </a>
            </li>
            <li class="popup_banner">
              <a href="#">
                <img src="../images/imgMGJ/popup_img.png" class="popup_img" />
                <div class="txt_title">
                  <h2>
                    제주 삼다수 팝업 in 성수 <img src="../images/imgMGJ/like_btn.svg" />
                  </h2>
                  <span class="popup_location"
                    ><img src="../images/imgMGJ/pin.svg" />서울특별시 성동구</span
                  >
                  <span class="popup_date">24.09.18 ~ 24.12.31</span>
                </div>
              </a>
            </li>
            <li class="popup_banner">
              <a href="#">
                <img src="../images/imgMGJ/popup_img.png" class="popup_img" />
                <div class="txt_title">
                  <h2>
                    제주 삼다수 팝업 in 성수 <img src="../images/imgMGJ/like_btn.svg" />
                  </h2>
                  <span class="popup_location"
                    ><img src="../images/imgMGJ/pin.svg" />서울특별시 성동구</span
                  >
                  <span class="popup_date">24.09.18 ~ 24.12.31</span>
                </div>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </main>
    <footer id="footer">
	${common_footer }
    </footer>
  </body>
</html>
