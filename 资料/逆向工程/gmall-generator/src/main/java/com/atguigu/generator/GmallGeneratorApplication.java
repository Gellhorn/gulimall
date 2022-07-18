package com.atguigu.generator;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("io.renren.dao")
public class GmallGeneratorApplication {

	public static void main(String[] args) {
		SpringApplication.run(GmallGeneratorApplication.class, args);
	}
}
