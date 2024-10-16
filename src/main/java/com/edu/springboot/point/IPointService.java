package com.edu.springboot.point;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.member.MemberDTO;

@Mapper
public interface IPointService {
	// 포인트 생성
	public int insertPoint(PointDTO pointDTO);
	// 해당 사용자에 포인트 적립
	public int updateMemberPoint(PointDTO pointDTO);
	// 포인트 적립 내역
	public List<PointDTO> getPointInfoById(String p_user);
	// 유저의 보유 포인트 확인
	public int getCurrentUserPoints(String user_id);
}