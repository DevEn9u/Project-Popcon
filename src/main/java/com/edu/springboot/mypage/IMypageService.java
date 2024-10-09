// IMypageService.java
package com.edu.springboot.mypage;

<<<<<<< HEAD
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
=======
import java.util.List;
>>>>>>> branch 'main' of https://github.com/DevEn9u/Project-Popcon.git

import com.edu.springboot.board.BoardDTO;
import com.edu.springboot.booking.bookingDTO;
import com.edu.springboot.popupboards.CommentDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;

<<<<<<< HEAD
@Service
@Transactional
@Mapper
=======
>>>>>>> branch 'main' of https://github.com/DevEn9u/Project-Popcon.git
public interface IMypageService {
    // 예약한 팝업 정보 보기
    bookingDTO bookingInfo(String member_id);
    
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
    
}
