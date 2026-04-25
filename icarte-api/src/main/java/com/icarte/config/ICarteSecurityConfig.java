package com.icarte.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class ICarteSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
//		http.authorizeRequests().anyRequest().access("hasRole('ROLE_ADMIN')")
//				.and().formLogin().loginPage("/login")
//				.failureUrl("/login?error").usernameParameter("username")
//				.passwordParameter("password").and().logout()
//				.logoutSuccessUrl("/login?logout").and().csrf().and()
//				.exceptionHandling().accessDeniedPage("/403");
	}
}
