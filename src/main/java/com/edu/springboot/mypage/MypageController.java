package com.edu.springboot.mypage;

import java.security.Principal;
import java.text.NumberFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.board.BoardDTO;
import com.edu.springboot.board.BoardService;
import com.edu.springboot.booking.bookingDTO;
import com.edu.springboot.coupon.CouponPurchasesDTO;
import com.edu.springboot.coupon.ICouponService;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.point.IPointService;
import com.edu.springboot.point.PointDTO;
import com.edu.springboot.popupboards.CommentDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;
import com.edu.springboot.popupboards.PopupBoardMapper;

@Controller
public class MypageController {
	
	@Autowired
	private IMypageService mypageService;
	@Autowired
	private IMemberService memberDAO;
	@Autowired
	private IPointService pointDAO;
	@Autowired
	private ICouponService couponService;
	
	@Autowired
	private PopupBoardMapper popupBoardMapper;
	private MemberDTO memberDTO; 
	
	 // 마이페이지 - 메인
    @GetMapping("/mypage/main.do")
    public String mypageMain(Principal principal, Model model, MemberDTO memberDTO) {
    	String memberId = principal.getName(); // 현재 로그인한 사용자 ID 가져오기
        List<bookingDTO> booking = mypageService.bookingInfo(memberId); // 예약 정보 리스트 가져오기
        
        memberDTO = memberDAO.getMemberById(memberId);

        // 포인트에 콤마 추가
        String point = NumberFormat.getInstance(Locale.US).format(memberDTO.getPoint());
        
        model.addAttribute("booking", booking); // 모델에 예약 정보 리스트 추가
        model.addAttribute("point", point); 
        return "/mypages/mypage-main";
    }
	
	//마이페이지 - 예약 확인
	@GetMapping("/mypage/myBooking.do")
	public String mypageBooking(Principal principal, Model model) {
	    String memberId = principal.getName(); // 현재 로그인한 사용자 ID 가져오기
	    List<bookingDTO> booking = mypageService.bookingInfo(memberId); // 예약 정보 리스트 가져오기
	    
	    model.addAttribute("booking", booking); // 모델에 예약 정보 리스트 추가
	    return "/mypages/mypage-booking";
	}
 
	//마이페이지 - 포인트 확인
	@GetMapping("/mypage/myPoint.do")
	public String mypagePoint(Principal principal, Model model) {
    	String memberId = principal.getName(); // 현재 로그인한 사용자 ID 가져오기
		MemberDTO memberDTO = memberDAO.getMemberById(memberId);
		List<PointDTO> pointDTO = pointDAO.getPointInfoById(memberId);
		// 디버깅
//		System.out.println("디버깅" + pointDTO);
		
		// 포인트에 콤마 추가
        String point = NumberFormat.getInstance(Locale.US).format(memberDTO.getPoint());
        model.addAttribute("point", point);
        model.addAttribute("memberDTO", memberDTO);
        model.addAttribute("pointDTO", pointDTO);
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
	    
	    // 내가 작성한 팝업
	    List<PopupBoardDTO> popupList = popupBoardMapper.selectByWriter(userId);
	    
	    model.addAttribute("popupList", popupList);
	    
	    // 회원 정보 가져오기
	    MemberDTO memberDTO = memberDAO.getMemberById(userId);
	    if (memberDTO == null) {
	        // 예외 처리: 사용자 정보를 찾을 수 없을 경우
	        model.addAttribute("errorMessage", "회원 정보를 찾을 수 없습니다.");
	        return "/error"; // 에러 페이지로 리다이렉트
	    }
	    
	    // 권한 확인
	    String authority = memberDTO.getAuthority();
	    
	    // 모델에 데이터 추가
	    model.addAttribute("posts", posts);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("authority", authority);
	    
	    return "/mypages/mypage-post";
	}

	
	
    // 마이페이지 - 내가 작성한 리뷰 확인
    @GetMapping("/mypage/myReview.do")
    public String mypageReview(
            Principal principal,
            Model model) {
        
        // 로그인 여부 확인
        if (principal == null) {
            return "redirect:/login.do";
        }
        
        String userId = principal.getName();
        
        // 내가 작성한 리뷰 목록 조회 (모든 리뷰)
        List<CommentDTO> reviews = mypageService.getAllReviewsByWriter(userId);
        
        // 모델에 데이터 추가
        model.addAttribute("reviews", reviews);
        
        return "/mypages/mypage-review";
    }
	
	
    // 마이페이지 - 내가 좋아요한 팝업 목록 확인
    @GetMapping("/mypage/likes.do")
    public String mypageLikes(
            Principal principal,
            Model model) {
        
        // 로그인 여부 확인
        if (principal == null) {
            return "redirect:/login.do";
        }
        
        String userId = principal.getName();
        
        // 내가 좋아요한 팝업 목록 조회
        List<PopupBoardDTO> likedPopups = mypageService.getLikedPopupsByMemberId(userId);
        
        // 모델에 데이터 추가
        model.addAttribute("likedPopups", likedPopups);
        
        return "/mypages/mypage-likes";
    }
    
    // 예약 취소
    @PostMapping("/mypage/cancelBooking.do")
    public String cancelBooking(@RequestParam("booking_num") int booking_num, Principal principal, Model model) {
        String member_id = principal.getName(); // 현재 로그인한 사용자 ID 가져오기

        // 예약 취소 처리
        mypageService.cancelBooking(booking_num, member_id);

        // 예약 정보 다시 가져오기
        List<bookingDTO> booking = mypageService.bookingInfo(member_id);
        model.addAttribute("booking", booking);
        model.addAttribute("cancelMessage", "취소되었습니다."); // 취소 메시지 추가
        

        return "/mypages/mypage-booking"; // 예약 확인 페이지로 리다이렉트
    }
    
	
	
	//마이페이지 - 보유한 쿠폰 확인
	@GetMapping("/mypage/myCoupon.do")
	public String mypageCoupon(Principal principal, Model model) {
		String userId = principal.getName();
		List<CouponPurchasesDTO> couponList = couponService.getUserCoupons(userId);
		Date today = new Date();
//		System.out.println("유저아이디" + userId);
//		System.out.println("쿠폰리스트" + couponList);
		
		model.addAttribute("couponList", couponList);
		
		return "/mypages/mypage-coupon";
	}

}