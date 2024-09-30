package com.edu.springboot.popupboards;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PopupController {
    
    @Autowired
    private PopupBoardMapper popupBoardMapper;
    
    // 팝업 글 목록 보기
    @GetMapping("/popupBoard/list.do")
    public String popuplist(@RequestParam(name = "category", required = false) String category, Model model) {
        List<PopupBoardDTO> popupList;
        
        if (category != null && !category.isEmpty()) {
            popupList = popupBoardMapper.selectByCategory(category); // 선택한 카테고리 게시물 조회
        } else {
            popupList = popupBoardMapper.selectTop8(); // 기본적으로 상위 8개 게시물 조회
        }
        
        model.addAttribute("popupList", popupList);
        return "popup-boards/popup-board-list"; 
    }
 
    // 팝업안내 - 글 보기
    @GetMapping("/popupBoard/view/{board_idx}")
    public String popupview(@PathVariable("board_idx") String board_idx, Model model) {
        PopupBoardDTO popupBoard = popupBoardMapper.popupView(board_idx); // 게시글 ID로 데이터를 가져옴
        model.addAttribute("popup", popupBoard);
        return "/popup-boards/popup-board-view"; // 반환할 뷰 경로 확인
    }
    
    // 팝업안내 - 글 쓰기 폼 보여주기
    @GetMapping("/popupBoard/write.do")
    public String popupWriteGet(Model model) {
        return "/popup-boards/popup-board-write"; // 작성 폼으로 이동
    }
    
    @PostMapping("/popupBoard/write.do")
    public String popupWritePost(@RequestParam("board_title") String board_title,
                                 @RequestParam("contents") String contents,
                                 @RequestParam("popup_fee") int popup_fee,
                                 @RequestParam("start_date") String start_date,
                                 @RequestParam("end_date") String end_date,
                                 @RequestParam("popup_addr") String popup_addr,
                                 @RequestParam("category") String category,
                                 @RequestParam("open_days") String open_days,
                                 @RequestParam("open_hours") String open_hours,
                                 HttpServletRequest req) {
        // 로그인한 사용자의 정보를 가져옴
        String writer = req.getUserPrincipal().getName();
        String role = null;

        if (req.isUserInRole("ROLE_CORP")) {
            role = "ROLE_CORP";
        } else if (req.isUserInRole("ROLE_NORMAL")) {
            role = "ROLE_NORMAL";
        } else if (req.isUserInRole("ROLE_ADMIN")) {
            role = "ROLE_ADMIN";
        }

        PopupBoardDTO post = new PopupBoardDTO();
        post.setBoard_title(board_title);
        post.setContents(contents);
        post.setPopup_fee(popup_fee);
        post.setStart_date(start_date);
        post.setEnd_date(end_date);
        post.setPopup_addr(popup_addr);
        post.setCategory(category);
        post.setWriter(writer);
        post.setRole(role);
        post.setOpen_days(open_days);
        post.setOpen_hours(open_hours);

        popupBoardMapper.write(post);

        return "redirect:/popupBoard/list.do";
    }

    @GetMapping("/popupBoard/edit.do")
    public String popupEdit(@RequestParam("board_idx") String board_idx, Model model) {
        PopupBoardDTO popupBoard = popupBoardMapper.popupView(board_idx); // 게시물 세부정보 가져오기
        model.addAttribute("dto", popupBoard);
        return "/popup-boards/popup-board-edit"; // 수정 페이지로 이동
    }

    // 글 수정 처리
    @PostMapping("/popupBoard/edit.do")
    public String popupEditPost(@ModelAttribute PopupBoardDTO popupboardDTO) {
        popupBoardMapper.edit(popupboardDTO); // 서비스 호출하여 게시글 수정
        return "redirect:/popupBoard/view/" + popupboardDTO.getBoard_idx(); // 수정 후 게시글 보기로 리다이렉트
    }

    //글삭제
    @PostMapping("/popupBoard/delete.do")
    public String delete(@RequestParam("board_idx") String board_idx) {
        popupBoardMapper.delete(board_idx);
        return "redirect:/popupBoard/list.do";
    }
}
