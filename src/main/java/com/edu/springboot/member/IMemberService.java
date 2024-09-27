package com.edu.springboot.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberService {
	// 회원가입 - 일반 회원
	public int registerNormal(MemberDTO memberDTO);
	// 회원가입 - 기업 회원
	public int registerCorp(MemberDTO memberDTO);
	// ID 중복 확인
	public int checkIdDuplicate(String input_id);
}
