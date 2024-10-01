package com.edu.springboot.auth;

import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.access.method.P;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp,
                                        Authentication authentication) throws IOException, ServletException {
    	String saveCheck = req.getParameter("saveCheck");
    	if ("on".equals(saveCheck)) {
    		Cookie cookie = new Cookie("SavedUserId", req.getParameter("login_id"));
    		cookie.setMaxAge(60 * 60 * 24 * 1); // 하루동안 유지
    		cookie.setPath("/");
    		resp.addCookie(cookie);
    	}
    	else {
    		Cookie cookie = new Cookie("SavedUserId", null);
    		cookie.setMaxAge(0); // 하루동안 유지
    		cookie.setPath("/");
    		resp.addCookie(cookie);
    	}
    	resp.sendRedirect("/");
    }
}
