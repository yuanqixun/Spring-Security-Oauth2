package com.fcn.main.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class AppConfig {
	@Bean
	public DataSource dataSource() {
		System.out.println("userDBDatasource :: init");
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@172.16.65.99:1521:fcn1");
		dataSource.setUsername("fcnjava");
		dataSource.setPassword("fcnjava");
		return dataSource;
	}
}
