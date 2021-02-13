package com.portfolio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.portfolio.interceptor.UserLoginCheckInterceptor;
import com.portfolio.interceptor.UserStayLoggedInInterceptor;

@Configuration
public class MyWebMvcConfig implements WebMvcConfigurer {
	
	@Autowired
	private  UserLoginCheckInterceptor userLoginCheckInterceptor;
	
	@Autowired
	private UserStayLoggedInInterceptor userStayLoggedInInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 회원 로그인 확인 인터셉터 등록하기
		InterceptorRegistration registration = registry.addInterceptor(userLoginCheckInterceptor);
		// 인터셉터가 수행될 URL 주소 경로 추가
		registration.addPathPatterns("/book/*");
		registration.addPathPatterns("/content/*");
		registration.addPathPatterns("/review/*");
		registration.addPathPatterns("/travel/*");
		registration.addPathPatterns("/customerCenter/*");
		
		// 인터셉터 수행에서 제외할 URL 주소 경로 추가
		registration.excludePathPatterns("/content/info");
		registration.excludePathPatterns("/review/content");
		registration.excludePathPatterns("/customerCenter/faqList");
		registration.excludePathPatterns("/customerCenter/faqContent");
		registration.excludePathPatterns("/customerCenter/qnaList");
		registration.excludePathPatterns("/customerCenter/qnaContent");
		registration.excludePathPatterns("/customerCenter/qna/*");
		
		
		// 회원 로그인 상태유지 인터셉터 등록하기
		registry.addInterceptor(userStayLoggedInInterceptor)
		.addPathPatterns("/*");
	} // addInterceptors
	
}
