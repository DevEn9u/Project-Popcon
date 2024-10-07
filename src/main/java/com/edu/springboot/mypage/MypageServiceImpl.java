// MypageServiceImpl.java
package com.edu.springboot.mypage;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.springboot.board.BoardDTO;
import com.edu.springboot.booking.bookingDTO;
import com.edu.springboot.images.ImageDTO;
import com.edu.springboot.images.ImageService;
import com.edu.springboot.popupboards.CommentDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;

@Service
public class MypageServiceImpl implements IMypageService {

    @Autowired
    private MypageMapper mypageMapper;
    @Autowired
    private ImageService imageService;

    @Override
    public bookingDTO bookingInfo(String member_id) {
        return mypageMapper.bookingInfo(member_id);
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
}
