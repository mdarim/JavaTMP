package com.javatmp.fw.config;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.javatmp.fw.config.converter.OrderDirTypeJsonDeserializer;
import com.javatmp.fw.config.converter.OrderDirTypeJsonSerializer;
import com.javatmp.fw.domain.table.OrderDir;
import com.javatmp.fw.web.filter.CacheControlHeadersFilter;
import com.javatmp.fw.web.filter.ContentCacheFilter;
import com.javatmp.fw.web.filter.GZIPCompressingFilter;
import com.javatmp.fw.web.filter.LocalizationFilter;
import com.javatmp.fw.web.filter.LoggingFilter;
import com.javatmp.fw.web.listener.JavaTMPHttpSessionListener;
import com.javatmp.fw.web.listener.JavaTMPServletListener;
import java.util.Locale;
import javax.servlet.DispatcherType;
import lombok.extern.slf4j.Slf4j;
import nl.captcha.servlet.SimpleCaptchaServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Slf4j
@Configuration
public class Config implements WebMvcConfigurer {

    @Autowired
    LoggingFilter loggingFilter;

    @Autowired
    JavaTMPServletListener javaTMPServletListener;

    @Autowired
    LocalizationFilter localizationFilter;

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("/index.jsp");
        registry.addViewController("").setViewName("/index.jsp");
        registry.addViewController("/login").setViewName("/pages/system/default-login-page.jsp");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("/static/")
                .setCachePeriod(60 * 60);
    }

    @Bean
    public ServletListenerRegistrationBean<JavaTMPServletListener> getJavaTMPServletListener() {
        ServletListenerRegistrationBean<JavaTMPServletListener> registrationBean
                = new ServletListenerRegistrationBean<>();
        registrationBean.setListener(this.javaTMPServletListener);
        return registrationBean;
    }

    @Bean
    public ServletListenerRegistrationBean<JavaTMPHttpSessionListener> getJavaTMPHttpSessionListener() {
        ServletListenerRegistrationBean<JavaTMPHttpSessionListener> registrationBean
                = new ServletListenerRegistrationBean<>();
        registrationBean.setListener(new JavaTMPHttpSessionListener());
        return registrationBean;
    }

    @Bean
    public FilterRegistrationBean<LoggingFilter> getLoggingFilter() {
        FilterRegistrationBean<LoggingFilter> registrationBean
                = new FilterRegistrationBean<>();
        registrationBean.setFilter(loggingFilter);
        registrationBean.addUrlPatterns("/*");
        registrationBean.setDispatcherTypes(DispatcherType.REQUEST);
        registrationBean.addInitParameter("excludedUrlsRegex", "^/assets/.*,^/CaptchaImageController");
        registrationBean.setOrder(2);

        return registrationBean;
    }

    @Bean
    public FilterRegistrationBean<LocalizationFilter> getLocalizationFilter() {
        FilterRegistrationBean<LocalizationFilter> registrationBean
                = new FilterRegistrationBean<>();
        registrationBean.setFilter(localizationFilter);
        registrationBean.addUrlPatterns("/*");
        registrationBean.setDispatcherTypes(DispatcherType.REQUEST);
        registrationBean.addInitParameter("excludedUrlsRegex", "^/assets/.*,^/CaptchaImageController");
        registrationBean.setOrder(3);
        return registrationBean;
    }

    @Bean
    public FilterRegistrationBean<CacheControlHeadersFilter> getCacheControlHeadersFilter() {
        FilterRegistrationBean<CacheControlHeadersFilter> registrationBean
                = new FilterRegistrationBean<>();
        registrationBean.setFilter(new CacheControlHeadersFilter());
        registrationBean.addUrlPatterns("/*");
        registrationBean.setDispatcherTypes(DispatcherType.REQUEST);
        registrationBean.addInitParameter("excludedUrlsRegex", "^/,^/login,^/logout,^/CaptchaImageController");
        registrationBean.setOrder(5);
        return registrationBean;
    }

    @Bean
    public FilterRegistrationBean<ContentCacheFilter> getContentCacheFilter() {
        FilterRegistrationBean<ContentCacheFilter> registrationBean
                = new FilterRegistrationBean<>();
        registrationBean.setFilter(new ContentCacheFilter());
        registrationBean.addUrlPatterns("/assets/*");
        registrationBean.setDispatcherTypes(DispatcherType.REQUEST);
        registrationBean.setOrder(6);
        return registrationBean;
    }

    @Bean
    public FilterRegistrationBean<GZIPCompressingFilter> getGZIPCompressingFilter() {
        FilterRegistrationBean<GZIPCompressingFilter> registrationBean
                = new FilterRegistrationBean<>();
        registrationBean.setFilter(new GZIPCompressingFilter());
        registrationBean.addUrlPatterns("/*");
        registrationBean.setDispatcherTypes(DispatcherType.REQUEST);
        registrationBean.setOrder(7);
        return registrationBean;
    }

    // http://simplecaptcha.sourceforge.net/installing.html
    @Bean
    public ServletRegistrationBean<SimpleCaptchaServlet> exampleServletBean() {
        ServletRegistrationBean<SimpleCaptchaServlet> bean = new ServletRegistrationBean<>();
        bean.setServlet(new SimpleCaptchaServlet());
        bean.addInitParameter("width", "250");
        bean.addInitParameter("height", "75");
        bean.addUrlMappings("/CaptchaImageController");
        return bean;
    }

    @Bean
    public ObjectMapper customJacksonJsonMapper() {
        return new Jackson2ObjectMapperBuilder()
                .indentOutput(true)
                .serializationInclusion(JsonInclude.Include.ALWAYS)
                //                .simpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX")
                .deserializerByType(OrderDir.class, new OrderDirTypeJsonDeserializer())
                .serializerByType(OrderDir.class, new OrderDirTypeJsonSerializer())
                .build().configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
    }

    @Bean
    public LocaleResolver getLocaleResolver() {
        CookieLocaleResolver resolver = new CookieLocaleResolver();
        // 60 minutes
        resolver.setCookieMaxAge(Integer.MAX_VALUE);
        return resolver;
    }

    @Bean("localeResolver")
    public LocaleResolver getSessionLocaleResolver() {
        SessionLocaleResolver resolver = new SessionLocaleResolver();
        resolver.setDefaultLocale(Locale.ENGLISH);
        return resolver;
    }

    @Bean
    public MessageSource getMessageResource() {
        ResourceBundleMessageSource messageResource = new ResourceBundleMessageSource();
        // Read i18n/messages_xxx.properties file.
        // For example: i18n/messages_en.properties
        messageResource.setBasename("classpath:i18n/messages");
        messageResource.setDefaultEncoding("UTF-8");
        return messageResource;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        LocaleChangeInterceptor localeInterceptor = new LocaleChangeInterceptor();
        localeInterceptor.setParamName("lan");
        registry.addInterceptor(localeInterceptor).addPathPatterns("/*");
    }
}
