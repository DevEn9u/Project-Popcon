package com.edu.springboot.booking;

import java.sql.Date;
import java.text.NumberFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.springboot.popupboards.PopupBoardDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class BookingController {
    @Autowired
    IBookingService book;

    // 팝업 예약 페이지 - 완료
    @GetMapping("/popupBoard/booking/{board_idx}")
    public String getBookingDetails(@PathVariable("board_idx") String board_idx, Model model, HttpSession session) {
        PopupBoardDTO PopupDetails = book.PopupDetails(board_idx);
        
        // 가격을 3자리마다 컴마를 찍어 포맷팅
        NumberFormat numberFormat = NumberFormat.getInstance();
        String formattedFee = numberFormat.format(PopupDetails.getPopup_fee());
        
        model.addAttribute("details", PopupDetails);
        model.addAttribute("formattedFee", formattedFee);  // 포맷팅된 가격 전달
        
        // 세션에 board_idx 저장
        session.setAttribute("board_idx", board_idx);
        
        return "/booking/booking";
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
    
    // 인원, 수량 선택 페이지
    @GetMapping("/popupBoard/select/{board_idx}")
    public String popupselect(HttpSession session, Model model) {
        
        // 세션에서 board_idx 가져오기
        String board_idx = (String) session.getAttribute("board_idx");
        
        // board_idx가 존재하는지 확인 (null 체크)
        if (board_idx != null) {
            PopupBoardDTO PopupDetails = book.PopupDetails(board_idx);
            model.addAttribute("details", PopupDetails);
        } else{
            // 예외 처리: board_idx가 없을 경우 적절한 처리
            return "redirect:/error"; // 에러 페이지로 리다이렉트하거나 처리
        }
        
        return "/booking/booking-select";
    }
    

    @PostMapping("/popupBoard/select/{board_idx}")
    public String createBooking(HttpServletRequest req) {
        String popup_idx = req.getParameter("popup_idx");
        Date visit_date = java.sql.Date.valueOf(req.getParameter("visit_date"));

        int headcount = 1;
        String headcountStr = req.getParameter("headcount");
        if (headcountStr != null && !headcountStr.isEmpty()) {
            try {
                headcount = Integer.parseInt(headcountStr);
            } catch (NumberFormatException e) {
                // 변환 실패 시 기본값 유지
            }
        }

        int price = 0;
        String priceStr = req.getParameter("price");
        if (priceStr != null && !priceStr.isEmpty()) {
            try {
                price = Integer.parseInt(priceStr);
            } catch (NumberFormatException e) {
                // 변환 실패 시 기본값 유지
            }
        }

        String member_id = "";
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                member_id = ((UserDetails) principal).getUsername();
            }
        }

        bookingDTO dto = new bookingDTO();
        dto.setPopup_idx(popup_idx);
        dto.setMember_id(member_id);
        dto.setVisit_date(visit_date);
        dto.setHeadcount(headcount);
        dto.setPrice(price);

        // 예약 서비스 호출
        int bookingResult = book.booking(dto);

        if (bookingResult > 0) {
            return "redirect:/mypage/mypage.do";
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