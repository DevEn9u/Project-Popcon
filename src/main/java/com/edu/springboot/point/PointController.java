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
	
	// 쿠폰 메인
	@GetMapping("/point/cuponshop.do")
	public String cuponShop(Model model, Principal principal) {
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
	
	// 쿠폰 생성(작성)
	@GetMapping("/point/write.do")
    public String cuponWrite() {
        return "points/cupon-write"; // 작성 폼으로 이동
    }
	
	// 쿠폰 구매
	@GetMapping("/point/buy.do")
	public String buyCoupon() {
		return "points/cupon-write"; // 작성 폼으로 이동
	}
    

}
