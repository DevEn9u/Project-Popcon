package com.edu.springboot.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberService {
	// 아이디 찾기
	public String getMemberByEmail(String email);
	// 사용자 정보 검증
    public int checkUserInfo(String id, String email); 
	// 회원가입 - 일반 회원
	public int registerNormal(MemberDTO memberDTO);
	// 회원가입 - 기업 회원
	public int registerCorp(MemberDTO memberDTO);
	// ID 중복 확인
	public int checkIdDuplicate(String input_id);
	// 회원정보 수정 페이지 접근 - 비밀번호 확인
	public int checkPass(MemberDTO memberDTO);
	// 회원정보 가져오기 - 회원정보 수정
	public MemberDTO getMemberById(String id);
	// 회원 정보 수정 - 비밀번호 제외한 정보 수정
	public int editMemberInfo(MemberDTO memberDTO);
	// 회원 정보 수정 - 비밀번호 수정
	public int editMemberPass(MemberDTO memberDTO);
}