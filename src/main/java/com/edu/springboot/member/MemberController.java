package com.edu.springboot.member;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.springboot.smtp.EmailSending;
import com.edu.springboot.smtp.FindIdMail;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MemberController {
	// member memberDAO 호출을 위해 자동 Bean 주입. 이 Interface를 통해 Mapper 호출
	@Autowired
	private IMemberService memberDAO;
	
	@Autowired
	private FindIdMail findIdMail;
	
	private String verificationCode; 	// 인증 코드
	private String email;
	
	// 로그인(Spring Security 커스텀 로그인 페이지)
	@GetMapping("/login.do")
	public String login(Model model, HttpServletRequest req) {
		 Cookie[] cookies = req.getCookies();
		 
		 String savedId = null;
		 boolean isChecked = false;
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if ("SavedUserId".equals(cookie.getName())) {
		                savedId = cookie.getValue();
		                isChecked = true; // 쿠키가 있을 경우에 체크박스 체크
		                break; // 반복문 탈출
		            }
		        }
		    }
	    model.addAttribute("savedId", savedId);
	    model.addAttribute("isChecked", isChecked);
		return "members/login";
	}

	// 인증 코드 발송
	@PostMapping("/sendVerificationCode.do")
	@ResponseBody
	public ResponseEntity<?> sendVerificationCode(@RequestBody Map<String, String> requestData) {
	    
		String name = requestData.get("name");
	    String email = requestData.get("email");
	    
	    MemberDTO memberDTO = new MemberDTO();
	    memberDTO.setName(name);
	    memberDTO.setEmail(email);

	    // DB에서 이름과 이메일 확인
	    int result = memberDAO.isUserExists(memberDTO);
	    if (result <= 0) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	                             .body(Map.of("success", false, "message", "등록된 사용자 정보가 없습니다."));
	    }
	    // 인증 코드 생성
	    verificationCode = findIdMail.createVerificationCode();
	    this.email = email; // 이메일 주소 저장

	    try {
	        findIdMail.sendVerificationEmail(email, verificationCode);
	        return ResponseEntity.ok(Map.of("success", true, "message", "인증 코드가 발송되었습니다."));
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                             .body(Map.of("success", false, "message", "메일 발송에 실패했습니다."));
	    }
	}
	
	// 인증 코드 검증
	@PostMapping("/verifyCode.do")
	@ResponseBody
	public ResponseEntity<?> verifyCode(@RequestBody Map<String, String> requestData) {
		System.out.println("Received request data: " + requestData);
	    String inputCode = requestData.get("inputCode");
	    String name = requestData.get("name"); // 클라이언트로부터 이름 받기
	    String email = requestData.get("email"); // 클라이언트로부터 이메일 받기
	    
	    boolean isValid = verificationCode != null && verificationCode.equals(inputCode);
	    String userId = null;
	    if (isValid) {
	    	MemberDTO memberDTO = new MemberDTO();
	    	memberDTO.setName(name);
	    	memberDTO.setEmail(email);
	    	userId = memberDAO.getMemberInfo(memberDTO);
	    	// 디버깅
//	    	System.out.println("*****" + isValid + "*******");
//	    	System.out.println("아이디" + memberDAO.getMemberInfo(memberDTO) + "이름 : " + name);
	    }
	    return ResponseEntity.ok(Map.of("valid", isValid, "userId", userId));
	}
	/////////////////////////////////////////////////////////////////
	// 아이디 비밀번호 찾기
	@GetMapping("/findId.do")
	public String findId() {
		return "/members/findId";
	}

	@GetMapping("/findPw.do")
	public String findPw() {
		return "/members/findPw";
	}
		
	// 권한이 부족할 경우
	@RequestMapping("/denied.do")
	public String login3() {
		return "/auth/denied";
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
	    
		int count = memberDAO.checkIdDuplicate(input_id);
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
		
		int result = memberDAO.registerNormal(memberDTO);
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
	// 회원가입 - 기업회원 Post
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
		
		int result = memberDAO.registerCorp(memberDTO);
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
	    MemberDTO dbMember = memberDAO.getMemberById(id);

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
		MemberDTO memberDTO = memberDAO.getMemberById(user_id);
		model.addAttribute("memberDTO", memberDTO);
		return "/members/edit-choose";
	}
	// 회원정보 수정 - 회원 정보 변경
	@GetMapping("/member/edit-info.do")
	public String editNormalMemberInfoGet(Principal principal, Model model) {
		String user_id = principal.getName();
		MemberDTO memberDTO = memberDAO.getMemberById(user_id);
		model.addAttribute("memberDTO", memberDTO);
		return "/members/edit-info";
	}
	// 회원정보 수정 - 회원 정보 변경
	@PostMapping("/member/edit-info.do")
	public String editNormalMemberInfoPost(RedirectAttributes redirectAttributes, MemberDTO memberDTO) {
		int result = memberDAO.editMemberInfo(memberDTO);
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
	// 회원정보 수정 - 회원 비밀번호 변경
	@GetMapping("/member/edit-pass.do")
	public String editNormalMemberPassGet(Principal principal, Model model) {
		String user_id = principal.getName();
		MemberDTO memberDTO = memberDAO.getMemberById(user_id);
		model.addAttribute("memberDTO", memberDTO);
		return "/members/edit-pass";
	}
	// 회원정보 수정 - 회원 비밀번호 변경
	@PostMapping("/member/edit-pass.do")
	public String editNormalMemberPassPost(RedirectAttributes redirectAttributes, HttpServletRequest req, MemberDTO memberDTO) {
		String pass = req.getParameter("pass");
		String encodedPass = new BCryptPasswordEncoder().encode(pass);
		memberDTO.setPass(encodedPass);
		
		int result = memberDAO.editMemberPass(memberDTO);
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
	
}