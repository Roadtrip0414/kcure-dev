package kcure.portal.cmn.util;

import org.springframework.util.StringUtils;

public class TextUtility
{
	
	/**
	  * @Method Name : getParamDecodeData
	  * @작성일 : 2022. 12. 27.
	  * @Method 설명 :
	  *  <p>	
	  *    전자 정부 filter 를 통해 변경된 문자열 원본 시키기.
	  *  </p>
	  * @param : encode 된 string 값
	  * @return : decode 된 string 값
	  */
	public static String getParamDecodeData(String value) {
		String decodeValue = value;
		if(decodeValue != null && !"".equals(decodeValue)) {
			decodeValue = decodeValue.replaceAll("&lt;", "<");
			decodeValue = decodeValue.replaceAll("&gt;", ">");	
			decodeValue = decodeValue.replaceAll("&quot;", "\"");
			decodeValue = decodeValue.replaceAll("&apos;", "'");
		}
		return decodeValue;
	}
	
	public static String requestReplace (String paramValue, String gubun) {
        String result = "";
        
        if (paramValue != null) {     	
        	paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

        	paramValue = paramValue.replaceAll("\\*", "");
        	paramValue = paramValue.replaceAll("\\?", "");
        	paramValue = paramValue.replaceAll("\\[", "");
        	paramValue = paramValue.replaceAll("\\{", "");
        	paramValue = paramValue.replaceAll("\\(", "");
        	paramValue = paramValue.replaceAll("\\)", "");
        	paramValue = paramValue.replaceAll("\\^", "");
        	paramValue = paramValue.replaceAll("\\$", "");
        	paramValue = paramValue.replaceAll("'", "");
        	paramValue = paramValue.replaceAll("@", "");
        	paramValue = paramValue.replaceAll("%", "");
        	paramValue = paramValue.replaceAll(";", "");
        	paramValue = paramValue.replaceAll(":", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll("#", "");
        	paramValue = paramValue.replaceAll("--", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll(",", "");
        	
        	if(gubun != "encodeData"){
        		paramValue = paramValue.replaceAll("\\+", "");
        		paramValue = paramValue.replaceAll("/", "");
        		paramValue = paramValue.replaceAll("=", "");
        	}
        	
        	result = paramValue;        
        }
        return result;
	}
	
	
	public static String maskingEmail(String email) {
		if(!StringUtils.hasText(email) || !email.contains("@")){
            return email;
        }
		
        String[] emailSplited = email.split("@");
        
        if(emailSplited.length != 2){
            return email;
        }

        if(emailSplited[0].length() <= 2){
            return email.charAt(0) + "*****@" + emailSplited[1];
        }else{
            return email.substring(0, 2) + "*****@" + emailSplited[1];
        }
	}
	
}
