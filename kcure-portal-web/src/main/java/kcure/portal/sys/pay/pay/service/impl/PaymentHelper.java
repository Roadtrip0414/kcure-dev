package kcure.portal.sys.pay.pay.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.sys.pay.pay.service.PaymentService;

import org.json.simple.JSONObject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

public class PaymentHelper {
    public static String getyyyyMMddHHmmss() {
        SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
        return yyyyMMddHHmmss.format(new Date());
    }

    public static PaymentReadyVO getPaymentReady(String dataAplcNo, String rsrAsmtNo, String extdAplcNo, String extdStcd,
    		String buyerName, String buyerEmail, String buyerTel, int amt, String goodsName, String returnUrl,
    		HttpServletRequest request) throws NoSuchAlgorithmException {
    	
        String mid = getMid();
        String merchantKey = getMerchantKey();
    
        DataEncrypt sha256Enc = new DataEncrypt();
        String ediDate = PaymentHelper.getyyyyMMddHHmmss();
        
        if (!returnUrl.startsWith(request.getScheme())) {
        	returnUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + returnUrl;
        }

        PaymentReadyVO vo = new PaymentReadyVO();
        
        vo.setMid(mid);
        vo.setReturnURL(returnUrl);
        vo.setMoid(ediDate + dataAplcNo);
        vo.setGoodsName(goodsName);
        vo.setAmt(amt);

        vo.setBuyerName(buyerName);
        vo.setBuyerEmail(buyerEmail);
        vo.setBuyerTel(buyerTel);

        vo.setEdiDate(ediDate);
        vo.setSignData(sha256Enc.encrypt(ediDate + mid + amt + merchantKey));
        vo.setDataAplcNo(dataAplcNo);
        vo.setRsrAsmtNo(rsrAsmtNo);
        vo.setExtdAplcNo(extdAplcNo);
        vo.setExtdStcd(extdStcd);
        
        return vo;
    }
    
    public static String getMid() {
    	return EgovProperties.getProperty("pay.mid");
    }
    public static String getMerchantKey() {
    	return EgovProperties.getProperty("pay.merchantKey");
    }
    
    public static String connectToServer(String data, String reqUrl) throws IOException, Exception {
        HttpURLConnection conn = null;
        BufferedReader resultReader = null;
        PrintWriter pw = null;
        URL url = null;

        int statusCode = 0;
        StringBuffer recvBuffer = new StringBuffer();
        try {
            url = new URL(reqUrl);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(25000);
            conn.setDoOutput(true);

            pw = new PrintWriter(conn.getOutputStream());
            pw.write(data);
            pw.flush();

            statusCode = conn.getResponseCode();
            resultReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            for (String temp; (temp = resultReader.readLine()) != null;) {
                recvBuffer.append(temp).append("\n");
            }

            if (!(statusCode == HttpURLConnection.HTTP_OK)) {
                throw new IOException();
            }

            return recvBuffer.toString().trim();
        } catch (NullPointerException e) {
            return "9999";
        } catch (IOException e) {
            return "9999";
        } catch (ClassCastException e) {
            return "9999";
        } catch (IllegalStateException e) {
            return "9999";
        } catch (Exception e) {
            return "9999";
        } finally {
            recvBuffer.setLength(0);

            try {
                if (resultReader != null) {
                    resultReader.close();
                }
            } catch (NullPointerException e) {
                resultReader = null;
            } catch (IOException e) {
                resultReader = null;
            } catch (ClassCastException e) {
                resultReader = null;
            } catch (IllegalStateException e) {
                resultReader = null;
            } catch (Exception e) {
                resultReader = null;
            }

            try {
                if (pw != null) {
                    pw.close();
                }
            } catch (NullPointerException e) {
                pw = null;
            } catch (ClassCastException e) {
                pw = null;
            } catch (IllegalStateException e) {
                pw = null;
            } catch (Exception e) {
                pw = null;
            }

            try {
                if (conn != null) {
                    conn.disconnect();
                }
            } catch (NullPointerException e) {
                conn = null;
            } catch (ClassCastException e) {
                conn = null;
            } catch (IllegalStateException e) {
                conn = null;
            } catch (Exception e) {
                conn = null;
            }
        }
    }

    /**
     * JSON String -> HashMap 변환
     *
     * @param String
     * @return
     * @throws ParseException
     */
    public static HashMap<String, Object> jsonStringToHashMap(String str) throws ParseException {
        HashMap<String, Object> dataMap = new HashMap<String, Object>();
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(str);
        JSONObject jsonObject = (JSONObject) obj;

        Iterator<String> keyStr = jsonObject.keySet().iterator();
        while (keyStr.hasNext()) {
            String key = keyStr.next();
            Object value = jsonObject.get(key);

            dataMap.put(key, value);
        }
        return dataMap;
    }
}
