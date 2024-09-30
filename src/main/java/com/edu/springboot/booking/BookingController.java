package com.edu.springboot.booking;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.springboot.popupboards.PopupBoardDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BookingController {
    @Autowired
    IBookingService book;

    // 팝업 예약 페이지
    @GetMapping("/popupBoard/booking/{board_idx}")
    public String getBookingDetails(@PathVariable("board_idx") String board_idx, Model model) {
        PopupBoardDTO PopupDetails = book.PopupDetails(board_idx);
        model.addAttribute("PopupDetails", PopupDetails);
        return "/booking/booking";
    }

    // 인원, 수량 선택 페이지
    @GetMapping("/popupBoard/select/{board_idx}")
    public String popupselect(@PathVariable("board_idx") String board_idx, Model model) {
    	PopupBoardDTO PopupDetails = book.PopupDetails(board_idx);
        model.addAttribute("PopupDetails", PopupDetails);
        return "/booking/booking-select";
    }
    
    // 날짜 유효성 검사 메서드
    private boolean isValidDate(String dateString) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        format.setLenient(false); // 유효하지 않은 날짜 처리
        try {
            format.parse(dateString);
            return true; // 유효한 날짜
        } catch (ParseException e) {
            return false; // 잘못된 날짜 형식
        }
    }

    @PostMapping("/popupBoard/select.do")
    public String createBooking(HttpServletRequest req) {
        String popup_idx = req.getParameter("popup_idx");
        Date visit_date = java.sql.Date.valueOf(req.getParameter("visit_date"));

        // headcount 및 price 처리
        int headcount = 1; // 기본값
        String headcountStr = req.getParameter("headcount");
        if (headcountStr != null && !headcountStr.isEmpty()) {
            try {
                headcount = Integer.parseInt(headcountStr);
            } catch (NumberFormatException e) {
                // 변환 실패 시 기본값 유지
            }
        }
        
        // 가격 처리
        int price = 0; // 기본값
        String priceStr = req.getParameter("price");
        if (priceStr != null && !priceStr.isEmpty()) {
            try {
                price = Integer.parseInt(priceStr);
            } catch (NumberFormatException e) {
                // 변환 실패 시 기본값 유지
            }
        }

        // 로그인한 사용자 정보에서 member_id 가져오기
        String member_id = "";
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                member_id = ((UserDetails) principal).getUsername(); // 로그인한 사용자 ID 가져오기
            }
        }

        // bookingDTO 객체 생성 및 설정
        bookingDTO dto = new bookingDTO();
        dto.setPopup_idx(popup_idx);
        dto.setMember_id(member_id);
        dto.setVisit_date(visit_date);
        dto.setHeadcount(headcount); // 업데이트된 headcount 사용
        dto.setPrice(price); // 가격도 업데이트해야 함

        // 예약 서비스 호출
        int bookingResult = book.booking(dto);

        // 예약 결과에 따라 응답 반환
        if (bookingResult > 0) {
            return "redirect:/popupBoard/select.do";
        } else {
            return "Error: Booking failed";
        }
    }
    
    @GetMapping("/getUserId")
    @ResponseBody
    public String getUserId() {
    	String member_id = "";
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                member_id = ((UserDetails) principal).getUsername(); // 로그인한 사용자 ID 가져오기
            }
        }
        return member_id;
    }
    
}
