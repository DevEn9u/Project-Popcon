package com.edu.springboot.booking;

import lombok.Data;

@Data
public class bookingDTO {

    private int booking_num;  // 예약 번호
    private String popup_idx;  // 팝업 ID
    private String member_id;  // 멤버 ID (오타 수정)
    private java.sql.Date visit_date;  // 방문 날짜
    private java.sql.Date booking_date;  // 예약 날짜
    private int price;  // 가격
    private int headcount;  // 인원
    private int is_paid;  // 결제 여부
    
    // private int is_canceled;  // 예약 취소 여부
}
