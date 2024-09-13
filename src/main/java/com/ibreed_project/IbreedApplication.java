package com.ibreed_project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.apache.catalina.connector.Connector;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@ComponentScan(basePackages = {"com.ibreed_project"})
@MapperScan(basePackages = {"com.ibreed_project"})

@PropertySources({

@PropertySource(value="{file:C:\iBreed\ksw\configure.properties",
			"file:/usr/local/project/properties/configure.properties",},
ignoreResourceNotFound=true) })


public class IbreedApplication {

	@Bean    
	public ServletWebServerFactory serveltContainer(){       
		TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();        
		tomcat.addAdditionalTomcatConnectors(createStandardConnector());       
		return tomcat;    
	}    
	
	private Connector createStandardConnector(){        
		Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");        
		connector.setPort(8080);        
		return connector;    
	}

	public static void main(String[] args) {
		SpringApplication.run(IbreedApplication.class, args);
	}

}
