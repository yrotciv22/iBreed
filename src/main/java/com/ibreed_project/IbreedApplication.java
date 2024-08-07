package com.ibreed_project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.ibreed_project"})
@MapperScan(basePackages = {"com.ibreed_project"})
public class IbreedApplication {

	public static void main(String[] args) {
		SpringApplication.run(IbreedApplication.class, args);
	}

}
