<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<link rel="stylesheet" href="/css/board.css">
<script src="../js/file-upload.js"></script>
<script>
    function checkReset() {
      if (confirm("게시물을 다시 쓰시겠습니까?")) {
        let form = document.writeFrm;
        form.reset();
      }
      else {
        return false;
      }
    }
</script>
<body>
  <div id="skip_navi">
    <a href="#container">본문 바로가기</a>
  </div>
  <div id="wrap">
  	${common_header}
    <main id="container" class="board_page board_write sub_container">
      <div class="sub_top">
        <div class="inner">
          <h2>공지사항 - 수정</h2>
        </div>
      </div>
      <div class="contents">
        <div class="inner">
          <h3>게시글 수정</h3>
          <div class="board_write">
            <form name="writeFrm" method="post" action="../noticeBoard/write.do"
              onsubmit="return validateForm(this)">
              <!-- 삭제시 idx를 이용해 삭제 -->
              <input type="hidden" name="idx" value="${ dto.idx }" />       	 
              <table>
              <!-- thead가 없을 때 caption의 position이 absolute이면 th와 td의 width가 지정이 안되는 버그가 생기므로 common.css에서 caption.nohead에서 position을 statice으로 만들어 주었음 -->
               <caption class="nohead">게시글 작성</caption>
               <tr>
                 <th>이름</th>
                 <td><input type="text" name="name" readonly="readonly" value="${ UserName }"></td>
               </tr>
               <tr>
                 <th>제목</th>
                 <td><input type="text" name="title" placeholder="제목을 입력해주세요." value="${ dto.title }"></td>
               </tr>
               <tr>
                 <th class="t_area">내용</th>
                 <td>
                   <textarea cols="30" rows="20" name="content"
                     placeholder="필수 입력사항을 작성하고 입력해주세요.&#10;비방, 욕설, 도배글 등은 서비스 이용 제한의 사유가 됩니다.">${ dto.content }</textarea>
                 </td>
               </tr>
              </table>
              <div class="btn_wrap">
                <button type="submit" class="btn board_btn">등록</button>
                <button type="button" class="btn board_btn cancel_btn" onclick="checkReset();">다시쓰기</button>
                <button type="button" onclick="location.href='./list.do';" class="btn board_btn cancel_btn">목록으로</button>
              </div>
            </form>
          </div>
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