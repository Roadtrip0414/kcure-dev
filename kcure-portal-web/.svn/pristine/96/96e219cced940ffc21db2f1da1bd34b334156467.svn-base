package kcure.portal.sys.pay.pay.service.impl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.apache.commons.codec.binary.Hex;

/**
 * SHA-256 형식으로 암호화
 */
public class DataEncrypt {
    MessageDigest md;
    String strSRCData = "";
    String strENCData = "";
    String strOUTData = "";

    public DataEncrypt() {
    }

    public String encrypt(String strData) throws NoSuchAlgorithmException {
        String passACL = null;
        MessageDigest md = null;

        md = MessageDigest.getInstance("SHA-256");
        md.reset();
        md.update(strData.getBytes());
        byte[] raw = md.digest();
        passACL = encodeHex(raw);
        return passACL;
    }

    public String encodeHex(byte[] b) {
        char[] c = Hex.encodeHex(b);
        return new String(c);
    }
}