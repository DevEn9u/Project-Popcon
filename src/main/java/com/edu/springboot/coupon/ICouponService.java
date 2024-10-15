package com.edu.springboot.coupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ICouponService {
	// 쿠폰 목록 불러오기
	public List<CouponShopDTO> selectCouponList();
	// 쿠폰 생성(작성)
	public int insertCoupon(CouponShopDTO couponShopDTO);
}