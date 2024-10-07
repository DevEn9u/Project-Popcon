package com.edu.springboot;

import java.security.Principal;
import java.util.List;

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
		
	@GetMapping("/")
	public String home(Model model) {
		
	    
	    List<PopupBoardDTO> topPopups = popupBoardService.selectTop6(); // 상위 6개 게시글 추가
	    model.addAttribute("topPopups", topPopups); // JSP로 데이터 전송
	    
	    List<PopupBoardDTO> randomPosts = popupBoardService.selectRandomPosts(); // 무작위 6개 게시글 추가
	    model.addAttribute("randomPosts", randomPosts); // JSP로 데이터 전송
        
        
		return "home";
	}
	@GetMapping("/chat.do")
	public String chat() {
		return "forward:/chat/index.html";
	}
	

}