// MypageServiceImpl.java
package com.edu.springboot.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.springboot.board.BoardDTO;
import com.edu.springboot.booking.bookingDTO;
import com.edu.springboot.images.ImageDTO;
import com.edu.springboot.images.ImageService;
import com.edu.springboot.popupboards.CommentDTO;
import com.edu.springboot.popupboards.LikeDTO;
import com.edu.springboot.popupboards.LikeService;
import com.edu.springboot.popupboards.PopupBoardDTO;
import com.edu.springboot.popupboards.PopupBoardMapper;

@Service
public class MypageServiceImpl implements IMypageService {

    @Autowired
    private MypageMapper mypageMapper;
    @Autowired
    private ImageService imageService;
    @Autowired
    private LikeService likeService;
    @Autowired
    private PopupBoardMapper popupBoardMapper; 

//    @Override
//    public bookingDTO bookingInfo(String member_id) {
//        return mypageMapper.bookingInfo(member_id);
//    }
    
    @Override
    public List<bookingDTO> bookingInfo(String member_id) {
        return mypageMapper.bookingInfo(member_id); // 이미 예약 정보가 리스트로 반환되도록 설정
    }
    
    

    @Override
    public PopupBoardDTO bookingTitle(String board_idx) {
        return mypageMapper.bookingTitle(board_idx);
    }

    @Override
    public List<BoardDTO> getPostsByWriter(String writer, int offset, int limit) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("writer", writer);
        params.put("offset", offset);
        params.put("limit", limit);
        return mypageMapper.getPostsByWriter(params);
    }

    @Override
    public int countPostsByWriter(String writer) {
        return mypageMapper.countPostsByWriter(writer);
    }
    
    @Override
    public List<CommentDTO> getAllReviewsByWriter(String writer) {
        List<CommentDTO> reviews = mypageMapper.getReviewsByWriterAll(writer);
        
        // 각 리뷰에 대한 이미지를 가져와 설정
        for (CommentDTO review : reviews) {
            List<ImageDTO> images = imageService.getImages(review.getCom_idx(), "COMMENT");
            review.setCom_img(images);
        }
        
        return reviews;
    }

    @Override
    public int countReviewsByWriter(String writer) {
        return mypageMapper.countReviewsByWriter(writer);
    }
    
    @Override
    public List<PopupBoardDTO> getLikedPopupsByMemberId(String memberId) {
        List<LikeDTO> likes = likeService.getLikesByMemberId(memberId);
        List<PopupBoardDTO> likedPopups = new ArrayList<>();

        for (LikeDTO like : likes) {
            // 각 좋아요에 해당하는 팝업 게시판 정보 조회
            PopupBoardDTO popup = popupBoardMapper.popupView(like.getBoard_id());
            if (popup != null) {
                likedPopups.add(popup);
            }
        }

        return likedPopups;
    }
    
    @Override
    public void cancelBooking(int booking_num, String member_id) {
        mypageMapper.updateBookingCancellation(booking_num, member_id); // 예약 취소 쿼리 호출
    }
    
}
