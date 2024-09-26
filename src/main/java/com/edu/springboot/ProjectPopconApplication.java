package com.edu.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;

@SpringBootApplication
public class ProjectPopconApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectPopconApplication.class, args);
		
		String passwd =
				PasswordEncoderFactories.createDelegatingPasswordEncoder()
				.encode("1234");
		System.out.println(passwd);
	}
}