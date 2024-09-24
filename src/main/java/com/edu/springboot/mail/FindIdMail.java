//package com.edu.springboot.mail;
//
//import java.io.UnsupportedEncodingException;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.stereotype.Service;
//
//import jakarta.mail.MessagingException;
//import jakarta.mail.internet.InternetAddress;
//import jakarta.mail.internet.MimeMessage;
//import jakarta.mail.internet.MimeMessage.RecipientType;
//
//@Service
//public class FindIdMail {
//	
//	@Autowired
//	private JavaMailSender javaMailSender;
//
//    public FindIdMail(JavaMailSender javaMailSender) {
//        this.javaMailSender = javaMailSender;
//    }
//
//    public void sendEmail(String to, String subject, String body) {
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(to);
//        message.setSubject(subject);
//        message.setText(body);
//        javaMailSender.send(message);
//    }
//    
//    private String ePw; // 인증번호
//    
//    // 메일 내용 작성
////    @Override
//    public MimeMessage createMessage(String to) 
//    		throws MessagingException, UnsupportedEncodingException {
//    	MimeMessage message = emailsender.createMimeMessage();
//    	
//    	message.addRecipients(RecipientType.TO, to); // 보내는 대상
//    	message.setSubject("POPCON 아이디 찾기 이메일 인증"); // 제목
//    	
//    	String msg = "";
//    	msg += "<div style='margin:100px;'>";
//		msg += "<h1> 안녕하세요</h1>";
//		msg += "<h1> 통합 취업 정보 포탈 GoodJob 입니다</h1>";
//		msg += "<br>";
//		msg += "<p>아래 코드를 회원가입 창으로 돌아가 입력해주세요<p>";
//		msg += "<br>";
//		msg += "<p>항상 당신의 꿈을 응원합니다. 감사합니다!<p>";
//		msg += "<br>";
//		msg += "<div align='center' style='border:1px solid black; font-family:verdana';>";
//		msg += "<h3 style='color:blue;'>회원가입 인증 코드입니다.</h3>";
//		msg += "<div style='font-size:130%'>";
//		msg += "CODE : <strong>";
//		msg += ePw + "</strong><div><br/> "; // 메일에 인증번호 넣기
//		msg += "</div>";
//		message.setText(msg, "utf-8", "html");// 내용, charset 타입, subtype
//		// 보내는 사람의 이메일 주소, 보내는 사람 이름
//		message.setFrom(new InternetAddress("goodjobproject@naver.com", "GoodJob_Admin"));// 보내는 사람
//		
//		return message;
//    }
//}
