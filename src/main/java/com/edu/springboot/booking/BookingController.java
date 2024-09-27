package com.edu.springboot.booking;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class BookingController {
	@Autowired
	IBookingService book;
	
	//팝업 예약 페이지
	@GetMapping("/popupBoard/booking.do")
	public String popupbooking() {
		return "/booking/booking";
	}
	//인원,수량 선택 페이지
	@GetMapping("/popupBoard/select.do")
	public String popupselect() {
		return "/booking/booking-select";
	}

	@ResponseBody
	@PostMapping("/popupBoard/bookingOk.do")
	public String bookingComplete(Model model, HttpServletRequest req) {
		int popup_idx = Integer.parseInt(req.getParameter("popup_idx"));
		String member_id = req.getParameter("member_id");
	    String visit_date = req.getParameter("visit_date");
	    int price = Integer.parseInt(req.getParameter("price"));
	    int headcount = Integer.parseInt(req.getParameter("headcount"));
	    int is_paid = Integer.parseInt(req.getParameter("is_paid"));
	    
	    if (visit_date == null || headcount == 0) {
	        return "Error: Missing required parameters";
	    }
	    

	    int booking_result = book.booking(popup_idx, member_id, visit_date, price
	    		, headcount, is_paid);
	    
	    if (booking_result > 0) {
	        return "redirect:/mypage/mypage.do";  // 예약 성공 시 리다이렉트
	    } else {
	        return "Error: Booking failed";  // 예약 실패 시 메시지 반환
	    }
	}


}
