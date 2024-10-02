package com.edu.springboot.auth;

import java.io.IOException;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
    	
        // 사용자 정보 반환
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();
        String userId = req.getParameter("login_id");
        // 추가 정보가 필요하면 여기에 포함
        resp.getWriter().write(objectMapper.writeValueAsString(Map.of("userId", userId)));
    	
    	resp.sendRedirect("/");
    }
}
