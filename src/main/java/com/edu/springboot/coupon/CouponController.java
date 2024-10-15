package com.edu.springboot.coupon;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;
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

import com.edu.springboot.board.BoardDTO;
import com.edu.springboot.images.ImageDTO;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;
import com.edu.springboot.popupboards.PopupBoardMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CouponController {
	@Autowired
    private IMemberService memberService; 
	
	@Autowired
	private ICouponService couponService;
	
	// 이미지 파일 저장 위치
    @Value("${file.upload-dir}")
    private String uploadDir;
	
    // 이미지 파일 제약
    private static final String[] ALLOWED_EXTENSIONS = {".jpg", ".jpeg", ".png", ".gif", ".webp"};
    private static final long MAX_FILE_SIZE = 10 * 1024 * 1024; // 10MB
	
	// 쿠폰 메인
	@GetMapping("/coupon/main.do")
	public String couponShop(Model model, Principal principal) {
		List<CouponShopDTO> couponList = couponService.selectCouponList();
		// 디버깅
//		System.out.println("쿠폰 테스트" + couponList);
		// 로그인한 사용자 ID 가져오기
        String userId = principal != null ? principal.getName() : null;
        
        try {
            MemberDTO memberDTO = memberService.getMemberById(userId);
            model.addAttribute("memberDTO", memberDTO);
            model.addAttribute("couponList", couponList);
        } catch (Exception e) {}
		
		return "coupon/coupon-main";
	}
	
	// 쿠폰 생성(작성) 화면 불러오기
	@GetMapping("/coupon/write.do")
    public String couponWriteGet(Model model) {
		
        return "coupon/coupon-write"; // 작성 폼으로 이동
    }
	// 쿠폰 생성(작성) 처리
	@PostMapping("/coupon/write.do")
	public String couponWritePost(@RequestParam("imageFile") MultipartFile imageFile,
            Principal principal, HttpServletRequest req, Model model, RedirectAttributes redirectAttributes) {
		
		// 관리자 로그인 여부 확인
        if (principal.getName().equals("admin")) {
            redirectAttributes.addFlashAttribute("error", "관리자만 접근이 가능합니다.");
            return "redirect:/login.do"; // 로그인 페이지로 리다이렉트
        }
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
                redirectAttributes.addFlashAttribute("error", "허용되지 않은 썸네일 파일 형식입니다.");
                return "redirect:/coupon/write.do"; // 에러 시 리다이렉트
            }

            // 파일 크기 검증
            if (imageFile.getSize() > MAX_FILE_SIZE) {
                redirectAttributes.addFlashAttribute("error", "썸네일 파일 크기는 10MB 이하이어야 합니다.");
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
                redirectAttributes.addFlashAttribute("error", "썸네일 파일 업로드 중 오류가 발생했습니다.");
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
            // 쿠폰 저장
        	System.out.println("설정된 이미지 URL셋: " + couponShopDTO.getImage_url());
    		return "redirect:/coupon/main.do";
        }
        else { 
        	return "redirect:/coupon/write.do";
        }
        
	}
	
	
	// 쿠폰 구매
	@GetMapping("/coupon/buy.do")
	public String buyCoupon() {
		return "coupon/coupon-write"; // 작성 폼으로 이동
	}
    

}
