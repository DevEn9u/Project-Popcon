package com.edu.springboot.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberService {
	
	// 로그인
	public MemberDTO login(MemberDTO memberDTO);
	// 회원정보추가
	public int insert(MemberDTO memberDTO);
}
