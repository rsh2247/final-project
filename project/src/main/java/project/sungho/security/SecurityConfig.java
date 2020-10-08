package project.sungho.security;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

//@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests().antMatchers("/member/signup").permitAll().antMatchers("/member/signin").permitAll()
				.antMatchers("/").hasAnyAuthority("ADMIN", "USER").antMatchers("/admin/**").hasAnyAuthority("ADMIN")
				.antMatchers("/**").permitAll().anyRequest().authenticated().and()
				// 다른 부분은 무시해주시고 이 부분만 잘 사용 해주시면 됩니다.
				.csrf().ignoringAntMatchers("*").ignoringAntMatchers("*/*")
				//
				.and().formLogin().loginPage("/member/signin").failureUrl("/member/signin?error") /* 로그인 실패시 url */
				.defaultSuccessUrl("/", true) /* 로그인 성공시 url */
				.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).deleteCookies("JSESSIONID")
				.invalidateHttpSession(true).logoutSuccessUrl("/home").and().exceptionHandling()
				.accessDeniedPage("/access-denied");
	}
}
