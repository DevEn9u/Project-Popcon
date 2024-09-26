package com.edu.springboot.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
    
    @Autowired
    private BoardMapper boardMapper;

    public List<BoardDTO> getAllBoards() {
        return boardMapper.selectAllBoards(); // 매퍼에서 데이터 가져오기
    }

    public List<BoardDTO> getFreeBoards() {
        return boardMapper.getFreeBoards(); // 자유게시판 데이터 가져오기
    }

    public List<BoardDTO> getNoticeBoards() {
        return boardMapper.getNoticeBoards(); // 공지게시판 데이터 가져오기
    }


}
