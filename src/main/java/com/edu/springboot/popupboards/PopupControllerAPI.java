package com.edu.springboot.popupboards;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/popupBoard")
public class PopupControllerAPI {
    
    @Autowired
    private final PopupBoardMapper popupBoardMapper;
    
    @Autowired 
    private PopupBoardService popupBoardService;
    
    @Autowired
    private IMemberService memberService;

    /**
     * 플러터에서 이미지 가져오기 위해 활용
     */
    @GetMapping("/{board_idx}")
    public ResponseEntity<PopupBoardDTO> getPopupBoard(@PathVariable("board_idx") String boardIdx) {
        // 기존 라인 유지
        PopupBoardDTO popupBoard = popupBoardMapper.popupView(boardIdx);
        
        // 추가적인 상세 데이터 가져오기
        PopupBoardDTO detailedPopup = popupBoardService.getBoardDetail(boardIdx);
        
        if (detailedPopup != null) {
            // 댓글 데이터 설정
            popupBoard.setComments(detailedPopup.getComments());
            
            // 이미지 데이터 설정 (이미 existing images가 있다면 병합 필요)
            if (detailedPopup.getImages() != null && !detailedPopup.getImages().isEmpty()) {
                if (popupBoard.getImages() != null) {
                    popupBoard.getImages().addAll(detailedPopup.getImages());
                } else {
                    popupBoard.setImages(detailedPopup.getImages());
                }
            }
            
            // 작성자 이름 설정
            popupBoard.setWriterName(detailedPopup.getWriterName());
        }
        
        return ResponseEntity.ok(popupBoard);
    }
    
    /**
     * 팝업게시판 목록
     */
    @GetMapping("/list")
    public ResponseEntity<List<PopupBoardDTO>> listPopup() {
        List<PopupBoardDTO> popupList = popupBoardService.selectAll();
        // 각 게시글에 대해 작성자 이름 조회
        for (PopupBoardDTO popupBoard : popupList) {
            MemberDTO member = memberService.getMemberById(popupBoard.getWriter());
            String writerName = (member != null) ? member.getName() : "알 수 없음";
            popupBoard.setWriterName(writerName);
        }

        return ResponseEntity.ok(popupList);
    }
    
}

