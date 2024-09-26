package com.edu.springboot.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberService {
	// 회원가입
	public int insert(MemberDTO memberDTO);
}
