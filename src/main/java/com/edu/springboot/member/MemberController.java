package com.edu.springboot.member;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MemberController {
	// member dao 호출을 위해 자동 Bean 주입. 이 Interface를 통해 Mapper 호출
	@Autowired
	IMemberService dao;
	
	// 로그인(Spring Security 커스텀 로그인 페이지)
	@GetMapping("/login.do")
	public String loginGet(Principal principal, Model model) {
		try {
			String user_id = principal.getName();
			model.addAttribute("user_id", user_id);
			System.out.println("로그인 상태입니다.");
		}
		catch (Exception e) {
			System.out.println("로그인 전입니다.");
		}
		return "members/login";
	}
	
	@PostMapping("/login.do")
	public String loginPost() {

		return "redirect:/";
	}
		
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
	public String registerNormalGet() {
		return "/members/register-normal";
	}
	// 회원가입 - 아이디 체크
	@GetMapping("/register/checkId.do")
	@ResponseBody
	public Map<String, Object> checkId(@RequestParam("input_id") String input_id) {
		Map<String, Object> resp = new HashMap<>();
		
		// 아이디 유효성 검사
	    if (!isValidId(input_id)) {
	        resp.put("isDuplicated", true);
	        resp.put("msg", "특수문자를 제외한 6-12자 이내의 아이디를 입력해주세요."); 
	        return resp;
	    }
	    
		int count = dao.checkIdDuplicate(input_id);
		if (count > 0) {
			resp.put("isDuplicated", true);
			resp.put("msg", "사용중인 아이디입니다. 다른 아이디를 입력해주세요.");
		} else {
			resp.put("isDuplicated", false);
			resp.put("msg", "사용 가능한 아이디입니다.");
		}
		return resp;
	}
	// 아이디 유효성 검사 메서드
	private boolean isValidId(String id) {
		// 아이디는 6~12자 이내이고 특수문자를 제외한 영대소문자, 숫자로 표현한다.
		String regex = "^[a-zA-Z0-9]{6,12}$";
		Pattern pattern = Pattern.compile(regex);
		/* Matcher 클래스는 패턴 객체에 대해 matcher() 메서드를 호출하여 Matcher 객체를 생성하고,
		이를 통해 문자열에서 일치하는 부분을 찾아낼 수 있다. */
		Matcher matcher = pattern.matcher(id);
		return matcher.matches();
	}
	
	// 회원가입 - 개인회원 post
	@PostMapping("/register/normal.do")
	public String registerNormalPost(RedirectAttributes redirectAttributes, HttpServletRequest req) {
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		String phone = req.getParameter("phone");
		

		// 비밀번호 암호화
		String encodedPass = new BCryptPasswordEncoder().encode(pass);
		
		// DTO에 정보 저장
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setName(name);
		memberDTO.setPass(encodedPass);
		memberDTO.setEmail(email);
		memberDTO.setPhone(phone);
		
		int result = dao.registerNormal(memberDTO);
		System.out.println("회원가입 결과" + result);
		
		// 성공시 view에서 성공 메세지 알려주기
		if (result > 0) {
			redirectAttributes.addFlashAttribute("resultMsg", "회원가입에 성공했습니다.");
			return "redirect:/login.do";
		}
		else {
			// 실패메시지
			redirectAttributes.addFlashAttribute("resultMsg", "회원가입에 실패했습니다.");
			return "redirect:/register/normal.do";
		}
	}
	
	// 회원가입 - 기업회원
	@GetMapping("/register/corp.do")
	public String registerCorpGet() {
		return "/members/register-corp";
	}
	// 회원가입 - 기업회원
	@PostMapping("/register/corp.do")
	public String registerCorpPost(RedirectAttributes redirectAttributes, HttpServletRequest req) {
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		String phone = req.getParameter("phone");
		String business_number = req.getParameter("business_number");

		// 비밀번호 암호화
		String encodedPass = new BCryptPasswordEncoder().encode(pass);
		
		// DTO에 정보 저장
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setName(name);
		memberDTO.setPass(encodedPass);
		memberDTO.setEmail(email);
		memberDTO.setPhone(phone);
		memberDTO.setBusiness_number(business_number);
		
		int result = dao.registerCorp(memberDTO);
		System.out.println("회원가입 결과" + result);
		
		// 성공시 view에서 성공 메세지 알려주기
		if (result > 0) {
			redirectAttributes.addFlashAttribute("resultMsg", "회원가입에 성공했습니다.");
			return "redirect:/login.do";
		}
		else {
			// 실패메시지
			redirectAttributes.addFlashAttribute("resultMsg", "회원가입에 실패했습니다.");
			return "redirect:/register/corp.do";
		}
	}
	// 회원정보 수정 페이지 접근 - 비밀번호 확인
	@GetMapping("/member/checkPass.do")
	public String checkPassGet(Principal principal, MemberDTO memberDTO) {
		return "/members/check-pass";
	}
	// 회원정보 수정 페이지 접근 - 비밀번호 확인
	@PostMapping("/member/checkPass.do")
	public String checkPassPost(RedirectAttributes redirectAttributes, Principal principal, MemberDTO memberDTO) {
	    String id = principal.getName();
	    String inputPass = memberDTO.getPass();
	    
	    // DB에서 해당 사용자의 정보를 가져오기
	    memberDTO.setId(id);
	    MemberDTO dbMember = dao.getMemberById(id);

	    if (dbMember != null) {
	        // 입력한 비밀번호와 DB의 비밀번호 비교
	        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	        if (passwordEncoder.matches(inputPass, dbMember.getPass())) {
	            // 비밀번호가 일치하는 경우
	            return "redirect:/member/edit.do";
	        }
	    }

	    // 실패 메시지
	    redirectAttributes.addFlashAttribute("resultMsg", "비밀번호를 확인해주세요.");
	    return "redirect:/member/checkPass.do";
	}
	// 회원정보 수정 - 수정 타입 선택
	@GetMapping("/member/edit.do")
	public String editMain(Principal principal, Model model) {
		String user_id = principal.getName();
		MemberDTO memberDTO = dao.getMemberById(user_id);
		model.addAttribute("memberDTO", memberDTO);
		return "/members/edit-choose";
	}
	// 회원정보 수정 - 일반회원 정보 변경
	@GetMapping("/member/edit-info.do")
	public String editNormalMemberInfoGet(Principal principal, Model model) {
		String user_id = principal.getName();
		MemberDTO memberDTO = dao.getMemberById(user_id);
		model.addAttribute("memberDTO", memberDTO);
		return "/members/edit-info";
	}
	// 회원정보 수정 - 일반회원 정보 변경
	@PostMapping("/member/edit-info.do")
	public String editNormalMemberInfoPost(RedirectAttributes redirectAttributes, MemberDTO memberDTO) {
		int result = dao.editMemberInfo(memberDTO);
		if (result > 0) {
			redirectAttributes.addFlashAttribute("resultMsg", "정보수정에 성공했습니다.");
			return "redirect:/mypage/mypage.do";
		}
		else {
			// 실패메시지
			redirectAttributes.addFlashAttribute("resultMsg", "정보수정에 실패했습니다.");
			return "redirect:/member/edit-info.do";
		}
	}
	// 회원정보 수정 - 일반회원 비밀번호 변경
	@GetMapping("/member/edit-pass.do")
	public String editNormalMemberPassGet(Principal principal, Model model) {
		String user_id = principal.getName();
		MemberDTO memberDTO = dao.getMemberById(user_id);
		model.addAttribute("memberDTO", memberDTO);
		return "/members/edit-pass";
	}
	// 회원정보 수정 - 일반회원 비밀번호 변경
	@PostMapping("/member/edit-pass.do")
	public String editNormalMemberPassPost(RedirectAttributes redirectAttributes, HttpServletRequest req, MemberDTO memberDTO) {
		String pass = req.getParameter("pass");
		String encodedPass = new BCryptPasswordEncoder().encode(pass);
		memberDTO.setPass(encodedPass);
		
		int result = dao.editMemberPass(memberDTO);
		System.out.println("정보수정 결과" + result + "*********" + memberDTO);
		if (result > 0) {
			redirectAttributes.addFlashAttribute("resultMsg", "비밀번호 변경에 성공했습니다.");
			return "redirect:/mypage/mypage.do";
		}
		else {
			redirectAttributes.addFlashAttribute("resultMsg", "비밀번호 변경에 실패했습니다.");
			return "redirect:/member/edit-pass.do";
		}
	}

	
//	// 회원정보 수정 - 기업회원
//	@GetMapping("/member/edit-corp.do")
//	public String editCorpMemberGet() {
//		return "/members/edit-corp";
//	}
//	@PostMapping("/member/edit-corp.do")
//	public String editCorpMemberPost() {
//		return "redirect:/";
//	}
	
	
}