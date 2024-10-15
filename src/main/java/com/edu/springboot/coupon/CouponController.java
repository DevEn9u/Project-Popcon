package com.edu.springboot.coupon;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;
import com.edu.springboot.popupboards.PopupBoardMapper;

@Controller
public class CouponController {
	@Autowired
    private IMemberService memberService; 
	
	// 쿠폰 메인
	@GetMapping("/coupon/main.do")
	public String couponShop(Model model, Principal principal) {
		List<PopupBoardDTO> popupList;

		// 로그인한 사용자 ID 가져오기
        String userId = principal != null ? principal.getName() : null;
        
        // ADMIN, CORP 계정에만 팝업게시판에 '게시물 작성하기' 버튼을 보여주기 위함.
        try {
            String id = (String) model.getAttribute("user_id");
            MemberDTO memberDTO = memberService.getMemberById(id);
            model.addAttribute("memberDTO", memberDTO);     
        } catch (Exception e) {}
		
		return "coupon/coupon-main";
	}
	
	// 쿠폰 생성(작성)
	@GetMapping("/coupon/write.do")
    public String couponWriteGet() {
        return "coupon/coupon-write"; // 작성 폼으로 이동
    }
	
	@PostMapping("/coupon/write.do")
	public String couponWritePost() {
		
		return "coupon/coupon-write"; // 작성 폼으로 이동
	}
	
	// 쿠폰 구매
	@GetMapping("/coupon/buy.do")
	public String buyCoupon() {
		return "coupon/coupon-write"; // 작성 폼으로 이동
	}
    

}
