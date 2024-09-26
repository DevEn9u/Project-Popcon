package com.edu.springboot.auth;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import jakarta.servlet.DispatcherType;

@Configuration
public class WebSecurityConfig {	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http)
			throws Exception {
		http.csrf((csrf) -> csrf.disable())
			.cors((cors) -> cors.disable())
			.authorizeHttpRequests((request) -> request
				.dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE).permitAll()
//				.requestMatchers("/**").permitAll()
				.requestMatchers("/").permitAll()
				.requestMatchers("/css/**", "/js/**", "/images/**", "/fonts/**").permitAll()
				.requestMatchers("/freeBoard/write.do").hasAnyRole("ADMIN", "CORP", "NORMAL")
//				.requestMatchers("/freeBoard/edit.do").hasAnyRole("ADMIN", "CORP", "NORMAL")
//				.requestMatchers("/freeBoard/delete.do").hasAnyRole("ADMIN", "CORP", "NORMAL")
//				.requestMatchers("/popupBoard/write.do").hasAnyRole("ADMIN", "CORP")
//				.requestMatchers("/popupBoard/edit.do").hasAnyRole("ADMIN", "CORP")
//				.requestMatchers("/popupBoard/delete.do").hasAnyRole("ADMIN", "CORP")
//				.requestMatchers("/noticeBoard/write.do").hasRole("ADMIN")
//				.requestMatchers("/noticeBoard/edit.do").hasRole("ADMIN")
//				.requestMatchers("/noticeBoard/delete.do").hasRole("ADMIN")
//				.anyRequest().permitAll()
				.anyRequest().authenticated()

			);
		http.formLogin((formLogin) -> formLogin
				.loginPage("/login.do") // defalut : /login
				.loginProcessingUrl("/login.do")
				// 로그인 성공시 메인 페이지로 이동.
				.defaultSuccessUrl("/", true)
				/* 로그인할 때 아이디와 비밀번호의 파라미터는 input태그의 name
				   속성과 동일하게 설정해줘야 로그인 process가 정상작동함. */
				.usernameParameter("login_id")
				.passwordParameter("login_pw")
				.permitAll());
		
		/* 로그인 정보 저장 */
		http.rememberMe((rememberMe) -> rememberMe
				.key("uniqueKey")
				.tokenValiditySeconds(86400)
		);
		
		/* 로그아웃에 대한 커스터마이징 */
		http.logout((logout) -> logout
				.logoutUrl("/logout.do")
				// 로그아웃시 메인페이지로 이동
				.logoutSuccessUrl("/")
				.permitAll());
		/*
		 권한이 부족한 경우 이동할 페이지를 지정한다.
		 가령 user로 로그인 했는데, admin 권한이 필요한 페이지에 접근하는 경우
		 */
		http.exceptionHandling((expHandling) -> expHandling
				.accessDeniedPage("/denied.do"));
		
		return http.build();
	}
	

	@Bean
	public HttpFirewall allowUrlDoubleSlashHttpFirewall() {
	    DefaultHttpFirewall firewall = new DefaultHttpFirewall();
	    firewall.setAllowUrlEncodedSlash(true);
	    return firewall;
	}
	
	
	// DB 연결을 위한 DataSource를 자동 주입
	@Autowired
	private DataSource dataSource;
	
	/* 사용자의 인증정보와 권한을 인출
	   첫번째 쿼리는 아이디, 비밀번호, (계정활성화 나중에) 확인
	   두번째 쿼리는 사용자 권한(authority) 확인 */
	@Autowired
	protected void configure(AuthenticationManagerBuilder auth)
		throws Exception {
		auth.jdbcAuthentication()
			.dataSource(dataSource)
			.usersByUsernameQuery("SELECT id, pass, enabled "
					+ " FROM member WHERE id = ?")
			.authoritiesByUsernameQuery("SELECT id, authority "
					+ " FROM member WHERE id = ?")
			// 이 부분은 나중에 암호화하기 위해 추가
			.passwordEncoder(new BCryptPasswordEncoder());
	}
	
	@Bean
	public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.httpFirewall(allowUrlDoubleSlashHttpFirewall());
    }
	
//	 패스워드 인코더(암호화) : 패스워드를 저장하기 전 암호화한다.(바로 위에 작성)
//	public PasswordEncoder passwordEncoder() {
//		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
//	}
}