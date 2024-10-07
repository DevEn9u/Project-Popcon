
package com.edu.springboot.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.board.BoardDTO;
import com.edu.springboot.booking.bookingDTO;
import com.edu.springboot.popupboards.CommentDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;

@Mapper
public interface MypageMapper {
    // 예약한 팝업 정보 보기
    public bookingDTO bookingInfo(String member_id);
    
    // 예약한 팝업의 제목 가져오기
    public PopupBoardDTO bookingTitle(String board_idx);
    
    // 내가 작성한 게시글 목록 조회
    public List<BoardDTO> getPostsByWriter(Map<String, Object> params);
    
    // 내가 작성한 게시글 총 수 조회
    public int countPostsByWriter(String writer);
    
    // 내가 작성한 리뷰 목록 조회 (작성자 이름 포함)
    List<CommentDTO> getReviewsByWriter(Map<String, Object> params);

    // 내가 작성한 리뷰 총 수 조회
    int countReviewsByWriter(String writer);
}
