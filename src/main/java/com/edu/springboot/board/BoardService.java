package com.edu.springboot.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.springboot.images.ImageService;
import com.edu.springboot.popupboards.CommentDTO;

@Service
public class BoardService {
    
    @Autowired
    private BoardMapper boardMapper;
    
    @Autowired
    private ImageService imageService;
    
    @Autowired
    private CommentMapper commentMapper; // 댓글 매퍼 추가

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
    
    public void updateVisitCount(String boardIdx) {
        boardMapper.updateVisitCount(boardIdx);
    }

    // 게시글 작성 메서드 추가
    @Transactional
    public void write(BoardDTO boardDTO) {
        boardMapper.insertBoard(boardDTO); // 매퍼에서 게시글 삽입
        // board_idx가 자동 생성되어 boardDTO에 설정됨
        System.out.println("Generated board_idx: " + boardDTO.getBoard_idx());
    }

    // 게시글 수정 메서드
    @Transactional
    public void update(BoardDTO boardDTO) {
        boardMapper.updateBoard(boardDTO);
        System.out.println("Generated board_idx: " + boardDTO.getBoard_idx());
    }
    
    @Transactional
    public void deleteBoard(String board_idx) {
        // 관련 이미지 삭제
        imageService.deleteImages(board_idx, "BOARD");
        // 게시글 삭제
        boardMapper.deleteBoard(board_idx);
    }
    
    public List<BoardDTO> getFreeBoardsWithPaging(int page) {
        int limit = 10; // 한 페이지에 보여줄 게시글 수
        int offset = (page - 1) * limit; // 시작 위치
        return boardMapper.getFreeBoardsWithPaging(offset, limit);
    }

    public List<BoardDTO> getNoticeBoardsWithPaging(int page) {
        int limit = 10; // 한 페이지에 보여줄 게시글 수
        int offset = (page - 1) * limit; // 시작 위치
        return boardMapper.getNoticeBoardsWithPaging(offset, limit);
    }

    public int getFreeBoardCount() {
        return boardMapper.getFreeBoardCount();
    }

    public int getNoticeBoardCount() {
        return boardMapper.getNoticeBoardCount();
    }
    
    // 댓글 작성
    public void writeComment(CommentDTO comment) {
        commentMapper.writeComment(comment);
    }

    // 댓글 목록 조회
    public List<CommentDTO> getComments(String board_idx) {
        return commentMapper.getComments(board_idx);
    }

    // 댓글 삭제
    public void deleteComment(String com_idx) {
        commentMapper.deleteComment(com_idx);
    }

    // 댓글 수정
    public void editComment(CommentDTO commentDTO) {
        commentMapper.editComment(commentDTO);
    }
}
