package com.fcn.main.config;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.approval.ApprovalStore;
import org.springframework.security.oauth2.provider.approval.TokenApprovalStore;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.InMemoryTokenStore;

@Configuration
public class OAuth2ServerConfig {

	private static final String SERVER_RESOURCE_ID = "oauth2server";

	@Configuration
	@Order(10)
	protected static class UiResourceConfiguration extends WebSecurityConfigurerAdapter {
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http
				.requestMatchers().antMatchers("/articles")
			.and()
				.authorizeRequests()
				.antMatchers("/articles").access("hasRole('ROLE_USER')");
		}
	}

	@Configuration
	@EnableResourceServer
	protected static class ResourceServerConfiguration extends ResourceServerConfigurerAdapter {

		@Override
		public void configure(ResourceServerSecurityConfigurer resources) {
			resources.resourceId(SERVER_RESOURCE_ID);
		}

		@Override
		public void configure(HttpSecurity http) throws Exception {
			http
				.requestMatchers().antMatchers("/articles")
			.and()
				.authorizeRequests()
					.antMatchers("/articles").access("#oauth2.hasScope('read')");
		}

	}

	@Configuration
	@EnableAuthorizationServer
	protected static class AuthorizationServerConfiguration extends AuthorizationServerConfigurerAdapter {

		@Inject
		private TokenStore tokenStore;

		@Inject
		@Qualifier("authenticationManagerBean")
		private AuthenticationManager authenticationManager;//身份认证管理者

		@Override
		public void configure(ClientDetailsServiceConfigurer clients) throws Exception {

			clients.inMemory().withClient("appclient")
			 			.resourceIds(SERVER_RESOURCE_ID)
			 			.authorizedGrantTypes("authorization_code")
			 			.authorities("ROLE_CLIENT")
			 			.scopes("read", "write","trust","自定义权限")//这个scope是自定义的么？？
			 			.accessTokenValiditySeconds(100)
			 			.secret("secret")/*
			 			.redirectUris("redirect_uri")*/;
		}

		@Bean
		public TokenStore tokenStore() {
			return new InMemoryTokenStore();
		}
		
		@Override
		public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
			endpoints.tokenStore(tokenStore)
					.authenticationManager(authenticationManager);
					/*.pathMapping("/oauth/authorize", "/oauth2/authorize")
					.pathMapping("/oauth/token", "/oauth2/token");*/
			//以上的注释掉的是用来改变默认配置的
		}

		@Override
		public void configure(AuthorizationServerSecurityConfigurer oauthServer) throws Exception {
			oauthServer.allowFormAuthenticationForClients();
		}
		
		//这个bean是必不可少的，不然的话就会初始化报错的。
		@Bean
		public ApprovalStore approvalStore() throws Exception {
			TokenApprovalStore store = new TokenApprovalStore();
			store.setTokenStore(tokenStore);
			return store;
		}

	}

}
