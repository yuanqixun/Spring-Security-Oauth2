package com.fcn.main.oauth.tokenStore.impl;

import java.util.Collection;

import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2RefreshToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenStore;

public class MyJdbcTokenStore implements TokenStore {

	@Override
	public OAuth2Authentication readAuthentication(OAuth2AccessToken token) {
		System.out.println("MyJdbcTokenStore.readAuthentication");
		return null;
	}

	@Override
	public OAuth2Authentication readAuthentication(String token) {
		System.out.println("MyJdbcTokenStore.readAuthentication");
		return null;
	}

	@Override
	public void storeAccessToken(OAuth2AccessToken token,
			OAuth2Authentication authentication) {
		System.out.println("MyJdbcTokenStore.storeAccessToken");
	}

	@Override
	public OAuth2AccessToken readAccessToken(String tokenValue) {
		System.out.println("MyJdbcTokenStore.readAccessToken");
		return null;
	}

	@Override
	public void removeAccessToken(OAuth2AccessToken token) {
		System.out.println("MyJdbcTokenStore.removeAccessToken");

	}

	@Override
	public void storeRefreshToken(OAuth2RefreshToken refreshToken,
			OAuth2Authentication authentication) {
		System.out.println("MyJdbcTokenStore.storeRefreshToken");

	}

	@Override
	public OAuth2RefreshToken readRefreshToken(String tokenValue) {
		System.out.println("MyJdbcTokenStore.readRefreshToken");
		return null;
	}

	@Override
	public OAuth2Authentication readAuthenticationForRefreshToken(
			OAuth2RefreshToken token) {
		System.out.println("MyJdbcTokenStore.readAuthenticationForRefreshToken");
		return null;
	}

	@Override
	public void removeRefreshToken(OAuth2RefreshToken token) {
		System.out.println("MyJdbcTokenStore.removeRefreshToken");

	}

	@Override
	public void removeAccessTokenUsingRefreshToken(
			OAuth2RefreshToken refreshToken) {
		System.out.println("MyJdbcTokenStore.removeAccessTokenUsingRefreshToken");

	}

	@Override
	public OAuth2AccessToken getAccessToken(OAuth2Authentication authentication) {
		System.out.println("MyJdbcTokenStore.getAccessToken");
		return null;
	}

	@Override
	public Collection<OAuth2AccessToken> findTokensByClientIdAndUserName(
			String clientId, String userName) {
		System.out.println("MyJdbcTokenStore.findTokensByClientIdAndUserName");
		return null;
	}

	@Override
	public Collection<OAuth2AccessToken> findTokensByClientId(String clientId) {
		System.out.println("MyJdbcTokenStore.findTokensByClientId");
		return null;
	}

}
