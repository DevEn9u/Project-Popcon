package com.edu.springboot.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
    List<BoardDTO> selectAllBoards();
    List<BoardDTO> getFreeBoards(); // 자유게시판 메소드
    List<BoardDTO> getNoticeBoards(); // 공지게시판 메소드

}
