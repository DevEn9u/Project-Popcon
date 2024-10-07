package com.edu.springboot.popupboards;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LikeMapper {
	  // 좋아요 추가 메서드
    void insertLike(LikeDTO likeDTO);
    
    // 좋아요 확인 메서드
    LikeDTO findLike(@Param("board_id") String board_id, @Param("member_id") String member_id);
    
    // 좋아요 삭제 메서드
    void deleteLike(String likes_idx);
}
