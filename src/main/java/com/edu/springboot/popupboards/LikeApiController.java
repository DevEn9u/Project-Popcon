package com.edu.springboot.popupboards;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/likes")
public class LikeApiController {

    private final LikeService likeService;
    private final PopupBoardMapper popupBoardMapper;

    @Autowired
    public LikeApiController(LikeService likeService, PopupBoardMapper popupBoardMapper) {
        this.likeService = likeService;
        this.popupBoardMapper = popupBoardMapper;
    }

    // 특정 사용자가 좋아요한 모든 팝업 조회
    @GetMapping("/mypopups")
    public ResponseEntity<List<PopupBoardDTO>> getLikedPopups(Principal principal) {
        if (principal == null) {
            return ResponseEntity.status(401).body(null); // UNAUTHORIZED
        }

        String memberId = principal.getName();
        List<LikeDTO> likes = likeService.getLikesByMemberId(memberId);
        List<PopupBoardDTO> likedPopups = likes.stream()
                .map(like -> popupBoardMapper.popupView(like.getBoard_id()))
                .toList();

        return ResponseEntity.ok(likedPopups);
    }
}
