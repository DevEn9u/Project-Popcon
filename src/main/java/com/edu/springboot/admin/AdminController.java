package com.edu.springboot.admin;

import java.security.Principal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.springboot.board.BoardDTO;
import com.edu.springboot.board.BoardService;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;
import com.edu.springboot.popupboards.PopupBoardMapper;

import lombok.RequiredArgsConstructor;



@Controller
@RequiredArgsConstructor
public class AdminController {
	
	@Autowired
    private final PopupBoardMapper popupBoardMapper;
    private final BoardService boardService;
    private final IMemberService memberService;
	
	//관리자페이지 - 메인
	@GetMapping("/adpage/main.do")
	public String adpageMain(Principal principal, Model model) {
		return "/admin/admin-main";
	}
	
	 //관리자 페이지 - 팝업 게시물 관리
	 @GetMapping("/adpage/popup.do")
	    public String adpagePopup(@RequestParam(name = "category", required = false) String category, Model model, Principal principal) {
		 	List<PopupBoardDTO> popupList;
		 	

	        if (category != null && !category.isEmpty()) {
	            popupList = popupBoardMapper.selectByCategory(category); // 선택한 카테고리 게시물 조회
	        } else {
	            popupList = popupBoardMapper.selectTop8(); // 상위 8개 게시물 조회
	        }
	        
		 	model.addAttribute("popupList", popupList);
	        
	        return "admin/admin-popup"; 
	    }
	 
	    // 팝업게시판 글 삭제
	    @PostMapping("/adpage/delete.do")
	    public String delete(@RequestParam("board_idx") String board_idx) {
	        popupBoardMapper.delete(board_idx);
	        return "redirect:/adpage/popup.do";
	    }
	    
	    //관리자 페이지 - 자유게시판 글 관리
	    @GetMapping("/adpage/free.do")
	    public String listBoards(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
	        List<BoardDTO> boardList = boardService.getFreeBoardsWithPaging(page);
	        // 각 게시글에 대해 작성자 이름 조회
	        for (BoardDTO board : boardList) {
	            MemberDTO member = memberService.getMemberById(board.getWriter());
	            String writerName = (member != null) ? member.getName() : "알 수 없음";
	            board.setWriterName(writerName); // BoardDTO에 writerName 필드 추가 필요
	        }
	        
	        int totalBoardCount = boardService.getFreeBoardCount();
	        int totalPages = (int) Math.ceil((double) totalBoardCount / 10); // 총 페이지 수

	        model.addAttribute("boardList", boardList);
	        model.addAttribute("currentPage", page);
	        model.addAttribute("totalPages", totalPages);

	        // 로그인한 상태라면 자유게시판에 '게시물 작성하기'버튼을 보여주기 위함. 로그인하지 않으면 보이지 않음.
	        try {
	            String id = (String) model.getAttribute("user_id");
	            MemberDTO memberDTO = memberService.getMemberById(id);
	            model.addAttribute("memberDTO", memberDTO);

	        } catch (Exception e) {
	        }

	        return "admin/admin-free";
	    }
	    
	    // 자유게시판 게시글 삭제
	    @GetMapping("/adpage/freedelete.do")
	    public String deleteFreeBoard(@RequestParam("board_idx") String board_idx, Principal principal,
	            RedirectAttributes redirectAttributes) {

	        String userId = principal.getName();
	        BoardDTO board = boardService.getBoardById(board_idx);

	        if (board == null) {
	            redirectAttributes.addFlashAttribute("error", "존재하지 않는 게시글입니다.");
	            return "redirect:/adpage/free.do";
	        }

	        // 게시글 삭제
	        boardService.deleteBoard(board_idx);
	        redirectAttributes.addFlashAttribute("message", "게시글이 삭제되었습니다.");
	        return "redirect:/adpage/free.do";
	    }
	    
	    
	 // 관리자 페이지 - 유저 관리 
	    @GetMapping("/adpage/user.do")
	    public String userManagement(Model model) {
	        return "admin/admin-user"; // 유저 관리 페이지로 이동
	    }

	    @GetMapping("/adpage/user/edit.do")
	    public String editUser(@RequestParam("id") String id, Model model) {
	        // 입력받은 ID로 유저 정보 가져오기
	        MemberDTO member = memberService.getMemberById(id);

	        if (member == null) {
	            model.addAttribute("error", "해당 ID를 가진 유저가 존재하지 않습니다.");
	            return "admin/admin-user"; // 오류가 있으면 다시 유저 관리 페이지로 돌아감
	        }

	        model.addAttribute("member", member); // 유저 정보를 JSP로 전달
	        return "admin/admin-edit-user"; // 유저 정보를 수정할 페이지로 이동
	    }

	    // 유저 정보 업데이트
	    @PostMapping("/adpage/updateUser.do")
	    public String updateUser(@RequestParam("id") String id, @RequestParam("name") String name, RedirectAttributes redirectAttributes) {
	        // 새로운 MemberDTO 객체 생성
	        MemberDTO memberDTO = new MemberDTO();
	        memberDTO.setId(id); // 유저 ID 설정
	        memberDTO.setName(name); // 새로 입력된 이름

	        // 유저 ID와 이름 업데이트
	        int result = memberService.updateMemberName(memberDTO);

	        if (result > 0) {
	            redirectAttributes.addFlashAttribute("message", "유저 정보가 성공적으로 업데이트되었습니다.");
	        } else {
	            redirectAttributes.addFlashAttribute("error", "유저 정보 업데이트에 실패했습니다.");
	        }

	        return "redirect:/adpage/user.do"; // 업데이트 후 유저 관리 페이지로 돌아감
	    }
	    
	    // 유저 강제 탈퇴
	    @PostMapping("/adpage/user/delete.do")
	    public String deleteUser(@RequestParam("id") String id, RedirectAttributes redirectAttributes) {
	        int result = memberService.disableMemberAccount(id);

	        if (result > 0) {
	            redirectAttributes.addFlashAttribute("message", "유저가 강제 탈퇴되었습니다.");
	        } else {
	            redirectAttributes.addFlashAttribute("error", "유저 강제 탈퇴에 실패했습니다.");
	        }

	        return "redirect:/adpage/user.do";
	    }

	    // 유저 아이디 복구
	    @PostMapping("/adpage/user/recover.do")
	    public String recoverUser(@RequestParam("id") String id, RedirectAttributes redirectAttributes) {
	        int result = memberService.recoverMemberAccount(id);

	        if (result > 0) {
	            redirectAttributes.addFlashAttribute("message", "유저가 복구되었습니다.");
	        } else {
	            redirectAttributes.addFlashAttribute("error", "유저 복구에 실패했습니다.");
	        }
	    	
	    	return "redirect:/adpage/user.do";
	    }
	    
	    
		
		@GetMapping("/adpage/chat.do")
		public String adminChat(Model model) {
		    List<MemberDTO> memberList = memberService.getAllMembers(); // 모든 멤버 정보를 가져오는 메서드
		    model.addAttribute("memberList", memberList); // 멤버 목록을 모델에 추가
		    return "/admin/admin-chat"; // JSP 페이지 이름
		}
		

	

}
