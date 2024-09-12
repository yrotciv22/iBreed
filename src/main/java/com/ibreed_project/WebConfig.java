package com.ibreed_project;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 프로젝트 외부 경로 이미지 맵핑 설정 
		// 변경 필요
		registry.addResourceHandler("/prd_image/**")
		.addResourceLocations("file:///C:/iBreedWorkspace/images/");
		
	
		// upload 폴더의 이미지 출력하기 위해 맵핑 설정 // 오디오 추가
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///C:/iBreedWorkspace/images/");

			
	}
}
