package com.edu.springboot.popupboards;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PopupController {
	
    @Autowired
    private PopupBoardMapper popupBoardMapper;
    
    //팝업 글 목록 보기
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

	//팝업안내 - 글 보기
	@GetMapping("/popupBoard/view.do")
	public String popupview() {
		return "/popup-boards/popup-board-view";
	}
	
	//팝업안내 - 글 쓰기
	@GetMapping("/popupBoard/write.do")
	public String popupwrite() {
		return "/popup-boards/popup-board-write";
	}
	//팝업안내 - 글 수정
	@GetMapping("/popupBoard/edit.do")
	public String popupedit() {
		return "/popup-boards/popup-board-edit";
	}

}
