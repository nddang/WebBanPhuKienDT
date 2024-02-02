package com.example.demo.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/css/**").addResourceLocations("classpath:/static/css/");
		registry.addResourceHandler("/resources/imgs/**").addResourceLocations("classpath:/static/imgs/");
		registry.addResourceHandler("/resources/js/**").addResourceLocations("classpath:/static/js/");
	}
}
