package com.edu.springboot.coupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ICouponService {
	// 등록된 쿠폰 목록 불러오기
	public List<CouponShopDTO> selectCouponList();
	// 쿠폰 생성(작성)
	public int insertCoupon(CouponShopDTO couponShopDTO);
	// 쿠폰 구매
	public int insertCouponPurchase(CouponPurchasesDTO couponPurchasesDTO);
	// 사용자 보유 쿠폰 불러오기
	public List<CouponPurchasesDTO> getUserCoupons(String userId);
}