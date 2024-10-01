package com.edu.springboot.popupboards;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.springboot.popupboards.CommentDTO; // 추가: 댓글 DTO

@Service
public class PopupBoardService {

    @Autowired
    private PopupBoardMapper popupBoardMapper; // Mapper 주입
    
    public List<PopupBoardDTO> selectTop8() {
        return popupBoardMapper.selectTop8(); // 상위 8개의 게시글을 조회
    }
    
    // 카테고리에 따라 게시물 조회 메소드 추가
    public List<PopupBoardDTO> selectByCategory(String category) {
        return popupBoardMapper.selectByCategory(category); // 입력받은 카테고리의 게시물 조회
    }
    
    // 글보기
    public PopupBoardDTO getBoardDetail(String board_idx) {
        return popupBoardMapper.popupView(board_idx);
    }
    
    // 글쓰기
    public int writePost(PopupBoardDTO post) {
        return popupBoardMapper.write(post);
    }
    
    // 글삭제
    public void delete(String board_idx) {
        popupBoardMapper.delete(board_idx);
    }
    
    // 글수정
    public void edit(PopupBoardDTO popupboardDTO) {
        popupBoardMapper.edit(popupboardDTO); 
    }
    
    // 댓글 작성
    public int writeComment(CommentDTO comment) {
        return popupBoardMapper.writeComment(comment); // 댓글 작성 메서드 호출
    }

    // 특정 팝업 게시글의 댓글 목록 조회
    public List<CommentDTO> getComments(String popup_board_idx) {
        return popupBoardMapper.getComments(popup_board_idx); // 댓글 목록 조회 메서드 호출
    }
    
    //댓글 삭제
    public void deleteComment(String com_idx) {
        popupBoardMapper.deleteComment(com_idx);
    }
    
    //댓글 수정
    public int editComment(CommentDTO commentDTO) {
        return popupBoardMapper.editComment(commentDTO);
    }

}
