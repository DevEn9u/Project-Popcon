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
	
	// 아이디 비밀번호 찾기
	@GetMapping("/findId.do")
	public String findId() {
		return "/members/findId";
	}
	
	@GetMapping("/findPw.do")
	public String findPw() {
		return "/members/findPw";
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
	
}