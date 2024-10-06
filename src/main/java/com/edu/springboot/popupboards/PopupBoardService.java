package com.edu.springboot.popupboards;

import java.util.List;
import org.apache.ibatis.annotations.Options;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.springboot.board.CommentMapper;
import com.edu.springboot.images.ImageDTO;
import com.edu.springboot.images.ImageService;
import com.edu.springboot.popupboards.CommentDTO; // 추가: 댓글 DTO

@Service
public class PopupBoardService {

    @Autowired
    private PopupBoardMapper popupBoardMapper; // Mapper 주입
    @Autowired
    private ImageService imageService;
    
    @Autowired
    private CommentMapper commentMapper; // 댓글 매퍼 추가
    
    public List<PopupBoardDTO> selectTop8() {
        return popupBoardMapper.selectTop8(); // 상위 8개의 게시글을 조회
    }
    
    // 카테고리에 따라 게시물 조회 메소드 추가
    public List<PopupBoardDTO> selectByCategory(String category) {
        return popupBoardMapper.selectByCategory(category); // 입력받은 카테고리의 게시물 조회
    }
    
    // 글보기
    public PopupBoardDTO getBoardDetail(String board_idx) {
        return popupBoardMapper.popupView(board_idx);
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
            // 로그 출력: 각 댓글의 ID 확인
            System.out.println("Comment ID: " + comment.getCom_idx());
            
            // 각 댓글에 대한 이미지 리스트를 가져옴
            List<ImageDTO> images = imageService.getImages(comment.getCom_idx(), "COMMENT");
            comment.setCom_img(images); // 댓글에 이미지를 설정
        }
        return comments; // comments를 반환
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
