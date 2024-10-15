package com.edu.springboot.mypage;

import java.security.Principal;
import java.util.List;

import com.edu.springboot.booking.bookingDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class MypageRestController {

    @Autowired
    private IMypageService mypageService;

    // 예약 정보 가져오기 (REST API)
    @GetMapping("/bookings/mybookings")
    public List<bookingDTO> getMyBookings(Principal principal) {
        String memberId = principal.getName(); // 현재 로그인한 사용자 ID 가져오기
        return mypageService.bookingInfo(memberId);
    }
}