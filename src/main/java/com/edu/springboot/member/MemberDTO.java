package com.edu.springboot.member;

import lombok.Data;

@Data
public class MemberDTO {

	private String id; //likes 테이블에서 참조할 사용자 ID
	private String name;
	private String email;
	private String pass;
	private String authority;
	private String phone;
	private int point;
	private String business_number;
	private int enabled; 
}
