package com.edu.springboot.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

}
