package com.edu.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String home() {
		return "home";
	}
	// 로그인
	@GetMapping("/login.do")
	public String loginGet() {
		return "/members/login";
	}
	@PostMapping("/login.do")
	public String loginPost() {
		return "redirect:/";
	}
	
	// 회원가입 - 메인
	@GetMapping("/register.do")
	public String registerMain() {
		return "/members/register-main";
	}
	// 회원가입 - 개인회원
	@GetMapping("/register/normal.do")
	public String registerNormal() {
		return "/members/register-normal";
	}
	// 회원가입 - 기업회원
	@GetMapping("/register/corp.do")
	public String registerCorp() {
		return "/members/register-corp";
	}
	
	//팝업안내 - 메인
	@GetMapping("/popupBoard/list.do")
	public String popuplist() {
		return "/boards/popup-board-list";
	}
	
	//팝업안내 - 글 보기
	@GetMapping("/popupBoard/view.do")
	public String popupview() {
		return "/boards/popup-board-view";
	}
	
	//팝업안내 - 글 쓰기
	@GetMapping("/popupBoard/write.do")
	public String popupwrite() {
		return "/boards/popup-board-write";
	}
	//팝업안내 - 글 수정
	@GetMapping("/popupBoard/edit.do")
	public String popupedit() {
		return "/boards/popup-board-edit";
	}
	
	//팝업 예약 페이지
	@GetMapping("/popupBoard/booking.do")
	public String popupbooking() {
		return "/booking/booking";
	}
	//인원,수량 선택 페이지
	@GetMapping("/popupBoard/select.do")
	public String popupselect() {
		return "/booking/booking-select";
	}
	
}