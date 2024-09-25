package com.edu.springboot.member;

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
public class MemberController {
	// member dao 호출을 위해 자동 Bean 주입. 이 Interface를 통해 Mapper 호출
	@Autowired
	IMemberService dao;
	
	// 로그인
	@GetMapping("/login.do")
	public String loginGet(Principal principal, Model model) {
		/*
		 Spring Security는 session을 사용해서 로그인 정보를 저장하지만
		 개발자가 직접 접근할 수 없으므로, Principal 객체를 통해 로그인 아이디를
		 얻어올 수 있다.
		 */
		try {
			/*
			 try ~ catch문을 사용하는 이유는 로그인이 안되어있는 경우
			 NullPointerException이 떨어지기 때문이다.
			 */
			String login_id = principal.getName();
			model.addAttribute("login_id", login_id);
		}
		catch (Exception e) {
			System.out.println("로그인 전입니다.");
		}
		return "members/login";
	}
//	@PostMapping("/login.do")
//	public String loginPost() {
//        return "redirect:/";
//	}
		
	// 권한이 부족할 경우
	@RequestMapping("/denied.do")
	public String login3() {
		return "/auth/denied";
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
//	// 회원가입 - 아이디 체크
//	@GetMapping("/register/checkId.do")
//	public String checkId() {
//		return "/members/idCheckForm";
//	}
	// 회원가입
	@PostMapping("/register.do")
	public String register() {
		return "redirect:login.do";
	}
	
}