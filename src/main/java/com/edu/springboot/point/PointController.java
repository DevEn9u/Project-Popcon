package com.edu.springboot.point;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;
import com.edu.springboot.popupboards.PopupBoardMapper;

@Controller
public class PointController {
	@Autowired
    private IMemberService memberService; 
	
	@GetMapping("/point/pointshop.do")
	public String popcon(Model model, Principal principal) {
		List<PopupBoardDTO> popupList;

		// 로그인한 사용자 ID 가져오기
        String userId = principal != null ? principal.getName() : null;
  
        
        // ADMIN, CORP 계정에만 팝업게시판에 '게시물 작성하기' 버튼을 보여주기 위함.
        try {
            String id = (String) model.getAttribute("user_id");
            MemberDTO memberDTO = memberService.getMemberById(id);
            model.addAttribute("memberDTO", memberDTO);     
        } catch (Exception e) {}
		
		return "points/pointshop";
	}

}
