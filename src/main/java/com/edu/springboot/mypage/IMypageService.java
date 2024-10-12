// IMypageService.java
package com.edu.springboot.mypage;

import java.util.List;

import com.edu.springboot.board.BoardDTO;
import com.edu.springboot.booking.bookingDTO;
import com.edu.springboot.popupboards.CommentDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;

public interface IMypageService {
	// 예약한 팝업 정보 보기 (리스트로 변경)
    List<bookingDTO> bookingInfo(String member_id);
    
    // 예약한 팝업의 제목 가져오기
    PopupBoardDTO bookingTitle(String board_idx);
    
    // 내가 작성한 게시글 목록 조회 
    List<BoardDTO> getPostsByWriter(String writer, int offset, int limit);
    
    // 내가 작성한 게시글 총 수 조회
    int countPostsByWriter(String writer);
    
    // 내가 작성한 리뷰 목록 조회 (작성자 이름 포함)
    List<CommentDTO> getAllReviewsByWriter(String writer);

    // 내가 작성한 리뷰 총 수 조회
    int countReviewsByWriter(String writer);
    
    // 내가 좋아요한 팝업 목록 조회
    List<PopupBoardDTO> getLikedPopupsByMemberId(String memberId);
    
 // 예약 취소
    void cancelBooking(int booking_num, String member_id); // 예약 번호와 회원 ID로 예약 취소
}
    
