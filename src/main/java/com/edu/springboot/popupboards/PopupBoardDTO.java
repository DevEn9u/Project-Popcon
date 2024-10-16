package com.edu.springboot.popupboards;

import java.sql.Date;
import java.util.List;

import com.edu.springboot.images.ImageDTO;

import lombok.Data;

@Data
public class PopupBoardDTO {
    private String board_idx;      // likes 테이블에서 참조할 게시글 일련번호
    private String board_title;    // 제목
    private Date postdate;        // 작성 날짜
    private String start_date;     // 팝업 시작 날짜
    private String end_date;       // 팝업 종료 날짜
    private String contents;       // 기타 내용
    private String popup_addr;      // 팝업 주소지
    private String thumb;         // 썸네일
    private String category;      // 카테고리
    private String writer;        // 작성자
    private int visitcount;       // 조회수
    private String role;          // 권한
    private int popup_fee;         // 입장료
    private int likes_count;       // 좋아요 수
    private String open_days;      // 팝업 오픈 요일
    private String open_hours;     // 팝업 오픈 시간
    private boolean liked;
    
    private List<ImageDTO> images;      // 연관된 이미지 리스트
    private List<CommentDTO> comments;  // 댓글 리스트 추가
    private String writerName;          // 작성자 이름
}

