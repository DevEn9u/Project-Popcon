package com.edu.springboot.booking;

import org.apache.ibatis.annotations.Mapper;

import io.lettuce.core.dynamic.annotation.Param;

@Mapper
public interface IBookingService {

    // 예약
    public int booking(@Param("popup_idx") int popup_idx,
                       @Param("member_id") String member_id,
                       @Param("visit_date") String visit_date,
                       @Param("price") int price,
                       @Param("headcount") int headcount,
                       @Param("is_paid") int is_paid);

	
}
