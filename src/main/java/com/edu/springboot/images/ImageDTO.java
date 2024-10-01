package com.edu.springboot.images;

import java.util.Date;

import lombok.Data;

@Data
public class ImageDTO {
    private String image_idx;        // 이미지 일련번호
    private String image_url;        // 이미지 URL
    private String image_type;       // 이미지 타입 ('BOARD', 'POPUP', 'COMMENT')
    private String associated_id;    // 연관된 게시글, 팝업, 댓글 ID
    private Date upload_date;        // 업로드 날짜
}
