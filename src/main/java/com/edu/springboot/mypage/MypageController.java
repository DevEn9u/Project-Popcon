package com.edu.springboot.mypage;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.board.BoardDTO;
import com.edu.springboot.popupboards.CommentDTO;

@Controller
public class MypageController {
	
	@Autowired
	private IMypageService mypageService;

	//마이페이지 - 메인
	@GetMapping("/mypage/mypage.do")
	public String mypageMain(Principal principal, Model model) {
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
	
	
	// 마이페이지 - 내가 작성한 글 확인
    @GetMapping("/mypage/myPost.do")
    public String mypagePost(
            @RequestParam(value = "page", defaultValue = "1") int currentPage,
            @RequestParam(value = "size", defaultValue = "10") int pageSize,
            Principal principal,
            Model model) {
        
        // 로그인 여부 확인
        if (principal == null) {
            return "redirect:/login.do";
        }
        
        String userId = principal.getName();
        
        // 내가 작성한 게시글 총 수 조회
        int totalPosts = mypageService.countPostsByWriter(userId);
        int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
        
        // 페이지 번호 유효성 검사
        if (currentPage > totalPages && totalPages != 0) {
            currentPage = totalPages;
        }
        if (currentPage < 1) {
            currentPage = 1;
        }
        
        // 페이징을 위한 offset 계산
        int offset = (currentPage - 1) * pageSize;
        
        // 내가 작성한 게시글 목록 조회
        List<BoardDTO> posts = mypageService.getPostsByWriter(userId, offset, pageSize);
        
        // 모델에 데이터 추가
        model.addAttribute("posts", posts);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalPages", totalPages);
        
        return "/mypages/mypage-post";
    }
	
	
    // 마이페이지 - 내가 작성한 리뷰 확인
    @GetMapping("/mypage/myReview.do")
    public String mypageReview(
            @RequestParam(value = "page", defaultValue = "1") int currentPage,
            @RequestParam(value = "size", defaultValue = "10") int pageSize,
            Principal principal,
            Model model) {
        
        // 로그인 여부 확인
        if (principal == null) {
            return "redirect:/login.do";
        }
        
        String userId = principal.getName();
        
        // 내가 작성한 리뷰 총 수 조회
        int totalReviews = mypageService.countReviewsByWriter(userId);
        int totalPages = (int) Math.ceil((double) totalReviews / pageSize);
        
        // 페이지 번호 유효성 검사
        if (currentPage > totalPages && totalPages != 0) {
            currentPage = totalPages;
        }
        if (currentPage < 1) {
            currentPage = 1;
        }
        
        // 페이징을 위한 offset 계산
        int offset = (currentPage - 1) * pageSize;
        
        // 내가 작성한 리뷰 목록 조회
        List<CommentDTO> reviews = mypageService.getReviewsByWriter(userId, offset, pageSize);
        
        // 모델에 데이터 추가
        model.addAttribute("reviews", reviews);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalPages", totalPages);
        
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