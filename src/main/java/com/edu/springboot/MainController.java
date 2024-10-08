package com.edu.springboot;

import java.security.Principal;
import java.util.List;

import com.edu.springboot.popupboards.LikeDTO;
import com.edu.springboot.popupboards.LikeMapper;
import com.edu.springboot.popupboards.LikeService;
import com.edu.springboot.popupboards.PopupBoardDTO;
import com.edu.springboot.popupboards.PopupBoardMapper;
import com.edu.springboot.popupboards.PopupBoardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.images.ImageDTO;
import com.edu.springboot.images.ImageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

@Controller
@RequiredArgsConstructor
public class MainController {
	
    @Autowired
    private final PopupBoardService popupBoardService;
    private final PopupBoardMapper popupBoardMapper;
    private final ImageService imageService;
    private final LikeService likeService;
    private final LikeMapper likeMapper;
		
	@GetMapping("/")
	public String home(Model model, Principal principal) {
		
	    
	    List<PopupBoardDTO> topPopups = popupBoardService.selectTop6(); // 상위 6개 게시글 추가
	    model.addAttribute("topPopups", topPopups); // JSP로 데이터 전송
	    
	    List<PopupBoardDTO> randomPosts = popupBoardService.selectRandomPosts(); // 무작위 6개 게시글 추가
	    model.addAttribute("randomPosts", randomPosts); // JSP로 데이터 전송
	    
	    List<PopupBoardDTO> popupList;
        popupList = popupBoardMapper.selectTop8(); // 상위 8개 게시물 조회
        
        List<PopupBoardDTO> popularPosts = popupBoardService.selectByLikes(); // 좋아요가 많은 순으로 게시글 조회
        
        model.addAttribute("popularPosts", popularPosts);
	 	model.addAttribute("popupList", popupList);
	 	
	 	// 로그인한 사용자 ID 가져오기
        String userId = principal != null ? principal.getName() : null;
        
        // 각 게시물에 대해 좋아요 상태를 추가
        for (PopupBoardDTO popup : popupList) {
            LikeDTO existingLike = likeMapper.findLike(popup.getBoard_idx(), userId);
            boolean isLiked = existingLike != null;
            popup.setLiked(isLiked); // PopupBoardDTO에 isLiked 필드 추가 필요
        }
        
		return "home";
	}
	@GetMapping("/chat.do")
	public String chat() {
		return "forward:/chat/index.html";
	}
	

}