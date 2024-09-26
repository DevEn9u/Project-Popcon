<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/popup_write.css">
<script>
    function validateForm() {
        // 모든 입력 필드 선택
        const title = document.querySelector('input[name="board_title"]');
        const contents = document.querySelector('textarea[name="contents"]');
        const popupFee = document.querySelector('input[name="popup_fee"]');
        const startDate = document.querySelector('input[name="start_date"]');
        const endDate = document.querySelector('input[name="end_date"]');
        const popupAddr = document.querySelector('input[name="popup_addr"]');
        const category = document.querySelector('input[name="category"]');

        // 입력 값 체크
        if (!title.value.trim()) {
            alert("제목을 입력해 주세요.");
            title.focus();
            return false;
        }
        if (!contents.value.trim()) {
            alert("내용을 입력해 주세요.");
            contents.focus();
            return false;
        }
        if (!popupFee.value.trim()) {
            alert("입장료를 입력해 주세요.");
            popupFee.focus();
            return false;
        }
        if (!startDate.value.trim()) {
            alert("시작 날짜를 입력해 주세요.");
            startDate.focus();
            return false;
        }
        if (!endDate.value.trim()) {
            alert("종료 날짜를 입력해 주세요.");
            endDate.focus();
            return false;
        }
        if (!popupAddr.value.trim()) {
            alert("주소를 입력해 주세요.");
            popupAddr.focus();
            return false;
        }
        if (!category.value.trim()) {
            alert("카테고리를 입력해 주세요.");
            category.focus();
            return false;
        }
        
        return true;
    }

    function handleSubmit(event) {
        event.preventDefault();
        if (validateForm()) {
            document.querySelector('form').submit();
        }
    }
</script>
<body>
    ${common_header}
    <main id="pw_container">
        <div class="write_top">
            <div class="write_wrap">
                <h2 class="write_tit">팝업 안내</h2>
                <h3 class="sub_tit">게시글 작성</h3>
            </div>
        </div>
        <div class="pw_inner">
            <div class="board_write_wrap">
                <form action="/popupBoard/write.do" method="post">
                    <table>
                        <caption class="nohead"></caption>
                        <tr>
                            <td class="col_mid col_tit">
                                제목 : 
                                <input type="text" class="write_input" name="board_title" required/>
                            </td>
                        </tr>
                        <tr class="tr_content">
                            <td class="col_mid col_content">
                                <span class="pw_content_tit">내용 <br /></span>
                                <textarea class="inner_input" name="contents" placeholder="내용을 입력해주세요" required></textarea>
                                <div class="pw_pay_wrap">
                                    <div class="pw_pay">
                                        <span class="pay_tit">입장료 :</span>
                                        <input type="number" class="pay_input" name="popup_fee" required/>
                                    </div>
                                </div>

                                <div class="pw_date">
                                    <div class="date_start">
                                        <span class="popup_tit">팝업일정 :</span>
                                        <input type="text" class="start_input" name="start_date" placeholder="시작: YYYY-MM-DD" required/>
                                    </div>
                                    <div class="date_end">
                                        <input type="text" class="end_input" name="end_date" placeholder="종료: YYYY-MM-DD" required/>
                                    </div>
                                </div>
                                <div class="pw_location">
                                    <span class="popupwrite_location">팝업주소 :</span>
                                    <input type="text" class="location_input" name="popup_addr" placeholder="주소를 입력" required/>
                                </div>
                                <div class="pw_category">
                                    <span class="popupwrite_category">카테고리 :</span>
                                    <input type="text" class="cate_input" name="category" placeholder="카테고리를 입력" required/>
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
                                    <button type="button" class="pw_upload_btn" onclick="handleSubmit(event);">작성 완료</button>
                                    <button type="button" class="pw_cancel_btn" onclick="location.href='./list.do';">작성 취소</button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
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
