package com.edu.springboot.point;

import java.util.Date;

import lombok.Data;

@Data
public class PointDTO {
	private String p_user; // 포인트를 사용/적립할 유저
    private int p_change;   // 변경된 포인트
    private Date p_change_date; // 포인트 변동 일시
}
