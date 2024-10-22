package com.edu.springboot.smtp;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;

@Service
public class FindIdMail {
    
    @Autowired
    private JavaMailSender javaMailSender;

    // 인증 코드 생성
    public String createVerificationCode() {
        return String.valueOf(100000 + new Random().nextInt(900000)); // 6자리 랜덤 숫자
    }

    // 메일 내용 작성
    private MimeMessage createMessage(String to, String verificationCode) 
            throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        
        message.addRecipients(RecipientType.TO, to); // 보내는 대상
        message.setSubject("POPCON 아이디 찾기 이메일 인증"); // 제목
        
        String msg = "";
        msg += "<div style='margin:100px; text-align: center;'>";
        msg += "<img src=\"https://i.ibb.co/56v664K/Logo.png\" alt=\"Logo\" border=\"0\" text-align=\"center\" >";
        msg += "<br>";
        msg += "<p>아래 인증번호를 아이디 찾기 인증번호에 입력해주세요.<p>";
        msg += "<br>";
        msg += "<p>항상 팝콘을 이용해주셔서 감사합니다.<p>";
        msg += "<br>";
        msg += "<div align='center' style='border:1px solid black; font-family:verdana';>";
        msg += "<h3>아이디 찾기 인증번호</h3>";
        msg += "<div style='font-size:130%'>";
        msg += "CODE : <strong>" + verificationCode + "</strong><div><br/>"; // 메일에 인증번호 넣기
        msg += "</div>";
        
        message.setText(msg, "utf-8", "html"); // 내용, charset 타입, subtype
        message.setFrom(new InternetAddress("dlsrnrk@naver.com", "POPCON_Official")); // 로그인한 사용자 주소 사용
        
        return message;
    }

    // 메일 발송 메소드
    public void sendVerificationEmail(String to, String verificationCode)
    		throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = createMessage(to, verificationCode); // 메일 내용 작성
        javaMailSender.send(message); // 메일 발송
    }
}
