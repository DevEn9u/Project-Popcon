package com.edu.springboot.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface BoardMapper {
    List<BoardDTO> selectAllBoards();
    List<BoardDTO> getFreeBoards(); // 자유게시판 메소드
    List<BoardDTO> getNoticeBoards(); // 공지게시판 메소드
    BoardDTO selectBoardById(String boardIdx); // 자유게시판 게시글 상세 정보 조회
    void insertBoard(BoardDTO boardDTO); // 게시글 작성 메서드
    void updateBoard(BoardDTO boardDTO); // 게시글 수정 메서드
    public void deleteBoard(String board_idx);

    List<BoardDTO> getFreeBoardsWithPaging(@Param("offset") int offset, @Param("limit") int limit);
    List<BoardDTO> getNoticeBoardsWithPaging(@Param("offset") int offset, @Param("limit") int limit);
    int getFreeBoardCount(); // 자유게시판 게시글 수
    int getNoticeBoardCount(); // 공지게시판 게시글 수

}
