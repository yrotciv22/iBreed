package com.ibreed_project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;

@SpringBootApplication
@ComponentScan(basePackages = {"com.ibreed_project"})
@MapperScan(basePackages = {"com.ibreed_project"})
/*
 * @PropertySources({
 * 
 * @PropertySource(value="file:C:\\ibreed_project\\configure.properties",
 * ignoreResourceNotFound=true) })
 */


public class IbreedApplication {

	public static void main(String[] args) {
		SpringApplication.run(IbreedApplication.class, args);
	}

}
