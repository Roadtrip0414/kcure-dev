package kcure.portal.sys.pay.pay.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kcure.portal.cmn.CommonEnum.PayType;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.pay.pay.service.impl.PaymentHelper;
import kcure.portal.sys.pay.pay.service.impl.PaymentResultVO;
import kcure.portal.sys.pay.pay.service.impl.PaymentVO;

public interface PaymentService {
	int insertNicePaymentAndPaymentDataAplc(PaymentVO param, HashMap<String, Object> map) throws Exception;
	
	int insertNicePaymentAndPaymentExtd(PaymentVO param, HashMap<String, Object> map) throws Exception;

	int insertPaymentDataAplc(PaymentVO vo) throws Exception;
		
	int insertPaymentExtd(PaymentVO vo) throws Exception;

	int insertPaymentFail(PaymentVO param) throws Exception;

	PaymentResultVO selectPaymentResultDataAplc(String dataAplcNo) throws Exception;

	PaymentResultVO selectPaymentResultExtd(String rsrAsmtNo, String extdAplcNo) throws Exception;

	void insertPaymentDataAplcZero(HttpServletRequest request) throws Exception;
    
    void insertPaymentExtdZero(HttpServletRequest request) throws Exception;

    PaymentResultVO requestPayment(HttpServletRequest request, PayType payType) throws Exception;
}
