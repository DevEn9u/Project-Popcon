package com.edu.springboot.coupon;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;

public class CouponPurchaseService {
    
    private AtomicInteger counter = new AtomicInteger(1); // 주문 번호 카운터

    public String generatePurchaseIdx() {
        String prefix = "C";
        String datePart = new SimpleDateFormat("yyyyMMdd").format(new Date());

        // n 값을 가져오고 증가시킴
        int n = counter.getAndIncrement(); // AtomicInteger 사용하여 안전하게 증가

        return prefix + datePart + String.format("%03d", n);
    }
}
