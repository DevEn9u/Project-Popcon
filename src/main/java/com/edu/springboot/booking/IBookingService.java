package com.edu.springboot.booking;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.edu.springboot.popupboards.PopupBoardDTO;


@Mapper
public interface IBookingService {

	// 예악하려는 팝업 정보 보기
	public PopupBoardDTO PopupDetails(String board_idx);
	// 예약하기
	public int booking(bookingDTO dto);
	
	// 예약 여부 확인
    public int checkIfUserBooked(Map<String, Object> paramMap);

}
