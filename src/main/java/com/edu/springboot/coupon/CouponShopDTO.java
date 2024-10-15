package com.edu.springboot.coupon;

import java.util.Date;

import lombok.Data;

@Data
public class CouponShopDTO {
	private String coupon_idx;				// 쿠폰 번호
	private String coupon_name;				// 쿠폰 이름
	private String coupon_description;		// 쿠폰 설명
	private String image_url;				// 쿠폰 이미지 URL
	private int points;						// 쿠폰 가격(필요 포인트)
	private Date expiry_date;				// 쿠폰 사용 마감 기한
}
