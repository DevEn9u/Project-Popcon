package com.edu.springboot.images;

import lombok.Data;
import java.util.Date;

@Data
public class ImagesDTO {
    private String image_idx;       // 이미지 일련번호
    private String image_url;       // 이미지 URL
    private String image_type;      // 이미지 사용 위치 유형
    private String associated_idx;   // 관련된 게시글 또는 댓글의 IDX
    private Date upload_date;       // 이미지 업로드 날짜
}
