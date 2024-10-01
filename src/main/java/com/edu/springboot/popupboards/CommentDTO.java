package com.edu.springboot.popupboards;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {
	 private String com_idx;
	 private String popup_board_idx;
	 private String com_writer;
	 private String com_contents;
	 private Date com_postdate;
	 
	 //날짜를 한국어 형태로
	 public String getFormattedPostDate() {
	     SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
	     return sdf.format(com_postdate);
	 }
}