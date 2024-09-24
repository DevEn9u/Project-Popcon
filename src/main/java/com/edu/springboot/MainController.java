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
	
	// 자유게시판 - 목록
	@GetMapping("/freeBoard/list.do")
	public String freeBoardList() {
		return "/boards/free-board-list";
	}
	// 자유게시판 - 보기
	@GetMapping("/freeBoard/view.do")
	public String freeBoardView() {
		return "/boards/free-board-view";
	}
	// 자유게시판 - 쓰기
	@GetMapping("/freeBoard/write.do")
	public String freeBoardWrite() {
		return "/boards/free-board-write";
	}
	// 자유게시판 - 수정
	@GetMapping("/freeBoard/edit.do")
	public String freeBoardEdit() {
		return "/boards/free-board-edit";
	}
	// 자유게시판 - 삭제
	@GetMapping("/freeBoard/delete.do")
	public String freeBoardDelete() {
		return "redirect:/freeBoard/list.do";
	}
	
	// 공지 - 목록
	@GetMapping("/noticeBoard/list.do")
	public String noticeBoardList() {
		return "/boards/notice-board-list";
	}
	// 공지 - 보기
	@GetMapping("/noticeBoard/view.do")
	public String noticeBoardView() {
		return "/boards/notice-board-view";
	}
	// 공지 - 쓰기
	@GetMapping("/noticeBoard/write.do")
	public String noticeBoardWrite() {
		return "/boards/notice-board-write";
	}
	// 공지 - 수정
	@GetMapping("/noticeBoard/edit.do")
	public String noticeBoardEdit() {
		return "/boards/notice-board-edit";
	}
	// 공지 - 삭제
	@GetMapping("/noticeBoard/delete.do")
	public String noticeBoardDelete() {
		return "redirect:/noticeBoard/list.do";
	}
}