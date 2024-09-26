package com.edu.springboot;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

//	// member dao 호출을 위해 자동 Bean 주입. 이 Interface를 통해 Mapper 호출
//	@Autowired
//	IMemberService dao;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
//	// 로그인
//	@GetMapping("/login.do")
//	public String loginGet(Principal principal, Model model) {
//		/*
//		 Spring Security는 session을 사용해서 로그인 정보를 저장하지만
//		 개발자가 직접 접근할 수 없으므로, Principal 객체를 통해 로그인 아이디를
//		 얻어올 수 있다.
//		 */
//		try {
//			/*
//			 try ~ catch문을 사용하는 이유는 로그인이 안되어있는 경우
//			 NullPointerException이 떨어지기 때문이다.
//			 */
//			String login_id = principal.getName();
//			model.addAttribute("login_id", login_id);
//		}
//		catch (Exception e) {
//			System.out.println("로그인 전입니다.");
//		}
//		return "members/login";
////		return "/members/login";
//	}
////	@PostMapping("/login.do")
////	public String loginPost() {
////        return "redirect:/";
////	}
//
//		
//		// 권한이 부족할 경우
//		@RequestMapping("/denied.do")
//		public String login3() {
//			return "/auth/denied";
//		}
//	
//	// 아이디 비밀번호 찾기
//	@GetMapping("/findId.do")
//	public String findId() {
//		return "/members/findId";
//	}
//	
//	@GetMapping("/findPw.do")
//	public String findPw() {
//		return "/members/findPw";
//	}
//	
//	// 회원가입 - 메인
//	@GetMapping("/register.do")
//	public String registerMain() {
//		return "/members/register-main";
//	}
//	// 회원가입 - 개인회원
//	@GetMapping("/register/normal.do")
//	public String registerNormal() {
//		return "/members/register-normal";
//	}
//	// 회원가입 - 기업회원
//	@GetMapping("/register/corp.do")
//	public String registerCorp() {
//		return "/members/register-corp";
//	}
////	// 회원가입 - 아이디 체크
////	@GetMapping("/register/checkId.do")
////	public String checkId() {
////		return "/members/idCheckForm";
////	}
//	// 회원가입
//	@PostMapping("/register.do")
//	public String register() {
//		return "redirect:login.do";
//	}
//	
//	// 자유게시판 - 목록
//	@GetMapping("freeBoard/list.do")
//	public String freeBoardList() {
//		return "/boards/free-board-list";
//	}
//	// 자유게시판 - 보기
//	@GetMapping("/freeBoard/view.do")
//	public String freeBoardView() {
//		return "/boards/free-board-view";
//	}
//	// 자유게시판 - 쓰기
//	@GetMapping("/freeBoard/write.do")
//	public String freeBoardWrite() {
//		return "/boards/free-board-write";
//	}
//	// 자유게시판 - 수정
//	@GetMapping("/freeBoard/edit.do")
//	public String freeBoardEdit() {
//		return "/boards/free-board-edit";
//	}
//	// 자유게시판 - 삭제
//	@GetMapping("/freeBoard/delete.do")
//	public String freeBoardDelete() {
//		return "redirect:/freeBoard/list.do";
//	}
//	
//	// 공지 - 목록
//	@GetMapping("/noticeBoard/list.do")
//	public String noticeBoardList() {
//		return "/boards/notice-board-list";
//	}
//	// 공지 - 보기
//	@GetMapping("/noticeBoard/view.do")
//	public String noticeBoardView() {
//		return "/boards/notice-board-view";
//	}
//	// 공지 - 쓰기
//	@GetMapping("/noticeBoard/write.do")
//	public String noticeBoardWrite() {
//		return "/boards/notice-board-write";
//	}
//	// 공지 - 수정
//	@GetMapping("/noticeBoard/edit.do")
//	public String noticeBoardEdit() {
//		return "/boards/notice-board-edit";
//	}
//	// 공지 - 삭제
//	@GetMapping("/noticeBoard/delete.do")
//	public String noticeBoardDelete() {
//		return "redirect:/noticeBoard/list.do";
//	}
//
//	//팝업안내 - 메인
//	@GetMapping("/popupBoard/list.do")
//	public String popuplist() {
//		return "/boards/popup-board-list";
//	}
//	
//	//팝업안내 - 글 보기
//	@GetMapping("/popupBoard/view.do")
//	public String popupview() {
//		return "/boards/popup-board-view";
//	}
//	
//	//팝업안내 - 글 쓰기
//	@GetMapping("/popupBoard/write.do")
//	public String popupwrite() {
//		return "/boards/popup-board-write";
//	}
//	//팝업안내 - 글 수정
//	@GetMapping("/popupBoard/edit.do")
//	public String popupedit() {
//		return "/boards/popup-board-edit";
//	}
//	
//	//팝업 예약 페이지
//	@GetMapping("/popupBoard/booking.do")
//	public String popupbooking() {
//		return "/booking/booking";
//	}
//	//인원,수량 선택 페이지
//	@GetMapping("/popupBoard/select.do")
//	public String popupselect() {
//		return "/booking/booking-select";
//	}
//	
//	//마이페이지 - 메인
//	@GetMapping("/mypage/mypage.do")
//	public String mypageMain() {
//		return "/mypages/mypage-main";
//	}
//	//마이페이지 - 예약 확인
//	@GetMapping("/mypage/myBooking.do")
//	public String mypageBooking() {
//		return "/mypages/mypage-booking";
//	}
//	//마이페이지 - 포인트 확인
//	@GetMapping("/mypage/myPoint.do")
//	public String mypagePoint() {
//		return "/mypages/mypage-point";
//	}
//	//마이페이지 - 내가 작성한 글 확인
//	@GetMapping("/mypage/myPost.do")
//	public String mypagePost() {
//		return "/mypages/mypage-post";
//	}
//	//마이페이지 - 내가쓴 리뷰 확인
//	@GetMapping("/mypage/myReview.do")
//	public String mypageReview() {
//		return "/mypages/mypage-review";
//	}
//	//마이페이지 - 좋아요한 팝업 확인
//	@GetMapping("/mypage/likes.do")
//	public String mypageLikes() {
//		return "/mypages/mypage-likes";
//	}
//	//마이페이지 - 보유한 쿠폰 확인
//	@GetMapping("/mypage/myCoupon.do")
//	public String mypageCoupon() {
//		return "/mypages/mypage-coupon";
//	}
}