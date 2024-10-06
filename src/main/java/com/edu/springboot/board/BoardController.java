package com.edu.springboot.board;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.springboot.images.ImageDTO;
import com.edu.springboot.images.ImageService;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.popupboards.CommentDTO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;
    private final ImageService imageService;
    private final IMemberService memberService;

    @Value("${file.upload-dir}")
    private String uploadDir;

    private static final String[] ALLOWED_EXTENSIONS = { ".jpg", ".jpeg", ".png", ".gif", ".webp" };
    private static final long MAX_FILE_SIZE = 10 * 1024 * 1024; // 10MB

    /////////////////////////////////////////////// 자유게시판///////////////////////////////////////////////////////////
    // 자유게시판 목록
    @GetMapping("/freeBoard/list.do")
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

        return "boards/free-board-list";
    }

    // 자유게시판 상세보기
    @GetMapping("/freeBoard/view.do")
    public String freeBoardView(@RequestParam("board_idx") String boardIdx,
            @RequestParam(value = "editingCommentId", required = false) String editingCommentId, Model model,
            HttpServletRequest request, HttpServletResponse response) {

        // 조회수 증가 여부를 결정하는 로직
        boolean shouldIncreaseVisitCount = true;

        // 1. 쿠키가 있는지 확인
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("viewedBoard_" + boardIdx)) {
                    // 이미 조회한 적이 있다면 조회수 증가 안 함
                    shouldIncreaseVisitCount = false;
                    break;
                }
            }
        }

        // 2. 조회수 증가 로직 (쿠키가 없을 때만 증가)
        if (shouldIncreaseVisitCount) {
            boardService.updateVisitCount(boardIdx); // 조회수 증가

            // 3. 쿠키 설정 (24시간 동안 유지)
            Cookie newCookie = new Cookie("viewedBoard_" + boardIdx, "true");
            newCookie.setMaxAge(24 * 60 * 60); // 24시간 동안 유효
            newCookie.setPath("/"); // 애플리케이션 전체에서 쿠키 유효
            response.addCookie(newCookie);
        }

        // 게시글 상세 정보 가져오기
        BoardDTO board = boardService.getBoardById(boardIdx);
        
        // 작성자 이름 조회
        MemberDTO member = memberService.getMemberById(board.getWriter());
        String writerName = (member != null) ? member.getName() : "알 수 없음";
        model.addAttribute("writerName", writerName);
        
        model.addAttribute("dto", board);

        // 관련 이미지 가져오기
        List<ImageDTO> images = imageService.getImages(boardIdx, "BOARD");
        model.addAttribute("images", images);

        // 댓글 목록 가져오기
        List<CommentDTO> comments = boardService.getComments(boardIdx);
        // 각 댓글에 대해 작성자 이름 조회
        for (CommentDTO comment : comments) {
            MemberDTO coMember = memberService.getMemberById(comment.getCom_writer());
            String comWriterName = (coMember != null) ? coMember.getName() : "알 수 없음";
            comment.setComWriterName(comWriterName); // CommentDTO에 comWriterName 필드 추가 필요
        }
        model.addAttribute("comments", comments);
        model.addAttribute("editingCommentId", editingCommentId);
        return "boards/free-board-view";
    }

    // 게시글 작성 화면 호출
    @GetMapping("/freeBoard/write.do")
    public String writeBoardForm() {
        return "boards/free-board-write"; // 게시글 작성 JSP 파일
    }

    // 게시글 작성 처리
    @PostMapping("/freeBoard/write.do")
    public String writePost(BoardDTO boardDTO, @RequestParam("imageFile") MultipartFile[] imageFiles,
            Principal principal, RedirectAttributes redirectAttributes) {
        // 로그인 여부 확인
        if (principal == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login.do"; // 로그인 페이지로 리다이렉트
        }

        String userId = principal.getName();
        boardDTO.setWriter(userId); // 작성자에 userId 설정
        MemberDTO member = memberService.getMemberById(userId);
        // 디버그 로그 추가
        System.out.println("writePost - userId: " + userId);
        System.out.println("writePost - boardDTO.writer: " + boardDTO.getWriter());


        // board_type을 'free'로 설정
        boardDTO.setBoard_type("free");
        // role을 'ROLE_NORMAL'로 설정
        boardDTO.setRole("ROLE_NORMAL");
        // 게시글 저장
        boardService.write(boardDTO);

        // 게시글 ID (board_idx) 획득
        String boardIdx = boardDTO.getBoard_idx();
        System.out.println("Generated boardIdx: " + boardIdx);
        // 이미지 처리
        if (imageFiles != null && imageFiles.length > 0) {
            for (MultipartFile file : imageFiles) {
                if (!file.isEmpty()) {
                    // 파일 확장자 검증
                    String originalFilename = org.springframework.util.StringUtils.cleanPath(file.getOriginalFilename());
                    String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."))
                            .toLowerCase();
                    if (!Arrays.asList(ALLOWED_EXTENSIONS).contains(fileExtension)) {
                        redirectAttributes.addFlashAttribute("error", "허용되지 않은 파일 형식입니다.");
                        continue;
                    }
                    // 파일 크기 검증
                    if (file.getSize() > MAX_FILE_SIZE) {
                        redirectAttributes.addFlashAttribute("error", "파일 크기는 10MB 이하이어야 합니다.");
                        continue;
                    }
                    try {
                        // 파일 저장
                        String newFilename = UUID.randomUUID().toString() + fileExtension;
                        File dest = new File(uploadDir + "/" + newFilename);
                        file.transferTo(dest);

                        // 이미지 URL 설정 (웹 접근 가능한 경로)
                        String imageUrl = "/uploads/images/" + newFilename;

                        // ImageDTO 생성 및 저장
                        ImageDTO imageDTO = new ImageDTO();
                        imageDTO.setImage_url(imageUrl);
                        imageDTO.setImage_type("BOARD");
                        imageDTO.setAssociated_id(boardIdx);
                        imageService.saveImage(imageDTO);

                    } catch (IOException e) {
                        e.printStackTrace();
                        redirectAttributes.addFlashAttribute("error", "파일 업로드 중 오류가 발생했습니다.");
                    }
                }
            }
        }

        redirectAttributes.addFlashAttribute("message", "게시글이 등록되었습니다.");
        return "redirect:/freeBoard/list.do";
    }

    // 게시글 수정 화면 호출
    @GetMapping("/freeBoard/edit.do")
    public String editFreeBoardForm(@RequestParam("board_idx") String boardIdx, Model model) {
        BoardDTO boardDTO = boardService.getBoardById(boardIdx);
        model.addAttribute("dto", boardDTO); // 게시글 정보를 모델에 추가

        // 관련 이미지 가져오기
        List<ImageDTO> images = imageService.getImages(boardIdx, "BOARD");
        model.addAttribute("images", images);

        return "boards/free-board-edit"; // 수정 JSP 파일
    }

    // 게시글 수정 처리
    @PostMapping("/freeBoard/update.do")
    public String editFreePost(@RequestParam("board_idx") String boardIdx, BoardDTO boardDTO, Principal principal,
            @RequestParam(value = "imageFile", required = false) MultipartFile[] imageFiles,
            RedirectAttributes redirectAttributes) {
    	
        // 로그인 여부 확인
        if (principal == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login.do";
        }

        String userId = principal.getName();
        BoardDTO existingBoard = boardService.getBoardById(boardIdx);

        if (existingBoard == null) {
            redirectAttributes.addFlashAttribute("error", "존재하지 않는 게시글입니다.");
            return "redirect:/freeBoard/list.do";
        }
        
        // 게시글 작성자와 로그인한 사용자 비교
        if (!userId.equals(existingBoard.getWriter())) {
            redirectAttributes.addFlashAttribute("error", "수정 권한이 없습니다.");
            return "redirect:/freeBoard/view.do?board_idx=" + boardIdx;
        }
    	
        boardDTO.setBoard_idx(boardIdx);
        boardService.update(boardDTO); // 게시글 업데이트

        // 새로운 이미지 처리
        if (imageFiles != null && imageFiles.length > 0) {
            for (MultipartFile file : imageFiles) {
                if (!file.isEmpty()) {
                    // 파일 확장자 검증
                    String originalFilename = org.springframework.util.StringUtils.cleanPath(file.getOriginalFilename());
                    String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."))
                            .toLowerCase();
                    if (!Arrays.asList(ALLOWED_EXTENSIONS).contains(fileExtension)) {
                        redirectAttributes.addFlashAttribute("error", "허용되지 않은 파일 형식입니다.");
                        continue;
                    }
                    // 파일 크기 검증
                    if (file.getSize() > MAX_FILE_SIZE) {
                        redirectAttributes.addFlashAttribute("error", "파일 크기는 10MB 이하이어야 합니다.");
                        continue;
                    }
                    try {
                        // 파일 저장
                        String newFilename = UUID.randomUUID().toString() + fileExtension;
                        File dest = new File(uploadDir + "/" + newFilename);
                        file.transferTo(dest);

                        // 이미지 URL 설정 (웹 접근 가능한 경로)
                        String imageUrl = "/uploads/images/" + newFilename;

                        // ImageDTO 생성 및 저장
                        ImageDTO imageDTO = new ImageDTO();
                        imageDTO.setImage_url(imageUrl);
                        imageDTO.setImage_type("BOARD");
                        imageDTO.setAssociated_id(boardIdx);
                        imageService.saveImage(imageDTO);

                    } catch (IOException e) {
                        e.printStackTrace();
                        redirectAttributes.addFlashAttribute("error", "파일 업로드 중 오류가 발생했습니다.");
                    }
                }
            }
        }

        redirectAttributes.addFlashAttribute("message", "게시글이 수정되었습니다.");
        return "redirect:/freeBoard/view.do?board_idx=" + boardIdx;
    }

    // 게시글 삭제
    @GetMapping("/freeBoard/delete.do")
    public String deleteFreeBoard(@RequestParam("board_idx") String board_idx, Principal principal,
            RedirectAttributes redirectAttributes) {
        // 로그인 여부 확인
        if (principal == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login.do";
        }

        String userId = principal.getName();
        BoardDTO board = boardService.getBoardById(board_idx);

        if (board == null) {
            redirectAttributes.addFlashAttribute("error", "존재하지 않는 게시글입니다.");
            return "redirect:/freeBoard/list.do";
        }

        // 게시글 작성자와 로그인한 사용자 비교
        if (!userId.equals(board.getWriter())) {
            redirectAttributes.addFlashAttribute("error", "삭제 권한이 없습니다.");
            return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
        }

        // 게시글 삭제
        boardService.deleteBoard(board_idx);
        redirectAttributes.addFlashAttribute("message", "게시글이 삭제되었습니다.");
        return "redirect:/freeBoard/list.do";
    }


    // 게시글 이미지 삭제
    @GetMapping("/freeBoard/deleteImage.do")
    public String deleteImage(@RequestParam("image_idx") String imageIdx, @RequestParam("board_idx") String boardIdx) {
        ImageDTO image = imageService.getImageById(imageIdx);
        if (image != null) {
            // 파일 삭제
            String filePath = uploadDir + "/" + image.getImage_url().replace("/uploads/images/", "");
            File file = new File(filePath);
            if (file.exists()) {
                file.delete();
            }
            // DB에서 이미지 삭제
            imageService.deleteImage(imageIdx);
        }
        // 리다이렉트 URL에 앵커 추가
        return "redirect:/freeBoard/edit.do?board_idx=" + boardIdx + "#image_section";
    }

    // 댓글 작성
    @PostMapping("/freeBoard/writeComment.do")
    public String writeComment(@RequestParam("board_idx") String board_idx,
            @RequestParam("com_contents") String com_contents, @ModelAttribute CommentDTO comment,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile, Principal principal,
            RedirectAttributes redirectAttributes) {
        // 로그인 여부 확인
        if (principal == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login.do";
        }

        String userId = principal.getName();
        MemberDTO member = memberService.getMemberById(userId);

        if (member == null) {
            redirectAttributes.addFlashAttribute("error", "사용자 정보를 가져올 수 없습니다.");
            return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
        }


        // 댓글 DTO 생성 및 값 설정
        CommentDTO commentDTO = new CommentDTO();
        commentDTO.setBoard_idx(board_idx);
        commentDTO.setCom_writer(userId); // 작성자에 userId 설정
        commentDTO.setCom_contents(com_contents);

        // 댓글 저장 (com_idx가 생성됨)
        boardService.writeComment(commentDTO);
        String com_idx = commentDTO.getCom_idx();
        System.out.println("저장된 댓글 ID: " + commentDTO.getCom_idx());

        // 이미지 처리
        if (imageFile != null && !imageFile.isEmpty()) {
            // 파일 확장자 검증
            String originalFilename = org.springframework.util.StringUtils.cleanPath(imageFile.getOriginalFilename());
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
            if (!Arrays.asList(ALLOWED_EXTENSIONS).contains(fileExtension)) {
                redirectAttributes.addFlashAttribute("error", "허용되지 않은 파일 형식입니다.");
                return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
            }
            // 파일 크기 검증
            if (imageFile.getSize() > MAX_FILE_SIZE) {
                redirectAttributes.addFlashAttribute("error", "파일 크기는 10MB 이하이어야 합니다.");
                return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
            }
            try {
                // 파일 저장
                String newFilename = UUID.randomUUID().toString() + fileExtension;
                File dest = new File(uploadDir + "/" + newFilename);
                imageFile.transferTo(dest);

                // 이미지 URL 설정 (웹 접근 가능한 경로)
                String imageUrl = "/uploads/images/" + newFilename;

                // ImageDTO 생성 및 저장
                ImageDTO imageDTO = new ImageDTO();
                imageDTO.setImage_url(imageUrl);
                imageDTO.setImage_type("COMMENT");
                imageDTO.setAssociated_id(com_idx); // 댓글 ID와 연관
                imageService.saveImage(imageDTO);

            } catch (IOException e) {
                e.printStackTrace();
                redirectAttributes.addFlashAttribute("error", "파일 업로드 중 오류가 발생했습니다.");
                return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
            }
        }

        redirectAttributes.addFlashAttribute("message", "댓글이 작성되었습니다.");
        // 새로 작성된 댓글의 com_idx를 이용해 앵커 추가
        return "redirect:/freeBoard/view.do?board_idx=" + commentDTO.getBoard_idx() + "#comment_" + commentDTO.getCom_idx();
    }

    // 댓글 삭제
    @PostMapping("/freeBoard/deleteComment.do")
    public String deleteComment(@RequestParam("com_idx") String com_idx,
            @RequestParam("board_idx") String board_idx, Principal principal, RedirectAttributes redirectAttributes) {
        // 로그인 여부 확인
        if (principal == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login.do"; // 로그인 페이지로 리다이렉트
        }

        String userId = principal.getName();
        MemberDTO member = memberService.getMemberById(userId);

        if (member == null) {
            redirectAttributes.addFlashAttribute("error", "사용자 정보를 가져올 수 없습니다.");
            return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
        }


        CommentDTO existingComment = boardService.getCommentById(com_idx);

        // 댓글 작성자와 로그인한 사용자 비교
        if (!userId.equals(existingComment.getCom_writer())) {
            redirectAttributes.addFlashAttribute("error", "삭제 권한이 없습니다.");
            return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
        }
        // 댓글 삭제
        boardService.deleteComment(com_idx);
        redirectAttributes.addFlashAttribute("message", "댓글이 삭제되었습니다.");
        // 삭제 후 댓글 목록의 시작 부분으로 앵커 추가
        return "redirect:/freeBoard/view.do?board_idx=" + board_idx + "#comments_section";
    }
    
    

    // 댓글 수정
    @PostMapping("/freeBoard/editComment.do")
    public String editComment(@RequestParam("com_idx") String com_idx,
            @RequestParam("board_idx") String board_idx, @RequestParam("com_contents") String com_contents,
            @RequestParam(value = "deleteImageIds", required = false) List<String> deleteImageIds,
            @RequestParam(value = "newImageFile", required = false) MultipartFile newImageFile, Principal principal,
            RedirectAttributes redirectAttributes) {
        // 로그인 여부 확인
        if (principal == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login.do"; // 로그인 페이지로 리다이렉트
        }

        String userId = principal.getName();
        MemberDTO member = memberService.getMemberById(userId);

        if (member == null) {
            redirectAttributes.addFlashAttribute("error", "사용자 정보를 가져올 수 없습니다.");
            return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
        }


        // 댓글 작성자 확인
        CommentDTO existingComment = boardService.getCommentById(com_idx);
        // 댓글 작성자와 로그인한 사용자 비교
        if (!userId.equals(existingComment.getCom_writer())) {
            redirectAttributes.addFlashAttribute("error", "삭제 권한이 없습니다.");
            return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
        }

        // 댓글 내용 업데이트
        CommentDTO commentDTO = new CommentDTO();
        commentDTO.setCom_idx(com_idx);
        commentDTO.setCom_contents(com_contents);
        boardService.editComment(commentDTO);

        // 이미지 삭제 처리
        if (deleteImageIds != null && !deleteImageIds.isEmpty()) {
            for (String imageIdx : deleteImageIds) {
                imageService.deleteImage(imageIdx);
                // 실제 파일 삭제 로직 추가 필요
            }
        }

        // 새로운 이미지 업로드 처리
        if (newImageFile != null && !newImageFile.isEmpty()) {
            // 파일 확장자 검증
            String originalFilename = org.springframework.util.StringUtils.cleanPath(newImageFile.getOriginalFilename());
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
            if (!Arrays.asList(ALLOWED_EXTENSIONS).contains(fileExtension)) {
                redirectAttributes.addFlashAttribute("error", "허용되지 않은 파일 형식입니다.");
                return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
            }
            // 파일 크기 검증
            if (newImageFile.getSize() > MAX_FILE_SIZE) {
                redirectAttributes.addFlashAttribute("error", "파일 크기는 10MB 이하이어야 합니다.");
                return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
            }
            try {
                // 파일 저장
                String newFilename = UUID.randomUUID().toString() + fileExtension;
                File dest = new File(uploadDir + "/" + newFilename);
                newImageFile.transferTo(dest);

                // 이미지 URL 설정 (웹 접근 가능한 경로)
                String imageUrl = "/uploads/images/" + newFilename;

                // ImageDTO 생성 및 저장
                ImageDTO imageDTO = new ImageDTO();
                imageDTO.setImage_url(imageUrl);
                imageDTO.setImage_type("COMMENT");
                imageDTO.setAssociated_id(com_idx); // 댓글 ID와 연관
                imageService.saveImage(imageDTO);

            } catch (IOException e) {
                e.printStackTrace();
                redirectAttributes.addFlashAttribute("error", "파일 업로드 중 오류가 발생했습니다.");
                return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
            }
        }

        redirectAttributes.addFlashAttribute("message", "댓글이 수정되었습니다.");
        return "redirect:/freeBoard/view.do?board_idx=" + board_idx + "#comment_" + com_idx;
    }

    // 댓글 이미지 삭제
    @GetMapping("/freeBoard/deleteCommentImage.do")
    public String deleteCommentImage(@RequestParam("image_idx") String image_idx,
            @RequestParam("board_idx") String board_idx, @RequestParam("com_idx") String com_idx, Principal principal,
            RedirectAttributes redirectAttributes) {
        // 로그인 여부 확인
        if (principal == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login.do"; // 로그인 페이지로 리다이렉트
        }

        String userId = principal.getName();
        MemberDTO member = memberService.getMemberById(userId);

        if (member == null) {
            redirectAttributes.addFlashAttribute("error", "사용자 정보를 가져올 수 없습니다.");
            return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
        }

        // 댓글 작성자 확인
        CommentDTO existingComment = boardService.getCommentById(com_idx);
        if (!userId.equals(existingComment.getCom_writer()) && !"ROLE_ADMIN".equals(member.getAuthority())) {
            redirectAttributes.addFlashAttribute("error", "이미지 삭제 권한이 없습니다.");
            return "redirect:/freeBoard/view.do?board_idx=" + board_idx;
        }

        // 이미지 삭제
        imageService.deleteImage(image_idx);

        redirectAttributes.addFlashAttribute("message", "이미지가 삭제되었습니다.");
        // 수정 모드로 리다이렉트
        return "redirect:/freeBoard/view.do?board_idx=" + board_idx + "&editingCommentId=" + com_idx + "#comment_"
                + com_idx;
    }


    /////////////////////////////////////////////////////// 공지/////////////////////////////////////////////////////
    // 공지 목록
    @GetMapping("/noticeBoard/list.do")
    public String getNoticeBoard(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        List<BoardDTO> noticeList = boardService.getNoticeBoardsWithPaging(page);
        
        // 각 게시글에 대해 작성자 이름 조회
        for (BoardDTO board : noticeList) {
            MemberDTO member = memberService.getMemberById(board.getWriter());
            String writerName = (member != null) ? member.getName() : "알 수 없음";
            board.setWriterName(writerName); // BoardDTO에 writerName 필드 추가 필요
        }
        
        int totalBoardCount = boardService.getNoticeBoardCount();
        int totalPages = (int) Math.ceil((double) totalBoardCount / 10); // 총 페이지 수

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        // ADMIN 계정에만 공지사항에 '게시물 작성하기'버튼을 보여주기 위함.
        try {
            String id = (String) model.getAttribute("user_id");
            MemberDTO memberDTO = memberService.getMemberById(id);
            model.addAttribute("memberDTO", memberDTO);
        } catch (Exception e) {
        }

        return "boards/notice-board-list";
    }


 // 공지 상세보기
    @GetMapping("/noticeBoard/view.do")
    public String viewNoticeBoard(@RequestParam("board_idx") String boardIdx, Model model, HttpServletRequest request,
            HttpServletResponse response) {

        // 조회수 증가 여부를 결정하는 로직
        boolean shouldIncreaseVisitCount = true;

        // 1. 쿠키가 있는지 확인
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("viewedBoard_" + boardIdx)) {
                    // 이미 조회한 적이 있다면 조회수 증가 안 함
                    shouldIncreaseVisitCount = false;
                    break;
                }
            }
        }

        // 2. 조회수 증가 로직 (쿠키가 없을 때만 증가)
        if (shouldIncreaseVisitCount) {
            boardService.updateVisitCount(boardIdx); // 조회수 증가

            // 3. 쿠키 설정 (24시간 동안 유지)
            Cookie newCookie = new Cookie("viewedBoard_" + boardIdx, "true");
            newCookie.setMaxAge(24 * 60 * 60); // 24시간 동안 유효
            newCookie.setPath("/"); // 애플리케이션 전체에서 쿠키 유효
            response.addCookie(newCookie);
        }

        // 게시글 상세 정보 가져오기
        BoardDTO boardDTO = boardService.getBoardById(boardIdx);
        
        if (boardDTO == null) {
            // 게시글이 없을 경우 처리 (예: 에러 페이지로 이동)
            return "redirect:/noticeBoard/list.do";
        }

        // 작성자 이름 조회
        MemberDTO member = memberService.getMemberById(boardDTO.getWriter());
        String writerName = (member != null) ? member.getName() : "알 수 없음";
        model.addAttribute("writerName", writerName);
        
        model.addAttribute("dto", boardDTO);

        // 관련 이미지 가져오기
        List<ImageDTO> images = imageService.getImages(boardIdx, "BOARD");
        model.addAttribute("images", images);

        return "boards/notice-board-view";
    }



    // 공지 작성 화면 호출
    @GetMapping("/noticeBoard/write.do")
    public String writeNoticeBoardForm() {
        return "boards/notice-board-write"; // 게시글 작성 JSP 파일
    }

 // 공지 작성 처리
    @PostMapping("/noticeBoard/write.do")
    public String writeNoticePost(BoardDTO boardDTO, Principal principal, RedirectAttributes redirectAttributes) {
        // 로그인 여부 확인
        if (principal == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login.do";
        }

        String userId = principal.getName();
        MemberDTO member = memberService.getMemberById(userId);

        if (member != null && "ROLE_ADMIN".equals(member.getAuthority())) {
            boardDTO.setWriter(userId); // 작성자에 userId 설정
            // board_type을 'notice'로 설정
            boardDTO.setBoard_type("notice");
            boardDTO.setRole("ROLE_ADMIN"); // 공지게시판 작성 시 ROLE_ADMIN 설정
            boardService.write(boardDTO);
            redirectAttributes.addFlashAttribute("message", "공지사항이 등록되었습니다.");
            return "redirect:/noticeBoard/list.do";
        } else {
            redirectAttributes.addFlashAttribute("error", "공지사항 작성 권한이 없습니다.");
            return "redirect:/noticeBoard/list.do";
        }
    }

    // 공지 수정 화면 호출
    @GetMapping("/noticeBoard/edit.do") // 경로를 edit로 변경
    public String editNoticeBoardForm(@RequestParam("board_idx") String boardIdx, Model model, Principal principal,
            RedirectAttributes redirectAttributes) {
        // 로그인 여부 및 권한 확인
        if (principal == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login.do";
        }

        String userId = principal.getName();
        MemberDTO member = memberService.getMemberById(userId);

        if (member == null || !"ROLE_ADMIN".equals(member.getAuthority())) {
            redirectAttributes.addFlashAttribute("error", "수정 권한이 없습니다.");
            return "redirect:/noticeBoard/view.do?board_idx=" + boardIdx;
        }

        BoardDTO boardDTO = boardService.getBoardById(boardIdx);
        model.addAttribute("dto", boardDTO); // 게시글 정보를 모델에 추가
        return "boards/notice-board-edit"; // 수정 JSP 파일
    }

    // 공지 수정 처리
    @PostMapping("/noticeBoard/update.do")
    public String editPost(@RequestParam("board_idx") String boardIdx, BoardDTO boardDTO, Principal principal,
            RedirectAttributes redirectAttributes) {
        // 로그인 여부 및 권한 확인
        if (principal == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login.do";
        }

        String userId = principal.getName();
        MemberDTO member = memberService.getMemberById(userId);

        if (member == null || !"ROLE_ADMIN".equals(member.getAuthority())) {
            redirectAttributes.addFlashAttribute("error", "수정 권한이 없습니다.");
            return "redirect:/noticeBoard/view.do?board_idx=" + boardIdx;
        }

        boardDTO.setBoard_idx(boardIdx);
        boardService.update(boardDTO); // 서비스 호출
        redirectAttributes.addFlashAttribute("message", "게시글이 수정되었습니다.");
        return "redirect:/noticeBoard/view.do?board_idx=" + boardIdx;
    }

    // 공지 삭제
    @GetMapping("/noticeBoard/delete.do")
    public String deleteNoticeBoard(@RequestParam("board_idx") String board_idx, Principal principal,
            RedirectAttributes redirectAttributes) {
        // 로그인 여부 및 권한 확인
        if (principal == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login.do";
        }

        String userId = principal.getName();
        MemberDTO member = memberService.getMemberById(userId);

        if (member == null || !"ROLE_ADMIN".equals(member.getAuthority())) {
            redirectAttributes.addFlashAttribute("error", "삭제 권한이 없습니다.");
            return "redirect:/noticeBoard/view.do?board_idx=" + board_idx;
        }

        boardService.deleteBoard(board_idx);
        redirectAttributes.addFlashAttribute("message", "공지사항이 삭제되었습니다.");
        return "redirect:/noticeBoard/list.do";
    }
}
