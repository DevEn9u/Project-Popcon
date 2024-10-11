package com.edu.springboot.board;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springboot.images.ImageDTO;
import com.edu.springboot.images.ImageService;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.popupboards.CommentDTO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@RestController // @Controller + @ResponseBody 기능 제공
@RequiredArgsConstructor
public class APIController {

    private final BoardService boardService;
    private final ImageService imageService; 
    private final IMemberService memberService;


    @GetMapping("/api/freeBoard/list")
    public ResponseEntity<List<BoardDTO>> listBoards(@RequestParam(value = "page", defaultValue = "1") int page) {
        List<BoardDTO> boardList = boardService.getFreeBoardsWithPaging(page);
        // 각 게시글에 대해 작성자 이름 조회 (이미 BoardService에서 처리됨)
        return ResponseEntity.ok(boardList);
    }

    // 자유게시판 상세보기
    @GetMapping("/api/freeBoard/view/{boardIdx}")
    public ResponseEntity<BoardDTO> freeBoardView(
            @PathVariable("boardIdx") String boardIdx,
            HttpServletRequest request,
            HttpServletResponse response) {
        
        // 쿠키 이름 정의 (예: viewedBoard_{boardIdx})
        String cookieName = "viewedBoard_" + boardIdx;
        boolean shouldIncreaseVisitCount = true;

        // 현재 요청의 쿠키 확인
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    // 이미 조회한 적이 있음
                    shouldIncreaseVisitCount = false;
                    break;
                }
            }
        }

        // 조회수 증가 및 쿠키 설정
        if (shouldIncreaseVisitCount) {
            boardService.updateVisitCount(boardIdx); // 조회수 증가

            // 새로운 쿠키 생성 (24시간 유효)
            Cookie newCookie = new Cookie(cookieName, "true");
            newCookie.setMaxAge(24 * 60 * 60); // 24시간
            newCookie.setPath("/"); // 애플리케이션 전체에서 유효
            // 보안을 위해 필요한 경우 HttpOnly 및 Secure 설정
            // newCookie.setHttpOnly(true);
            // newCookie.setSecure(true);
            response.addCookie(newCookie);
        }

        // 게시글 상세 정보 가져오기 (이미 댓글 포함)
        BoardDTO board = boardService.getBoardById(boardIdx);
        if (board == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        return ResponseEntity.ok(board);
    }

}
