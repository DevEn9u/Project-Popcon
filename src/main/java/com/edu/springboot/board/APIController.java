package com.edu.springboot.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springboot.images.ImageDTO;
import com.edu.springboot.images.ImageService;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.popupboards.CommentDTO;

import lombok.RequiredArgsConstructor;

@RestController // @Contoller + @RequesetBody 기능 제공
@RequiredArgsConstructor
public class APIController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private IMemberService memberService;


	// 자유게시판 목록
    @GetMapping("/api/freeBoard/list")
    public ResponseEntity<List<BoardDTO>> listBoards(@RequestParam(value = "page", defaultValue = "1") int page) {
        List<BoardDTO> boardList = boardService.getFreeBoardsWithPaging(page);
        // 각 게시글에 대해 작성자 이름 조회
        for (BoardDTO board : boardList) {
            MemberDTO member = memberService.getMemberById(board.getWriter());
            String writerName = (member != null) ? member.getName() : "알 수 없음";
            board.setWriterName(writerName);
        }

        return ResponseEntity.ok(boardList);
    }

    // 자유게시판 상세보기
    @GetMapping("/api/freeBoard/view/{boardIdx}")
    public ResponseEntity<BoardDTO> freeBoardView(@PathVariable String boardIdx) {
        BoardDTO board = boardService.getBoardById(boardIdx);
        if (board == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        // 작성자 이름 조회
        MemberDTO member = memberService.getMemberById(board.getWriter());
        String writerName = (member != null) ? member.getName() : "알 수 없음";
        board.setWriterName(writerName);
        
        // 관련 이미지 가져오기
        List<ImageDTO> images = imageService.getImages(boardIdx, "BOARD");
        
        // 댓글 목록 가져오기
        List<CommentDTO> comments = boardService.getComments(boardIdx);
        for (CommentDTO comment : comments) {
            MemberDTO coMember = memberService.getMemberById(comment.getCom_writer());
            String comWriterName = (coMember != null) ? coMember.getName() : "알 수 없음";
            comment.setComWriterName(comWriterName);
        }

        return ResponseEntity.ok(board);
    }

}
