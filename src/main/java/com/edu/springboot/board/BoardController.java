package com.edu.springboot.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
        return "boards/notice-board-list"; // JSP 파일 경로
    }
    
    @PostMapping("/freeBoard/writing.do")
    public String writeFreeBoard(@ModelAttribute BoardDTO board) {
    	board.setBoard_type("free"); // 자유게시판 타입 설정
        boardService.writeBoard(board); // 글 작성 호출
        return "redirect:/free-board/list.do"; // 작성 후 목록으로 리디렉션
    }
    @PostMapping("/noticeBoard/writing.do")
    public String writeNoticeBoard(@ModelAttribute BoardDTO board) {
        board.setBoard_type("notice"); // 공지게시판 타입 설정
        boardService.writeBoard(board); // 글 작성 호출
        return "redirect:/notice-board/list.do"; // 작성 후 목록으로 리디렉션
    }


}
