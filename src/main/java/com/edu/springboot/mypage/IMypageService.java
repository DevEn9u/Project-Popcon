package com.edu.springboot.mypage;

import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.booking.bookingDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;

@Mapper
public interface IMypageService {

	// 예약한 팝업 정보 보기
	public bookingDTO bookingInfo(String member_id);
	
	// 제목 가져오기
	public PopupBoardDTO bookingTitle(String board_idx);
	
}
