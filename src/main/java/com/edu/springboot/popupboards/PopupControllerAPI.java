package com.edu.springboot.popupboards;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.images.ImageDTO;
import com.edu.springboot.images.ImageService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class PopupControllerAPI {
    
    @Autowired
    private final PopupBoardMapper popupBoardMapper;

    
    // 플러터에서 이미지 가져오기 위해 활용
    
    @GetMapping("/api/popupBoard/{board_idx}")
    public ResponseEntity<PopupBoardDTO> getPopupBoard(@PathVariable String board_idx) {
        PopupBoardDTO popupBoard = popupBoardMapper.popupView(board_idx);
        // 필요시 추가적인 정보 설정
        return ResponseEntity.ok(popupBoard);
    }
    
}
