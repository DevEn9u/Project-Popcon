package com.edu.springboot.mypage;

import java.security.Principal;

import com.edu.springboot.popupboards.PopupBoardDTO;
import com.edu.springboot.popupboards.PopupBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.springboot.booking.bookingDTO;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

@Controller
public class MypageController {
	
	@Autowired
    IMypageService page;

    // 마이페이지 - 메인
    @GetMapping("/mypage/mypage.do")
    public String mypageMain(Principal principal, Model model) {
        String memberId = principal.getName();  // 로그인된 사용자의 ID를 가져옴
        bookingDTO info = page.bookingInfo(memberId);  // 예약 정보
        PopupBoardDTO title = page.bookingTitle(memberId);  // 팝업 제목

        // 데이터를 모델에 추가
        model.addAttribute("info", info);
        model.addAttribute("title", title);

        return "/mypages/mypage-main";
    }
	
	//마이페이지 - 예약 확인
	@GetMapping("/mypage/myBooking.do")
	public String mypageBooking() {
		return "/mypages/mypage-booking";
	}
	
 
	//마이페이지 - 포인트 확인
	@GetMapping("/mypage/myPoint.do")
	public String mypagePoint() {
		return "/mypages/mypage-point";
	}
	//마이페이지 - 내가 작성한 글 확인
	@GetMapping("/mypage/myPost.do")
	public String mypagePost() {
		return "/mypages/mypage-post";
	}
	//마이페이지 - 내가쓴 리뷰 확인
	@GetMapping("/mypage/myReview.do")
	public String mypageReview() {
		return "/mypages/mypage-review";
	}
	//마이페이지 - 좋아요한 팝업 확인
	@GetMapping("/mypage/likes.do")
	public String mypageLikes() {
		return "/mypages/mypage-likes";
	}
	//마이페이지 - 보유한 쿠폰 확인
	@GetMapping("/mypage/myCoupon.do")
	public String mypageCoupon() {
		return "/mypages/mypage-coupon";
	}

}