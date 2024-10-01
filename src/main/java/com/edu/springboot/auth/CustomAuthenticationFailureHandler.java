package com.edu.springboot.auth;

import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.core.AuthenticationException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse resp,
                                        AuthenticationException exception) throws IOException, ServletException {
        // 로그인 실패 메시지를 request에 추가
        req.setAttribute("error", exception.getMessage());
        req.getRequestDispatcher("/login.do").forward(req, resp);
    }
}
