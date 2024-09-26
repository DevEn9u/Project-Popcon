package com.edu.springboot.board;

import lombok.Data;
import java.util.Date;

@Data
public class BoardDTO {
    private String board_idx;      // 게시글 일련번호
    private String board_title;    // 제목
    private Date postdate;         // 작성 날짜
    private String contents;        // 내용
    private String images;          // 첨부 이미지 경로
    private String writer;          // 작성자 ID
    private int visitcount;         // 조회수
    private String board_type;      // 게시글 구분 (공지, 자유)
    private String role;            // 권한
}
