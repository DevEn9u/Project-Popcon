
package com.edu.springboot.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.board.BoardDTO;
import com.edu.springboot.booking.bookingDTO;
import com.edu.springboot.popupboards.CommentDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;

@Mapper
public interface MypageMapper {

	// 예약한 팝업 정보 보기 (리스트로 변경)
    public List<bookingDTO> bookingInfo(String member_id);
    
    // 예약한 팝업의 제목 가져오기
    public PopupBoardDTO bookingTitle(String board_idx);
    
    // 내가 작성한 게시글 목록 조회
    public List<BoardDTO> getPostsByWriter(Map<String, Object> params);
    
    // 내가 작성한 게시글 총 수 조회
    public int countPostsByWriter(String writer);
    
    // 내가 작성한 리뷰 목록 조회 (모든 리뷰, 작성자 이름 및 팝업 제목 포함)
    List<CommentDTO> getReviewsByWriterAll(String writer);

    // 내가 작성한 리뷰 총 수 조회
    int countReviewsByWriter(String writer);
    
    // 예약 취소를 위한 메서드
    void updateBookingCancellation(@Param("booking_num") int booking_num, @Param("member_id") String member_id);
}
