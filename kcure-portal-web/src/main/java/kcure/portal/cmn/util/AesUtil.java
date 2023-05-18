package kcure.portal.cmn.util;

import java.security.spec.AlgorithmParameterSpec;
import java.util.Arrays;
import java.util.Base64;
import java.util.Random;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class AesUtil {

	//AES128 KEY 16자리 숫자 생성
	public static String generateSecretKey() {
        
        Random rand = new Random();
        String numStr = "";
        
        for(int i=0; i<16; i++) {
            String random = Integer.toString(rand.nextInt(10));
            numStr += random;
        }
        return numStr;
    }
	
	//AES 암호화
	public static String aes128Enc(String data, String secretKey) {
		try {
			
			byte ivBytes[] = new byte[16]; 
			Arrays.fill(ivBytes, (byte)0x00);
        	
			byte textBytes[] = data.getBytes("UTF-8");
        	
			AlgorithmParameterSpec ivSpec = new IvParameterSpec(ivBytes);
			SecretKeySpec newKey = new SecretKeySpec(secretKey.getBytes("UTF-8"),"AES");
			Cipher cipher = null;
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, newKey, ivSpec);
        	        	
			Encoder encoder = Base64.getEncoder();
			return encoder.encodeToString(cipher.doFinal(textBytes));        	
		}
		catch(Exception e) {
			e.printStackTrace();    	
		}
		return "";
	}
	
	//AES 복호화
	public static String aes128Dec(String data, String secretKey) {
		try {
			
			byte ivBytes[] = new byte[16]; 
			Arrays.fill(ivBytes, (byte)0x00);
        	
			Decoder decoder = Base64.getDecoder();
			byte textBytes[] = decoder.decode(data);
    		
			AlgorithmParameterSpec ivSpec = new IvParameterSpec(ivBytes);
			SecretKeySpec newKey = new SecretKeySpec(secretKey.getBytes("UTF-8"),"AES");
			Cipher cipher = null;
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.DECRYPT_MODE, newKey, ivSpec);    
        	
			return new String(cipher.doFinal(textBytes),"UTF-8");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	

}