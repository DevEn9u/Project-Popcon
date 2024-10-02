package com.edu.springboot.advice;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;

/* 모든 컨트롤러에 적용할 수 있는 어드바이스 생성
   각 페이지에서 "user_id"를 불러올 수 있게 함. */
@ControllerAdvice
public class GlobalControllerAdvice {
    @Autowired
    private IMemberService dao; // IMemberService를 주입

	@ModelAttribute
	public void addUserIdToModel(Principal principal, Model model) {
		try {
			if (principal != null) {
				String user_id = principal.getName();
				model.addAttribute("user_id", user_id);
				
	                // 사용자 정보 조회
	                MemberDTO memberDTO = dao.getMemberById(user_id);
	                if (memberDTO != null) {
	                    String user_name = memberDTO.getName();
	                    model.addAttribute("user_name", user_name);
	                }
				}
			}
		catch (Exception e) {
			 System.out.println("로그인 전입니다.");
		}
	}
}
