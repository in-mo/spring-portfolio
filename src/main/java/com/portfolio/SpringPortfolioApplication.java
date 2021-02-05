package com.portfolio;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.portfolio.mapper")
@SpringBootApplication
public class SpringPortfolioApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringPortfolioApplication.class, args);
	}

}
