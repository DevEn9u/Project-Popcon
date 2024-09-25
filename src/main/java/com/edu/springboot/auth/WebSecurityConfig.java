package com.edu.springboot.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

@Configuration
public class WebSecurityConfig {	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http)
			throws Exception {
		http.csrf((csrf) -> csrf.disable())
			.cors((cors) -> cors.disable())
			.authorizeHttpRequests((request) -> request
				.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
				.requestMatchers("/").permitAll()
				.requestMatchers("/css/**", "/js/**", "/images/**", "/fonts/**").permitAll()
				.requestMatchers("/WEB-INF/views/include/**").permitAll()
				.requestMatchers("/freeBoard/write.do").hasAnyRole("admin", "corp", "normal")
				.requestMatchers("/freeBoard/edit.do").hasAnyRole("admin", "corp", "normal")
				.requestMatchers("/freeBoard/delete.do").hasAnyRole("admin", "corp", "normal")
				.requestMatchers("/popupBoard/write.do").hasAnyRole("admin", "corp")
				.requestMatchers("/popupBoard/edit.do").hasAnyRole("admin", "corp")
				.requestMatchers("/popupBoard/delete.do").hasAnyRole("admin", "corp")
				.requestMatchers("/noticeBoard/write.do").hasRole("ADMIN")
				.requestMatchers("/noticeBoard/edit.do").hasRole("ADMIN")
				.requestMatchers("/noticeBoard/delete.do").hasRole("ADMIN")
				.anyRequest().authenticated()		
			);
		http.formLogin((formLogin) -> formLogin
				.loginPage("/login.do") // defalut : /login
				.loginProcessingUrl("/loginProc.do") 
				/* 로그인할 때 아이디와 비밀번호의 파라미터는 input태그의 name
				   속성과 동일하게 설정해줘야 로그인 process가 정상작동함. */
				.usernameParameter("login_id")
				.passwordParameter("login_pw")
				.permitAll());
		
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
	
	/*
	 로그인 후 획득할 수 있는 권한에 대한 설정을 한다. USER 권한과 ADMIN 권한을
	 획득하기 위한 아이디/비밀번호를 메모리에 저장한다. DB에 저장하기 위해서는
	 별도의 커스터마이징이 필요하다.
	 */
	@Bean
	public UserDetailsService users() {
		UserDetails user = User.builder()
				.username("user")
				.password(passwordEncoder().encode("1234"))
				.roles("USER")
				.build();
		UserDetails admin = User.builder()
				.username("admin")
				.password(passwordEncoder().encode("1234"))
				.roles("USER", "ADMIN")
				.build();
		
		// 메모리에 사용자 정보를 담는다.
		return new InMemoryUserDetailsManager(user, admin);
	}
	
	// 패스워드 인코더(암호화) : 패스워드를 저장하기 전 암호화한다.
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
}