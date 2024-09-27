package com.edu.springboot.booking;

import java.sql.Date;

import org.apache.ibatis.annotations.Mapper;

import io.lettuce.core.dynamic.annotation.Param;

@Mapper
public interface IBookingService {

	public int booking(bookingDTO dto);
}
