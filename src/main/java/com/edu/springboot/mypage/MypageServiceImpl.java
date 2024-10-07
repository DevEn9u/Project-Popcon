// MypageServiceImpl.java
package com.edu.springboot.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.edu.springboot.booking.bookingDTO;
import com.edu.springboot.popupboards.PopupBoardDTO;
import com.edu.springboot.board.BoardDTO;
import java.util.HashMap;
import java.util.List;

@Service
public class MypageServiceImpl implements IMypageService {

    @Autowired
    private MypageMapper mypageMapper;

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
}
