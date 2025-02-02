//package com.javatmp.demo.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.password.NoOpPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.provisioning.InMemoryUserDetailsManager;
//
//@Configuration
//public class ProjectConfig extends WebSecurityConfigurerAdapter {
//
//    @Override
//    @Bean
//    public UserDetailsService userDetailsService() {
//        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
//
//        UserDetails user1 = User.withUsername("john")
//                .password("12345")
//                .authorities("READ", "delete")
//                .build();
//
//        UserDetails user2 = User.withUsername("jane")
//                .password("12345")
//                .authorities("read", "write")
//                .build();
//
//
//        manager.createUser(user1);
//        manager.createUser(user2);
//
//        return manager;
//    }
//
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return NoOpPasswordEncoder.getInstance();
//    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.httpBasic();
////        http.authorizeRequests().anyRequest().permitAll();
////        http.authorizeRequests().anyRequest().hasAnyAuthority("WRITE", "READ");
//        //http.authorizeRequests().anyRequest().hasAuthority("WRITE");
////        http.authorizeRequests().anyRequest().access("hasAuthority('WRITE')");
//
////        http.authorizeRequests().anyRequest().denyAll();
//
////        http.authorizeRequests()
////                .anyRequest()
////                .access("T(java.time.LocalTime).now().isAfter(T(java.time.LocalTime).of(12, 0))");
//
//        String expression = "hasAuthority('read') and !hasAuthority('delete')";
//        http.authorizeRequests().anyRequest().access(expression);
//
//
//    }
//}
