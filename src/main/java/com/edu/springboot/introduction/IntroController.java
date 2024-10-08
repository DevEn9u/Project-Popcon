package com.edu.springboot.introduction;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IntroController {
	
	//팝콘소식 - 조직도(팀 소개)
	@GetMapping("/introduction/organization.do")
	public String organization() {
		return "introduction/organization";
	}
	
	//팀원소개
	@GetMapping("/introduction/team-member.do")
	public String team() {
		return "introduction/team-member";
	}
	
	//오시는 길
	@GetMapping("/introduction/location.do")
	public String location() {
		return "introduction/location";
	}
	

}
