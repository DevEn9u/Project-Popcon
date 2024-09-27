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
    
    public BoardDTO getBoardById(String boardIdx) {
        return boardMapper.selectBoardById(boardIdx);
    }
    
    // 게시글 작성 메서드 추가
    public void write(BoardDTO boardDTO) {
        boardMapper.insertBoard(boardDTO); // 매퍼에서 게시글 삽입
    }
    // 게시글 수정 메서드
    public void update(BoardDTO boardDTO) {
        boardMapper.updateBoard(boardDTO); 
    }
    public void deleteBoard(String board_idx) {
        boardMapper.deleteBoard(board_idx);
    }

}
