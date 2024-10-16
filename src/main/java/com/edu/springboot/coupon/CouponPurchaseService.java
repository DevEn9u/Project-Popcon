package com.edu.springboot.coupon;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;

public class CouponPurchaseService {
    
	// 고유한 주문번호 생성
    public String generatePurchaseIdx() {
        String prefix = "C";
        String datePart = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase(); // 하이픈 제거하고 대문자로 변환
        
        String purchaseNumber = prefix + datePart + uuid.substring(0, 4); 
        
        return purchaseNumber;
    }
}
