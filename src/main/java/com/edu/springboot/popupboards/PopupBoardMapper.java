package com.edu.springboot.popupboards;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PopupBoardMapper {

    // 모든 게시글 목록 조회
    public List<PopupBoardDTO> selectAll();
    
    //IDX 기준 상위 8개의 글만 조회 
    public List<PopupBoardDTO> selectTop8();
    
    // 카테고리 기준으로 게시글 조회
    List<PopupBoardDTO> selectByCategory(@Param("category") String category);
}
