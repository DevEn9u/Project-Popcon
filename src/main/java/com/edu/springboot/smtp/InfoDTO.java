package com.edu.springboot.smtp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InfoDTO {
	private String mailServer;
	private String from;
    private String to;
    private String subject;
    private String content;
    private String format; // "text" or "html"
}
