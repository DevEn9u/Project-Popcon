package com.edu.springboot.popupboards;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.board.BoardDTO;

@Mapper
public interface PopupBoardMapper {
    
    //IDX 기준 상위 8개의 글만 목록으로 보기 
    public List<PopupBoardDTO> selectTop8();
    
    // 카테고리 기준으로 글 목록 보기
    List<PopupBoardDTO> selectByCategory(@Param("category") String category);
   
    //글쓰기
    public int write(PopupBoardDTO post);
    
    //글보기
    public PopupBoardDTO popupView(String board_idx);
    
    //글삭제
    public void delete(String board_idx);
    
    //글수정
    void edit(PopupBoardDTO popupboardDTO);

}
