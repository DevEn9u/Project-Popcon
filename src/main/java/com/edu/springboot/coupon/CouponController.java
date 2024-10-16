package com.edu.springboot.coupon;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.point.IPointService;
import com.edu.springboot.point.PointDTO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
//@RequiredArgsConstructor
public class CouponController {
	@Autowired
    private IMemberService memberService;
	@Autowired
	private IPointService pointDAO;
	@Autowired
	private ICouponService couponService;
	
	
	// 이미지 파일 저장 위치
    @Value("${file.upload-dir}")
    private String uploadDir;
	
    // 이미지 파일 제약
    private static final String[] ALLOWED_EXTENSIONS = {".jfif", ".jpg", ".jpeg", ".png", ".gif", ".webp"};
    private static final long MAX_FILE_SIZE = 10 * 1024 * 1024; // 10MB
	
	// 쿠폰 메인
	@GetMapping("/coupon/main.do")
	public String couponShop(Model model, Principal principal) {
		List<CouponShopDTO> couponList = couponService.selectCouponList();
		// 디버깅
		System.out.println("쿠폰 테스트" + couponList);
		// 로그인한 사용자 ID 가져오기
        String userId = principal != null ? principal.getName() : null;
        if(userId == null) {
        	model.addAttribute("couponList", couponList);
        }
        
        try {
            MemberDTO memberDTO = memberService.getMemberById(userId);
            // 사용자의 보유 포인트
            int point = pointDAO.getCurrentUserPoints(userId);
            
            Map<String, Object> attributes = new HashMap<>();
            attributes.put("currentPoints", point);
            attributes.put("memberDTO", memberDTO);
            attributes.put("couponList", couponList);

            model.addAllAttributes(attributes);
           
        } catch (Exception e) {}
		
		return "coupon/coupon-main";
	}
	
	// 쿠폰 생성(작성) 화면 불러오기
	@GetMapping("/coupon/write.do")
    public String couponWriteGet() {
        return "coupon/coupon-write"; // 작성 폼으로 이동
    }
	
	// 쿠폰 생성(작성) 처리
	@PostMapping("/coupon/write.do")
	public String couponWritePost(@RequestParam("imageFile") MultipartFile imageFile,
            Principal principal, HttpServletRequest req, Model model, RedirectAttributes redirectAttributes) {
		
        String coupon_name = req.getParameter("coupon_name");
        String coupon_description = req.getParameter("coupon_description");
        String pointsString = req.getParameter("points");
        int points = Integer.parseInt(pointsString);
//        MultipartFile image = req.getParameter("coupon_image");
        
        CouponShopDTO couponShopDTO = new CouponShopDTO();
        couponShopDTO.setCoupon_name(coupon_name);
        couponShopDTO.setCoupon_description(coupon_description);
        couponShopDTO.setPoints(points);
        
        // 썸네일 파일 처리
        if (!imageFile.isEmpty()) {
            String imageOriginalFilename = org.springframework.util.StringUtils.cleanPath(imageFile.getOriginalFilename());
            String imageFileExtension = imageOriginalFilename.substring(imageOriginalFilename.lastIndexOf(".")).toLowerCase();
            
            // 파일 확장자 검증
            if (!Arrays.asList(ALLOWED_EXTENSIONS).contains(imageFileExtension)) {
                redirectAttributes.addFlashAttribute("resultMsg", "허용되지 않은 썸네일 파일 형식입니다.");
                return "redirect:/coupon/write.do"; // 에러 시 리다이렉트
            }

            // 파일 크기 검증
            if (imageFile.getSize() > MAX_FILE_SIZE) {
                redirectAttributes.addFlashAttribute("resultMsg", "썸네일 파일 크기는 10MB 이하이어야 합니다.");
                return "redirect:/coupon/write.do"; // 에러 시 리다이렉트
            }

            try {
                // 파일 저장
                String imageNewFilename = UUID.randomUUID().toString() + imageFileExtension;
                File imageDest = new File(uploadDir + "/" + imageNewFilename);
                imageFile.transferTo(imageDest);

                // 썸네일 URL 설정
                String imageUrl = "/uploads/images/" + imageNewFilename;
                couponShopDTO.setImage_url(imageUrl); // 썸네일 URL 설정
            } catch (IOException e) {
                e.printStackTrace();
                redirectAttributes.addFlashAttribute("resultMsg", "썸네일 파일 업로드 중 오류가 발생했습니다.");
                return "redirect:/coupon/write.do"; // 에러 시 리다이렉트
            }
        }
        
        // 쿠폰 등록
        int result = couponService.insertCoupon(couponShopDTO);
        // 디버깅
//        System.out.println("설정된 이미지 URL둘: " + couponShopDTO.getImage_url());
//        System.out.println("쿠폰 등록 결과 : " + result);
//        System.out.println("쿠폰내용" + couponShopDTO);
//        
        if (result > 0) {
            // 디버깅
//        	System.out.println("설정된 이미지 URL셋: " + couponShopDTO.getImage_url());
        	// 완료시 쿠폰 메인으로 redirect
    		return "redirect:/coupon/main.do";
        }
        else { 
        	return "redirect:/coupon/write.do";
        }
        
	}
	
	
	// 쿠폰 구매
	@PostMapping("/coupon/buy.do")
	public String buyCoupon(Principal principal, HttpServletRequest req,
			RedirectAttributes redirectAttributes) {
		
		CouponPurchaseService couponPurchaseService = new CouponPurchaseService();
		String purchase_idx = couponPurchaseService.generatePurchaseIdx();
		String user_id = principal.getName();
		String coupon_idx = req.getParameter("coupon_idx");
		String coupon_name = req.getParameter("coupon_name");
		String paid_points = req.getParameter("paid_points");
		int points = Integer.parseInt(paid_points);
		
		CouponPurchasesDTO couponPurchasesDTO = new CouponPurchasesDTO();
		couponPurchasesDTO.setPurchase_idx(purchase_idx);
		couponPurchasesDTO.setUser_id(user_id);
		couponPurchasesDTO.setCoupon_idx(coupon_idx);
		couponPurchasesDTO.setCoupon_name(coupon_name);
		couponPurchasesDTO.setPaid_points(points);
		// 디버깅
//		System.out.println(couponPurchasesDTO + "실험");
		
		// 유저의 현재 포인트를 확인하고 쿠폰 가격보다 적은 포인트 보유시 구매 불가
		int currentUserPoints = pointDAO.getCurrentUserPoints(user_id);
		if (currentUserPoints < points) {
			redirectAttributes.addFlashAttribute("resultMsg", "포인트가 부족합니다.");
			return "redirect:/coupon/main.do";
		}
		
		// 쿠폰 구매
	    int result = couponService.insertCouponPurchase(couponPurchasesDTO);
	    if (result > 0) {
	    	PointDTO pointDTO = new PointDTO();
	        pointDTO.setP_user(user_id);		// 구매하려는 유저
	        pointDTO.setP_change(-points);		// 구매이력 저장, 음수로 저장
	        pointDTO.setP_change_date(new Date()); // 현재 날짜로 구매일 지정
	        
	        // PointDAO 호출하여 포인트 사용내역 저장, 유저의 보유 포인트 감소
	        pointDAO.updateMemberPoint(pointDTO);
	        
	        redirectAttributes.addFlashAttribute("resultMsg", "쿠폰을 구매하였습니다!");
	    } else {
	        redirectAttributes.addFlashAttribute("resultMsg", "쿠폰 구매에 실패하였습니다..");
	    }
	    
		return "redirect:/coupon/main.do";
	}
    

}
