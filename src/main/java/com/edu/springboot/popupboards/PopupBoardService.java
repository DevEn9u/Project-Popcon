package com.edu.springboot.popupboards;

import java.util.List;

import org.apache.ibatis.annotations.Options;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.springboot.board.CommentMapper;
import com.edu.springboot.images.ImageDTO;
import com.edu.springboot.images.ImageService;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;

@Service
public class PopupBoardService {

    @Autowired
    private PopupBoardMapper popupBoardMapper; // Mapper 주입
    @Autowired
    private ImageService imageService;
    
    @Autowired
    private CommentMapper commentMapper; // 댓글 매퍼 추가
    @Autowired
    private IMemberService memberService; // 회원 서비스 추가
    
    public List<PopupBoardDTO> selectTop8() {
        return popupBoardMapper.selectTop8(); // 상위 8개의 게시글을 조회
    }
    public List<PopupBoardDTO> selectAll() {
        return popupBoardMapper.selectAll(); // 전체 게시글 조회
    }
    
    public List<PopupBoardDTO> selectTop6() {
        return popupBoardMapper.selectTop6(); // 상위 6개의 게시글을 조회
    }
    
    public List<PopupBoardDTO> selectRandomPosts() {
        return popupBoardMapper.selectRandomPosts(); // 무작위로 6개의 게시글을 조회
    }
    
    public List<PopupBoardDTO> selectByLikes() {
        return popupBoardMapper.selectByLikes(); // 좋아요가 많은 순으로 게시글 조회
    }
    
    // 카테고리에 따라 게시물 조회 메소드 추가
    public List<PopupBoardDTO> selectByCategory(String category) {
        return popupBoardMapper.selectByCategory(category); // 입력받은 카테고리의 게시물 조회
    }
    
    // 글보기
    public PopupBoardDTO getBoardDetail(String board_idx) {
        PopupBoardDTO popupBoard = popupBoardMapper.popupView(board_idx);
        if (popupBoard != null) {
            // 작성자 이름 설정
            MemberDTO member = memberService.getMemberById(popupBoard.getWriter());
            String writerName = (member != null) ? member.getName() : "알 수 없음";
            popupBoard.setWriterName(writerName);

            // 관련 이미지 가져오기
            List<ImageDTO> images = imageService.getImages(board_idx, "POPUP");
            popupBoard.setImages(images);

            // 관련 댓글 가져오기
            List<CommentDTO> comments = getComments(board_idx);
            popupBoard.setComments(comments);
        }
        return popupBoard;
    }
    
    // 글쓰기
    @Options(useGeneratedKeys = true, keyProperty = "board_idx")
    public int write(PopupBoardDTO post) {
    	return popupBoardMapper.write(post);
    }
    
    
    // 글삭제
    public void delete(String board_idx) {
        popupBoardMapper.delete(board_idx);
    }
    
    // 글수정
    public void edit(PopupBoardDTO popupboardDTO) {
        popupBoardMapper.edit(popupboardDTO); 
    }
    
 // 댓글 작성
    @Transactional
    public void writeComment(CommentDTO comment) {
        commentMapper.popup_writeComment(comment); // 수정: commentMapper 사용
    }
    
    

    // 특정 팝업 게시글의 댓글 목록 조회
    public List<CommentDTO> getComments(String popup_board_idx) {
        List<CommentDTO> comments = popupBoardMapper.getComments(popup_board_idx);
        for (CommentDTO comment : comments) {
            // 댓글 작성자 이름 설정
            MemberDTO coMember = memberService.getMemberById(comment.getCom_writer());
            String comWriterName = (coMember != null) ? coMember.getName() : "알 수 없음";
            comment.setComWriterName(comWriterName);

            // 댓글에 대한 이미지 리스트 설정
            List<ImageDTO> images = imageService.getImages(comment.getCom_idx(), "COMMENT");
            comment.setCom_img(images);
        }
        return comments;
    }

    
    //댓글 삭제
    public void deleteComment(String com_idx) {
        popupBoardMapper.deleteComment(com_idx);
    }
    
    //댓글 수정
    public int editComment(CommentDTO commentDTO) {
        return popupBoardMapper.editComment(commentDTO);
    }
    
    // 썸네일 지우기
    public void deleteThumbnail(String board_idx) {
        popupBoardMapper.deleteThumbnail(board_idx); // Mapper 메서드 호출
    }

}
