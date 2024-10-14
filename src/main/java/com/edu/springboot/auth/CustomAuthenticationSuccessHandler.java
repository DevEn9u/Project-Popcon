package com.edu.springboot.auth;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private JwtUtil jwtUtil;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp,
                                        Authentication authentication) throws IOException, ServletException {
        String saveCheck = req.getParameter("saveCheck");
        if ("on".equals(saveCheck)) {
            Cookie cookie = new Cookie("SavedUserId", req.getParameter("login_id"));
            cookie.setMaxAge(60 * 60 * 24 * 1); // 하루 동안 유지
            cookie.setPath("/");
            resp.addCookie(cookie);
        } else {
            Cookie cookie = new Cookie("SavedUserId", null);
            cookie.setMaxAge(0); // 쿠키 삭제
            cookie.setPath("/");
            resp.addCookie(cookie);
        }

        // 폼 기반 로그인 성공 시 리다이렉트
        resp.sendRedirect("/");
    }
}
