package com.edu.springboot.advice;

import java.security.Principal;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

/* 모든 컨트롤러에 적용할 수 있는 어드바이스 생성
   각 페이지에서 "user_id"를 불러올 수 있게 함. */
@ControllerAdvice
public class GlobalControllerAdvice {

	@ModelAttribute
	public void addUserIdToModel(Principal principal, Model model) {
		try {
			if (principal != null) {
				String user_id = principal.getName();
				model.addAttribute("user_id", user_id);
				}
			}
		catch (Exception e) {
			 System.out.println("로그인 전입니다.");
		}
	}
}
