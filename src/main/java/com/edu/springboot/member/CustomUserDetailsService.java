package com.edu.springboot.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private IMemberService memberService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MemberDTO member = memberService.getMemberById(username);
        if (member == null) {
            throw new UsernameNotFoundException("사용자를 찾을 수 없습니다.");
        }
        return User.builder()
                .username(member.getId())
                .password(member.getPass())
                .roles(member.getAuthority().replace("ROLE_", ""))
                .build();
    }
}