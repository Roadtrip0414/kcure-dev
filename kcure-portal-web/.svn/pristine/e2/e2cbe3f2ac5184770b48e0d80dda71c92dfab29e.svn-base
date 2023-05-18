package kcure.portal.cmn.util;

import java.util.HashMap;

import NiceID.Check.CPClient;
import egovframework.com.cmm.service.EgovProperties;

public class CheckPlusUtil {
		
	public static HashMap encode() throws Exception {
		CPClient cpClient = new CPClient();
		HashMap resultMap = encode(cpClient);
	
		return resultMap;
	}
	
	public static HashMap decode(String encodeData) throws Exception {
		CPClient cpClient = new CPClient();
		HashMap resultMap = decode(cpClient, encodeData);
		
		return resultMap;
	}
	
	
	private static HashMap encode (CPClient client) throws Exception {
		String sSiteCode = EgovProperties.getProperty("nice.checkPlus.siteCode"); 
	    String sSitePassword = EgovProperties.getProperty("nice.checkPlus.sitePassword");
	    
	    String sReturnUrl = EgovProperties.getProperty("nice.checkPlus.successUrl");
	    String sErrorUrl = EgovProperties.getProperty("nice.checkPlus.failUrl"); 

	    String sRequestNumber = client.getRequestNO(sSiteCode);
	  	
	   	String sAuthType = "M";  // 없으면 기본 선택화면, M(휴대폰), X(인증서공통), U(공동인증서), F(금융인증서), S(PASS인증서), C(신용카드)
		String customize 	= "";		//없으면 기본 웹페이지 / Mobile : 모바일페이지

	    // 입력될 plain 데이타를 만든다.
	    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
	                        "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
	                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
	                        "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
	                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
	                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize;
	    
	    String sMessage = "";
	    
	    int iReturn = client.fnEncode(sSiteCode, sSitePassword, sPlainData);
	    
	    if(iReturn == 0) 
	   	{
		   HashMap resultMap = new HashMap();
		   resultMap.put("sEncData", client.getCipherData());
		   resultMap.put("sRequestNumber", sRequestNumber);
		   
		   return  resultMap;
	   	}
	   	else if( iReturn == -1)
	    {
	        sMessage = "암호화 시스템 에러입니다.";
	        throw new Exception(sMessage);
	    }    
	    else if( iReturn == -2)
	    {
	        sMessage = "암호화 처리오류입니다.";
	        throw new Exception(sMessage);
	    }    
	    else if( iReturn == -3)
	    {
	        sMessage = "암호화 데이터 오류입니다.";
	        throw new Exception(sMessage);
	    }    
	    else if( iReturn == -9)
	    {
	        sMessage = "입력 데이터 오류입니다.";
	        throw new Exception(sMessage);
	    }    
	    else
	    {
	        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
	        throw new Exception(sMessage);
	    }
	   
	}
	
	private static HashMap decode (CPClient client, String encodeData) throws Exception {
		String sSiteCode = EgovProperties.getProperty("nice.checkPlus.siteCode"); 
	    String sSitePassword = EgovProperties.getProperty("nice.checkPlus.sitePassword");
	    
	    String sMessage = "";
	    
	    int iReturn = client.fnDecode(sSiteCode, sSitePassword, encodeData);
	    
	    if(iReturn == 0) 
	   	{
		   return  client.fnParse(client.getPlainData());
	   	}
	   	else if( iReturn == -1)
	    {
	   		sMessage = "복호화 시스템 오류입니다.";
	        throw new Exception(sMessage);
	    }    
	    else if( iReturn == -4)
	    {
	    	sMessage = "복호화 처리 오류입니다.";
	        throw new Exception(sMessage);
	    }    
	    else if( iReturn == -5)
	    {
	    	sMessage = "복호화 해쉬 오류입니다.";
	        throw new Exception(sMessage);
	    }    
	    else if( iReturn == -6)
	    {
	    	sMessage = "복호화 데이터 오류입니다.";
	        throw new Exception(sMessage);
	    }    
	    else if( iReturn == -9)
	    {
	    	sMessage = "입력 데이터 오류입니다.";
	        throw new Exception(sMessage);
	    }    
	    else if( iReturn == -12)
	    {
	    	sMessage = "사이트 패스워드 오류입니다.";
	        throw new Exception(sMessage);
	    }    
	    else
	    {
	        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
	        throw new Exception(sMessage);
	    }
	}
	
}
