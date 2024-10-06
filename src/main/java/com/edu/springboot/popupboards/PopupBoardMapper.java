package com.edu.springboot.popupboards;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.board.BoardDTO;
import com.edu.springboot.popupboards.CommentDTO; // 추가: 댓글 DTO

@Mapper
public interface PopupBoardMapper {
    
    // IDX 기준 상위 8개의 글만 목록으로 보기 
    public List<PopupBoardDTO> selectTop8();
    
    // 카테고리 기준으로 글 목록 보기
    List<PopupBoardDTO> selectByCategory(@Param("category") String category);
   
    // 글쓰기
    public int write(PopupBoardDTO post);
    
    // 글보기
    public PopupBoardDTO popupView(String board_idx);
    
    // 글삭제
    public void delete(String board_idx);
    
    // 글수정
    void edit(PopupBoardDTO popupboardDTO);
    
    // 댓글 작성
    //public int writeComment(CommentDTO comment); // 추가: 댓글 작성 메서드
    
    // 댓글 작성
    void popup_writeComment(CommentDTO comment);

    // 특정 게시글의 댓글 목록 조회
    public List<CommentDTO> getComments(@Param("popup_board_idx") String popup_board_idx);
    
    // 댓글 삭제
    void deleteComment(String com_idx);
    
    //댓글 수정
    int editComment(CommentDTO commentDTO);
    
    //댓글 수정 시 이미지 삭제
    int deleteCommentImage(String imageId);
    
    //썸네일 지우기
    public void deleteThumbnail(String board_idx);

}
