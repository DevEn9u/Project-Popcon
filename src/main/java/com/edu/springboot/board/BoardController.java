package com.edu.springboot.board;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {

	@Autowired
    private final BoardService boardService;

    @GetMapping("/freeBoard/list.do")
    public String listBoards(Model model) {
        List<BoardDTO> boardList = boardService.getFreeBoards();
        model.addAttribute("boardList", boardList);
        return "boards/free-board-list";
    }
    
    @GetMapping("/noticeBoard/list.do")
    public String getNoticeBoard(Model model) {
        List<BoardDTO> noticeList = boardService.getNoticeBoards();
        model.addAttribute("noticeList", noticeList);
        return "boards/notice-board-list";
    }
    
    @GetMapping("/freeBoard/view.do")
    public String freeBoardView(@RequestParam("board_idx") String boardIdx, Model model) {
        BoardDTO board = boardService.getBoardById(boardIdx);
        model.addAttribute("dto", board);
        return "boards/free-board-view";
    }
    // 공지게시판 상세보기 메서드
    @GetMapping("/noticeBoard/view.do")
    public String viewNoticeBoard(@RequestParam("board_idx") String boardIdx, Model model) {
        BoardDTO boardDTO = boardService.getBoardById(boardIdx);
        model.addAttribute("dto", boardDTO);
        return "boards/notice-board-view";
    }
    
    // 자유게시판 글 작성
    // 게시글 작성 화면 호출
    @GetMapping("/freeBoard/write.do")
    public String writeBoardForm() {
        return "boards/free-board-write"; // 게시글 작성 JSP 파일
    }
    
    // 게시글 작성 처리
    @PostMapping("/freeBoard/write.do")
    public String writePost(BoardDTO boardDTO, RedirectAttributes redirectAttributes) {
        // board_type을 'free'로 설정
        boardDTO.setBoard_type("free");
        // role을 'ROLE_NORMAL'로 설정
        boardDTO.setRole("ROLE_NORMAL"); 
        boardService.write(boardDTO);
        redirectAttributes.addFlashAttribute("message", "게시글이 등록되었습니다.");
        return "redirect:/freeBoard/list.do";
    }
    //공지 글 작성
    // 게시글 작성 화면 호출
    @GetMapping("/notice-board/write.do")
    public String writeNoticeBoardForm() {
        return "boards/notice-board-view"; // 게시글 작성 JSP 파일
    }
    // 게시글 작성 처리
    @PostMapping("/notice-board/write.do")
    public String writeNoticePost(BoardDTO boardDTO, RedirectAttributes redirectAttributes) {
        // board_type을 'notice'로 설정
        boardDTO.setBoard_type("notice");
        boardDTO.setRole("ROLE_ADMIN"); // 공지게시판 작성 시 ROLE_ADMIN 설정
        boardService.write(boardDTO);
        redirectAttributes.addFlashAttribute("message", "공지사항이 등록되었습니다.");
        return "redirect:/noticeBoard/list.do";
    }


}
