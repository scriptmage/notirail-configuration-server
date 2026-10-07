package com.notirail.configuration_server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class Application {

	static void main(final String[] args) {
		SpringApplication.run(Application.class, args);
	}

}
