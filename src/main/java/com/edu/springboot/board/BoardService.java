package com.edu.springboot.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.springboot.images.ImageDTO;
import com.edu.springboot.images.ImageService;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.popupboards.CommentDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {
    
	private final BoardMapper boardMapper;
    
	
    private final IMemberService memberService; 
    private final ImageService imageService;
    
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
        // 게시글 상세 정보 조회
        BoardDTO board = boardMapper.selectBoardById(boardIdx);
        if (board != null) {
            // 관련 이미지 가져오기
            List<ImageDTO> images = imageService.getImages(boardIdx, "BOARD");
            board.setImages(images); // BoardDTO에 images 설정

            // 관련 댓글 가져오기
            List<CommentDTO> comments = getComments(boardIdx);
            // 각 댓글에 대해 작성자 이름 조회
            for (CommentDTO comment : comments) {
                MemberDTO coMember = memberService.getMemberById(comment.getCom_writer());
                String comWriterName = (coMember != null) ? coMember.getName() : "알 수 없음";
                comment.setComWriterName(comWriterName); // CommentDTO에 comWriterName 설정
            }
            board.setComments(comments); // BoardDTO에 comments 설정
        }
        return board;
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
    @Transactional
    public void writeComment(CommentDTO comment) {
        commentMapper.writeComment(comment);
    }

    // 댓글 목록 조회
    public List<CommentDTO> getComments(String board_idx) {
        List<CommentDTO> comments = commentMapper.getComments(board_idx);
        for (CommentDTO comment : comments) {
            // 각 댓글에 대한 이미지 리스트를 가져옴
            List<ImageDTO> images = imageService.getImages(comment.getCom_idx(), "COMMENT");
            comment.setCom_img(images);
        }
        return comments;
    }


    // 댓글 삭제
    @Transactional
    public void deleteComment(String com_idx) {
    	// 관련 이미지 삭제
        imageService.deleteImages(com_idx, "COMMENT");
        commentMapper.deleteComment(com_idx);
    }

    // 댓글 수정
    @Transactional
    public void editComment(CommentDTO commentDTO) {
        commentMapper.editComment(commentDTO);
    }
    // 댓글 정보 가져오기    
    public CommentDTO getCommentById(String com_idx) {
        return commentMapper.getCommentById(com_idx);
    }

}
