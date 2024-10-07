package com.edu.springboot.popupboards;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {

	 private final LikeMapper likeMapper;

	    @Autowired
	    public LikeService(LikeMapper likeMapper) {
	        this.likeMapper = likeMapper;
	    }

	    // 좋아요 추가 메서드
	    public void addLike(String member_id, String board_id) {
	        LikeDTO likeDTO = new LikeDTO();
	        likeDTO.setMember_id(member_id);
	        likeDTO.setBoard_id(board_id);

	        // 좋아요 추가
	        likeMapper.insertLike(likeDTO);
	    }

	    // 좋아요 추가 또는 삭제 메서드
	    public boolean toggleLike(String board_id, String member_id) {
	        // 현재 사용자가 해당 게시글에 좋아요를 눌렀는지 확인
	        LikeDTO existingLike = likeMapper.findLike(board_id, member_id);

	        if (existingLike != null) {
	            // 좋아요가 이미 눌러진 상태이면 삭제
	            likeMapper.deleteLike(existingLike.getLikes_idx());
	            return false; // 좋아요가 삭제됨
	        } else {
	            // 좋아요가 눌러지지 않은 상태이면 추가
	            addLike(member_id, board_id);
	            return true; // 좋아요가 추가됨
	        }
	    }
	    
	    // 특정 회원이 좋아요한 모든 팝업 조회
	    public List<LikeDTO> getLikesByMemberId(String memberId) {
	        return likeMapper.findLikesByMemberId(memberId);
	    }
	   
}