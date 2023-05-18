package egovframework.com.ext.oauth.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import egovframework.com.cmm.service.EgovProperties;


public class OAuthLogin {
	private OAuth20Service oauthService;
	private OAuthVO oauthVO;

	public OAuthLogin(OAuthVO oauthVO) {
		String domain = EgovProperties.getProperty("Globals.Domain");
		this.oauthService = new ServiceBuilder(oauthVO.getClientId())
				.apiSecret(oauthVO.getClientSecret())
				.callback(domain + oauthVO.getRedirectUrl())
				.build(oauthVO.getApi20Instance());
		
//		System.out.println("------------------OAuthLogin----------------");
//		System.out.println("------------------OAuthLogin----------------");
//		System.out.println("------------------OAuthLogin----------------");
//		System.out.println(domain);
//		System.out.println(this.oauthService.getCallback());
//		System.out.println("------------------OAuthLogin----------------");
//		System.out.println("------------------OAuthLogin----------------");
//		System.out.println("------------------OAuthLogin----------------");
//		System.out.println("------------------OAuthLogin----------------");
		

		this.oauthVO = oauthVO;
	}

	public String getOAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public OAuthUniversalUser getUserProfile(String code) throws Exception {
		//System.out.println("===>>> oauthService.getApiKey() = "+oauthService.getApiKey());
		//System.out.println("===>>> oauthService.getApiSecret() = "+oauthService.getApiSecret());
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		OAuthRequest request = new OAuthRequest(Verb.GET, this.oauthVO.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	}

	private OAuthUniversalUser parseJson(String body) throws Exception {
		//System.out.println("============================\n" + body + "\n==================");
		OAuthUniversalUser user = new OAuthUniversalUser();

		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		if (this.oauthVO.isNaver()) {
			user.setServiceName(OAuthConfig.NAVER_SERVICE_NAME);
			JsonNode resNode = rootNode.get("response");
			
			System.out.println("==================================");
			System.out.println(resNode.toString());
			System.out.println("==================================");
			
			/*
			 * 
			 *   {"id","age","email","mobile","mobile_e164","name","birthday"}
			 *   
			 *   */
			user.setUserId(resNode.get("id").asText());
			user.setEmail(resNode.get("email").asText());

		} else if (this.oauthVO.isKakao()) {
			System.out.println("==================================");
			System.out.println(rootNode.toString());
			System.out.println("==================================");
			user.setServiceName(OAuthConfig.KAKAO_SERVICE_NAME);
			//{"id":,"connected_at","kakao_account":{"has_email":true,"email_needs_agreement":false,"is_email_valid":true,"is_email_verified":true,"email":}}			
			user.setUserId(rootNode.get("id").asText());
			user.setEmail(rootNode.get("kakao_account").get("email").asText());
		}
		return user;
	}

}
