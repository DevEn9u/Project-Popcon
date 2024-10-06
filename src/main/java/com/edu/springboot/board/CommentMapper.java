package com.edu.springboot.board;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.popupboards.CommentDTO; // 기존 위치에서 임포트

@Mapper
public interface CommentMapper {

    // 댓글 작성
    void writeComment(CommentDTO comment);
    
    void popup_writeComment(CommentDTO comment);

    // 댓글 목록 조회
    List<CommentDTO> getComments(@Param("board_idx") String board_idx);

    // 댓글 삭제
    void deleteComment(String com_idx);

    // 댓글 수정
    void editComment(CommentDTO commentDTO);
    
    // 댓글 ID로 댓글 조회
    CommentDTO getCommentById(String com_idx);

}
