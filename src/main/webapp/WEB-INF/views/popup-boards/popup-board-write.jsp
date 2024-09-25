<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/popup_write.css?v=<?php echo time(); ?>">
  <body>
  	${common_header }
    <main id="pw_container">
      <div class="write_top">
        <div class="write_wrap">
          <h2 class="write_tit">팝업 안내</h2>
          <h3 class="sub_tit">게시글 작성</h3>
        </div>
      </div>
      <div class="pw_inner">
        <div class="board_write_wrap">
          <table>
            <caption class="nohead"></caption>
            <tr>
              <td class="col_mid col_tit">
                제목 :
                <input type="text" class="write_input" />
              </td>
            </tr>
            <tr class="tr_content">
              <td class="col_mid col_content">
                <span class="pw_content_tit">내용 <br /></span>
                <textarea
                  class="inner_input"
                  placeholder="내용을 입력해주세요"
                ></textarea>
                <div class="pw_pay_wrap">
                  <div class="pw_pay">
                    <span class="pay_tit">입장료 :</span>
                    <input type="text" class="pay_input" />
                  </div>
                </div>

                <div class="pw_date">
                  <div class="date_start">
                    <span class="popup_tit">팝업일정 :</span>
                    <input
                      type="text"
                      class="start_input"
                      placeholder="시작:"
                    />
                  </div>
                  <div class="date_end">
                    <input type="text" class="end_input" placeholder="종료:" />
                  </div>
                </div>
                <div class="pw_location">
                  <span class="popupwrite_location">팝업주소 :</span>
                  <input
                    type="text"
                    class="location_input"
                    placeholder="주소를 입력"
                  />
                </div>
                <div class="pw_category">
                  <span class="popupwrite_category">카테고리 :</span>
                  <input
                    type="text"
                    class="cate_input"
                    placeholder="카테고리를 입력"
                  />
                </div>
                <div class="append_wrap">
                  <div class="thumnail_wrap">
                    <div class="pw_thumnail">썸네일</div>
                    <div class="file_up">파일 선택</div>
                  </div>
                  <div class="img_wrap">
                    <div class="pw_img">이미지 첨부</div>
                    <div class="file_up">파일 선택</div>
                  </div>
                </div>
                <div class="pw_btn_wrap">
                  <button class="pw_upload_btn"onclick="location.href='./list.do';">작성 완료</button>
                  <button class="pw_cancel_btn"onclick="location.href='./list.do';">작성 취소</button>
                </div>
              </td>
            </tr>
          </table>
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
