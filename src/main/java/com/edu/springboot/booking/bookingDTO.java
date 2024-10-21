package com.edu.springboot.booking;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class bookingDTO {

    private int booking_num;  // 예약 번호
    private String popup_idx;  // 팝업 ID
    private String member_id;  // 멤버 ID (오타 수정)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date visit_date;  // 방문 날짜
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date booking_date;  // 예약 날짜
    private int price;  // 가격
    private int headcount;  // 인원
    private int is_paid;  // 결제 여부  
    private int is_canceled;  // 예약 취소 여부
    private String popup_title; // 팝업 제목
    private String popup_contents; // 팝업 내용
   
}
