package com.edu.springboot.auth;

import java.io.IOException;
import javax.security.auth.login.CredentialExpiredException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

//@Slf4j
//@Configuration
//public class MyLoginSuccessHandler
//	implements AuthenticationSuccessHandler {
//
//	private final Logger log = LoggerFactory.getLogger(getClass());
//	@Override
//	public void onAuthenticationSuccess(HttpServletRequest request,
//										HttpServletResponse response,
//										Authentication authentication)
//					throws IOException, ServletException {
//
//		// 아이디 저장
//		String rememberId = request.getParameter("saveUserId"); // 아이디 저장 여부
//		String login_id = request.getParameter("login_id");		// 아이디
//		log.info("rememberId : " + rememberId);
//	}
//	
//
//}
