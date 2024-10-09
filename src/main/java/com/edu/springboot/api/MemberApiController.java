package com.edu.springboot.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;

@RestController
@RequestMapping("/api/members")
public class MemberApiController {

    @Autowired
    private IMemberService memberService;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    // 특정 회원 정보 조회
    @GetMapping(value = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<MemberDTO> getMember(@PathVariable("id") String id) {
        MemberDTO member = memberService.getMemberById(id);
        if (member != null) {
            member.setPass(null); // 보안을 위해 비밀번호 제외
            return ResponseEntity.ok(member);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    
    // 로그인 엔드포인트
    @PostMapping(value = "/login", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> login(@RequestBody Map<String, String> loginRequest) {
        String id = loginRequest.get("id");
        String password = loginRequest.get("password");

        if (id == null || password == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("message", "아이디와 비밀번호를 모두 입력해주세요."));
        }

        MemberDTO member = memberService.getMemberById(id);
        if (member != null) {
            // 비밀번호 비교 (암호화된 비밀번호일 경우)
            if (passwordEncoder.matches(password, member.getPass())) {
                member.setPass(null); // 보안을 위해 비밀번호 제외
                return ResponseEntity.ok(member);
            } else {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                        .body(Map.of("message", "아이디 또는 비밀번호가 일치하지 않습니다."));
            }
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("message", "아이디 또는 비밀번호가 일치하지 않습니다."));
        }
    }


}
