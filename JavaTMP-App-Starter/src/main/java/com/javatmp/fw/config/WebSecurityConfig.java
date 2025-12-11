package com.javatmp.fw.config;

import com.javatmp.fw.util.MD5Util;
import com.javatmp.fw.web.handler.CustomAuthenticationEntryPoint;
import com.javatmp.fw.web.handler.CustomAuthenticationFailureHandler;
import com.javatmp.fw.web.handler.CustomAuthenticationSuccessHandler;
import com.javatmp.fw.web.handler.CustomLogoutSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

/**
 *
 * @author JavaTMP
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig
//        extends WebSecurityConfigurerAdapter
{

    @Autowired
    CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;
    @Autowired
    CustomAuthenticationFailureHandler customAuthenticationFailureHandler;
    @Autowired
    CustomLogoutSuccessHandler customLogoutSuccessHandler;
    @Autowired
    CustomAuthenticationEntryPoint customAuthenticationEntryPoint;
    @Autowired
    private UserDetailsService customUserDetailsService;

    //    @Autowired
//    LocalizationFilter localizationFilter;
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new PasswordEncoder() {
            @Override
            public String encode(CharSequence cs) {
                return MD5Util.convertToMD5(cs.toString());
            }

            @Override
            public boolean matches(CharSequence cs, String string) {
                return MD5Util.convertToMD5(cs.toString()).equals(string);
            }
        };
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable)         // disable CSRF if not needed (e.g. for APIs)
                .authorizeHttpRequests(authorize -> authorize
                        // allow public access to e.g. /public/**
                        .requestMatchers(
                                "/assets/**",
                                "/login**",
                                "/logout",
                                "/user/register",
                                "/CaptchaImageController",
                                "/pages/system/register",
                                "/login-processing",
                                "/error")
                        .permitAll()
                        // require authentication for any other request
                        .anyRequest().authenticated()

                ).formLogin(con -> {
                    con.loginPage("/login")
                            .loginProcessingUrl("/login-processing")
                            .usernameParameter("userName")
                            .passwordParameter("password")
                            .successHandler(customAuthenticationSuccessHandler)
                            .failureHandler(customAuthenticationFailureHandler);
                }).logout(cus -> {
                    cus.logoutUrl("/logout")
                            .logoutSuccessHandler(customLogoutSuccessHandler)
                            .logoutSuccessUrl("/")
                            .permitAll(); // [todo: why]
                }).exceptionHandling(cus -> {
                    cus.authenticationEntryPoint(customAuthenticationEntryPoint);
                });

        return http.build();
    }

}

/*
@Configuration
@EnableWebSecurity
public class SecurityConfig {
  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http
      .authorizeHttpRequests(auth -> auth
        .requestMatchers("/public/**").permitAll()
        .anyRequest().authenticated()
      )
      .logout(logout -> logout
        .logoutUrl("/perform_logout")
        .logoutSuccessUrl("/login?logout")
        .permitAll()
      )
      .formLogin(Customizer.withDefaults());
    return http.build();
  }
}
 */