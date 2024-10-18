package com.edu.springboot.auth;

import java.util.Arrays;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import org.springframework.security.config.annotation.web.builders.HttpSecurity; // Deprecated
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {

    // 로그인 정보 저장을 위한 key
    @Value("${remember.me.key}")
    private String rememberMeKey;

    // DB 연결을 위한 DataSource를 자동 주입
    @Autowired
    private DataSource dataSource;

    @Autowired
    private JwtRequestFilter jwtRequestFilter;

    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf.disable())
            .cors(cors -> cors.configurationSource(corsConfigurationSource()))
            .authorizeHttpRequests(auth -> auth
                .dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE).permitAll()
                .requestMatchers("/api/members/login", "/api/members/register").permitAll() // JWT 인증 엔드포인트 허용
                .requestMatchers("/css/**", "/js/**", "/images/**", "/fonts/**").permitAll()
                .requestMatchers("/", "/Project-Popcon/**").permitAll()
                .requestMatchers("/freeBoard/write.do", "/freeBoard/edit.do", "/freeBoard/delete.do")
                    .hasAnyRole("ADMIN", "CORP", "NORMAL")
                .requestMatchers("/popupBoard/write.do", "/popupBoard/edit.do", "/popupBoard/delete.do")
                    .hasAnyRole("ADMIN", "CORP")
                .requestMatchers("/popupBoard/booking/**").hasAnyRole("ADMIN", "CORP", "NORMAL")
                .requestMatchers("/noticeBoard/write.do", "/noticeBoard/edit.do", "/noticeBoard/delete.do", "/coupon/write.do")
                    .hasRole("ADMIN")
                .requestMatchers("/mypage/**", "/chat.do").hasAnyRole("ADMIN", "CORP", "NORMAL")
                .requestMatchers("/api/bookings/**").authenticated()
                .anyRequest().permitAll()
            )
            .formLogin(form -> form
                .loginPage("/login.do")
                .loginProcessingUrl("/loginProc.do")
                .defaultSuccessUrl("/", true)
                .usernameParameter("login_id")
                .passwordParameter("login_pw")
                .successHandler(new CustomAuthenticationSuccessHandler())
                .permitAll()
            )
            .rememberMe(rememberMe -> rememberMe
                .key(rememberMeKey)
                .tokenValiditySeconds(3600 * 24 * 7)
                .userDetailsService(userDetailsService)
            )
            .logout(logout -> logout
                .logoutUrl("/logout.do")
                .logoutSuccessUrl("/")
                .permitAll()
            )
            .exceptionHandling(exception -> exception
                .accessDeniedPage("/denied.do")
            );

        // JWT 필터 추가 (폼 로그인 필터 앞에 위치)
        http.addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    // enabled가 0이면 로그인 안됨
    @Autowired
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
            .dataSource(dataSource)
            .usersByUsernameQuery("SELECT id, pass, enabled FROM member WHERE id = ? AND enabled = 1")
            .authoritiesByUsernameQuery("SELECT id, authority FROM member WHERE id = ?")
            .passwordEncoder(new BCryptPasswordEncoder());
    }
    
    
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:3000", "http://10.0.2.2:8080")); // 클라이언트의 주소로 변경
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true); // 인증 정보 전송 허용

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration); // 모든 경로에 대해 CORS 설정 적용

        return source;
    }

    // double slash 막기
    @Bean
    public HttpFirewall allowUrlDoubleSlashHttpFirewall() {
        DefaultHttpFirewall firewall = new DefaultHttpFirewall();
        firewall.setAllowUrlEncodedSlash(true);
        return firewall;
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.httpFirewall(allowUrlDoubleSlashHttpFirewall());
    }

    // AuthenticationManager Bean
    @Bean
    public AuthenticationManager authenticationManager(HttpSecurity http, BCryptPasswordEncoder bCryptPasswordEncoder, UserDetailsService userDetailsService) 
            throws Exception {
        return http.getSharedObject(AuthenticationManagerBuilder.class)
            .userDetailsService(userDetailsService)
            .passwordEncoder(bCryptPasswordEncoder)
            .and()
            .build();
    }

    // 패스워드 인코더(암호화) : 패스워드를 저장하기 전 암호화한다.
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
