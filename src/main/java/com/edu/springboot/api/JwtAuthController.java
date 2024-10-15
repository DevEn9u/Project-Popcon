package com.edu.springboot.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import com.edu.springboot.auth.JwtUtil;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.member.IMemberService;

@RestController
@RequestMapping("/api/auth")
public class JwtAuthController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private IMemberService memberService;

    // JWT 기반 로그인 엔드포인트
    @PostMapping(value = "/login", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> jwtLogin(@RequestBody Map<String, String> loginRequest) {
        String id = loginRequest.get("id");
        String password = loginRequest.get("password");

        if (id == null || password == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("message", "아이디와 비밀번호를 모두 입력해주세요."));
        }

        try {
            // Authentication 객체 생성
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(id, password)
            );

            // 인증 성공 시 SecurityContext에 설정
            SecurityContextHolder.getContext().setAuthentication(authentication);

            // JWT 토큰 생성
            String jwt = jwtUtil.generateToken(id);

            // 사용자 정보 반환
            MemberDTO member = memberService.getMemberById(id);
            member.setPass(null); // 보안을 위해 비밀번호 제외

            return ResponseEntity.ok(Map.of(
                    "token", jwt,
                    "user", member
            ));

        } catch (BadCredentialsException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("message", "아이디 또는 비밀번호가 일치하지 않습니다."));
        } catch (Exception e) {
        	e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("message", "로그인 중 오류가 발생했습니다."));
        }
    }
}