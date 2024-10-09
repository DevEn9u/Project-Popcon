package com.edu.springboot.popupboards;

import java.util.List;

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
    
    // 특정 회원이 좋아요한 모든 팝업 조회
    List<LikeDTO> findLikesByMemberId(@Param("member_id") String member_id);
}
