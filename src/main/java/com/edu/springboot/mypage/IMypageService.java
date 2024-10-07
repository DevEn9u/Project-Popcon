// IMypageService.java
package com.edu.springboot.mypage;

import com.edu.springboot.booking.bookingDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;
import com.edu.springboot.board.BoardDTO;
import java.util.List;

public interface IMypageService {
    // 예약한 팝업 정보 보기
    bookingDTO bookingInfo(String member_id);
    
    // 예약한 팝업의 제목 가져오기
    PopupBoardDTO bookingTitle(String board_idx);
    
    // 내가 작성한 게시글 목록 조회
    List<BoardDTO> getPostsByWriter(String writer, int offset, int limit);
    
    // 내가 작성한 게시글 총 수 조회
    int countPostsByWriter(String writer);
}
