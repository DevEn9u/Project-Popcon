package com.edu.springboot.smtp;

import java.io.BufferedReader;
import java.io.FileReader;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;

import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;


@Component
@RequiredArgsConstructor
public class EmailSending {

	private final JavaMailSender mailSender;
	
	@Value("${spring.mail.username}")
	private String from;
	
	public void myEmailSender(InfoDTO infoDTO) {
		
		try {
			// 메일을 보내기 위한 설정을 담당
			MimeMessage m = mailSender.createMimeMessage();
			MimeMessageHelper h = new MimeMessageHelper(m, "UTF-8");
			h.setFrom(from);
			h.setTo(infoDTO.getTo());
			h.setSubject(infoDTO.getSubject());
			// 이메일 형식 분기 - text or HTMl
			if (infoDTO.getFormat().equals("text")) {
				h.setText(infoDTO.getContent());
			}
			else {
				String emailTpl = readHTMLFile();
				String contents = infoDTO.getContent()
						.replace("\r\n", "<br />");
				emailTpl = emailTpl.replace("__CONTENT__", contents);
				h.setText(emailTpl, true);
			}
			
			mailSender.send(m);
			System.out.println("메일이 전송되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 인증코드 발송
	public void sendVerificationCode(String to, String verificationCode) {
		InfoDTO infoDTO = new InfoDTO();
		infoDTO.setTo(to);
		infoDTO.setSubject("아이디 찾기 인증 코드");
		infoDTO.setContent("인증코드 : " + verificationCode);
		infoDTO.setFormat("HTML");
		myEmailSender(infoDTO);
		
	}
	
	// HTML 문서를 읽은 후 반환
	public String readHTMLFile() {
		// 문서의 내용을 읽어 저장하기 위한 StringBuffer(); 인스턴스 생성
		StringBuffer htmlContents = new StringBuffer();
		try {
			// HTML Mail Template이 있는 directory의 물리적 경로를 얻어온다.
			String uploadDir = ResourceUtils
					.getFile("classpath:static/").toPath().toString();
			// 물리적 경로를 얻어와 파일명과 결합하여 변수 선언 및 값 할당
			String templatePath = uploadDir + "/MailTemplate.html";
			// HTML 파일의 내용을 I/O Stream을 통해 한 줄씩 읽어온다.
			BufferedReader br = new BufferedReader(
					new FileReader(templatePath));
			String oneLine;
			while ((oneLine = br.readLine()) != null) {
				// HTML 문서의 내용을 한 줄씩 StringBuffer에 추가한다.
				htmlContents.append(oneLine + "\n");
			}
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 읽어온 내용을 String으로 변환 후 반환
		return htmlContents.toString();
	}
}
