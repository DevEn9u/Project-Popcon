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
	///////////////////////////////////////////////자유게시판///////////////////////////////////////////////////////////
	// 자유게시판 목록
    @GetMapping("/freeBoard/list.do")
    public String listBoards(Model model) {
        List<BoardDTO> boardList = boardService.getFreeBoards();
        model.addAttribute("boardList", boardList);
        return "boards/free-board-list";
    }
    // 자유게시판 상세보기
    @GetMapping("/freeBoard/view.do")
    public String freeBoardView(@RequestParam("board_idx") String boardIdx, Model model) {
        BoardDTO board = boardService.getBoardById(boardIdx);
        model.addAttribute("dto", board);
        return "boards/free-board-view";
    }
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
    // 게시글 수정 화면 호출
    @GetMapping("/freeBoard/edit.do")
    public String editFreeBoardForm(@RequestParam("board_idx") String boardIdx, Model model) {
        BoardDTO boardDTO = boardService.getBoardById(boardIdx);
        model.addAttribute("dto", boardDTO); // 게시글 정보를 모델에 추가
        return "boards/free-board-edit"; // 수정 JSP 파일
    }
    // 게시글 수정 처리
    @PostMapping("/freeBoard/update.do")
    public String editFreePost(@RequestParam("board_idx") String boardIdx, BoardDTO boardDTO, RedirectAttributes redirectAttributes) {
        boardDTO.setBoard_idx(boardIdx);
        boardService.update(boardDTO); // 서비스 호출
        redirectAttributes.addFlashAttribute("message", "게시글이 수정되었습니다.");
        return "redirect:/freeBoard/view.do?board_idx=" + boardIdx;
    }
    @GetMapping("/freeBoard/delete.do")
    public String deleteFreeBoard(@RequestParam("board_idx") String board_idx) {
        boardService.deleteBoard(board_idx);
        return "redirect:/freeBoard/list.do";
    }
    
    ///////////////////////////////////////////////////////공지/////////////////////////////////////////////////////
    // 공지 목록
    @GetMapping("/noticeBoard/list.do")
    public String getNoticeBoard(Model model) {
        List<BoardDTO> noticeList = boardService.getNoticeBoards();
        model.addAttribute("noticeList", noticeList);
        return "boards/notice-board-list";
    }
    // 공지 상세보기 
    @GetMapping("/noticeBoard/view.do")
    public String viewNoticeBoard(@RequestParam("board_idx") String boardIdx, Model model) {
        BoardDTO boardDTO = boardService.getBoardById(boardIdx);
        model.addAttribute("dto", boardDTO);
        return "boards/notice-board-view";
    }
    // 공지 작성 화면 호출
    @GetMapping("/noticeBoard/write.do")
    public String writeNoticeBoardForm() {
        return "boards/notice-board-write"; // 게시글 작성 JSP 파일
    }
    // 공지 작성 처리
    @PostMapping("/noticeBoard/write.do")
    public String writeNoticePost(BoardDTO boardDTO, RedirectAttributes redirectAttributes) {
        // board_type을 'notice'로 설정
        boardDTO.setBoard_type("notice");
        boardDTO.setRole("ROLE_ADMIN"); // 공지게시판 작성 시 ROLE_ADMIN 설정
        boardService.write(boardDTO);
        redirectAttributes.addFlashAttribute("message", "공지사항이 등록되었습니다.");
        return "redirect:/noticeBoard/list.do";
    }
    // 공지 수정 화면 호출
    @GetMapping("/noticeBoard/edit.do") // 경로를 edit로 변경
    public String editNoticeBoardForm(@RequestParam("board_idx") String boardIdx, Model model) {
        BoardDTO boardDTO = boardService.getBoardById(boardIdx);
        model.addAttribute("dto", boardDTO); // 게시글 정보를 모델에 추가
        return "boards/notice-board-edit"; // 수정 JSP 파일
    }
    // 공지 수정 처리
    @PostMapping("/noticeBoard/update.do")
    public String editPost(@RequestParam("board_idx") String boardIdx, BoardDTO boardDTO, RedirectAttributes redirectAttributes) {
        boardDTO.setBoard_idx(boardIdx);
        boardService.update(boardDTO); // 서비스 호출
        redirectAttributes.addFlashAttribute("message", "게시글이 수정되었습니다.");
        return "redirect:/noticeBoard/view.do?board_idx=" + boardIdx;
    }
    // 공지 삭제
    @GetMapping("/noticeBoard/delete.do")
    public String deleteNoticeBoard(@RequestParam("board_idx") String board_idx) {
        boardService.deleteBoard(board_idx);
        return "redirect:/noticeBoard/list.do";
    }


}
