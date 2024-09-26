package com.edu.springboot.popupboards;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PopupBoardService {

    @Autowired
    private PopupBoardMapper popupBoardMapper; // Mapper 주입

    public List<PopupBoardDTO> selectAll() {
        return popupBoardMapper.selectAll(); // Mapper의 selectAll 메소드를 호출
    }
    
    public List<PopupBoardDTO> selectTop8() {
        return popupBoardMapper.selectTop8(); // 상위 8개의 게시글을 조회
    }
    
 // 카테고리에 따라 게시물 조회 메소드 추가
    public List<PopupBoardDTO> selectByCategory(String category) {
        return popupBoardMapper.selectByCategory(category); // 입력받은 카테고리의 게시물 조회
    }
}
