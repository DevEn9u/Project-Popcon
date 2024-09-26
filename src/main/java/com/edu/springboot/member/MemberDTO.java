package com.edu.springboot.member;

import lombok.Data;

@Data
public class MemberDTO {

	private String id;
	private String name;
	private String email;
	private String pass;
	private String member_type;
	private String phone;
	private int point;
	private String business_number;
}
