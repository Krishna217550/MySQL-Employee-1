package com.example.www.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

	    http
	        .csrf().disable()
	        .authorizeHttpRequests()
	        .dispatcherTypeMatchers(jakarta.servlet.DispatcherType.FORWARD, jakarta.servlet.DispatcherType.ERROR).permitAll()
	        .requestMatchers("/student/login", "/student/register", "/styles.css").permitAll()
	        .anyRequest().authenticated()
	    .and()
	        .formLogin()
	        .loginPage("/student/login")
	        .loginProcessingUrl("/student/login")
	        .defaultSuccessUrl("/student/", true)
	        .failureUrl("/student/login?error=true");

	    return http.build();
	}
    @Bean
    public org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder passwordEncoder() {
        return new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder();
    }
}