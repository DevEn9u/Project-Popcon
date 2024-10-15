package com.edu.springboot.coupon;

import java.util.Date;

import lombok.Data;

@Data
public class CouponPurchasesDTO {
	private String purchase_idx;			// 구매 일련번호
	private String coupon_idx;				// 구매한 쿠폰의 일련번호
	private String coupon_name;				// 구매한 쿠폰의 이름	
	private int paid_points;				// 쿠폰 가격
	private String user_id;					// 쿠폰을 구매한 계정
	private Date purchase_date;				// 쿠폰 구매일
}
