package kcure.portal.sys.pay.pay.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kcure.portal.sys.cmm.service.impl.ComAbstractDAO;

@Repository("paymentDAO")
public class PaymentDAO extends ComAbstractDAO {
    public int insertNicePayment(HashMap<String, Object> map) {
        return insert("Pay.insertNicePayment", map);
    }

    public int insertNicePaymentDetail(HashMap<String, Object> map) {
        return insert("Pay.insertNicePaymentDetail", map);
    }

    public int insertPaymentDataAplc(PaymentVO paymentVO) {
        return insert("Pay.insertPaymentDataAplc", paymentVO);
    }

    public int insertPaymentExtd(PaymentVO paymentVO) {
        return insert("Pay.insertPaymentExtd", paymentVO);
    }

    public int insertPaymentFail(PaymentVO paymentVO) {
        return insert("Pay.insertPaymentFail", paymentVO);
    }

    public int updateExtdProgStcd(PaymentVO paymentVO) {
    	return update("Pay.updateExtdProgStcd", paymentVO);
    }
    
    public int insertDtapStatHst(PaymentVO paymentVO) {
    	return update("Pay.insertDtapStatHst", paymentVO);
    }

    public PaymentResultVO selectPaymentResultDataAplc(String dataAplcNo) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("dataAplcNo", dataAplcNo);
    	return (PaymentResultVO)selectOne("Pay.selectPaymentResultDataAplc", map);
    }

    public PaymentResultVO selectPaymentResultExtd(String rsrAsmtNo, String extdAplcNo) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("rsrAsmtNo", rsrAsmtNo);
    	map.put("extdAplcNo", extdAplcNo);
    	return (PaymentResultVO)selectOne("Pay.selectPaymentResultExtd", map);
    }
}
