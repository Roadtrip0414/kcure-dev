package kcure.portal.sys.pay.pay.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum.PayType;
import kcure.portal.sys.pay.pay.service.PaymentService;

@Service("paymentService")
public class PaymentServiceImpl  extends EgovAbstractServiceImpl implements PaymentService {

	@Resource(name="paymentDAO")
    private PaymentDAO paymentDAO;

	@Override
	public int insertNicePaymentAndPaymentDataAplc(PaymentVO vo, HashMap<String, Object> map) throws Exception {
		//트랜잭션 처리 위해 한 함수 안에서 3개 insert 호출
		paymentDAO.insertNicePayment(map);
		paymentDAO.insertNicePaymentDetail(map);
		paymentDAO.insertPaymentDataAplc(vo);

		// 상태변경, 히스토리 업데이트 안하기로 결정되어 주석.
		// paymentDAO.updateExtdProgStcd(vo);
		// paymentDAO.insertDtapStatHst(vo);

		return 1;
	}

	@Override
	public int insertNicePaymentAndPaymentExtd(PaymentVO vo, HashMap<String, Object> map) throws Exception {
		//트랜잭션 처리 위해 한 함수 안에서 3개 insert 호출
		paymentDAO.insertNicePayment(map);
		paymentDAO.insertNicePaymentDetail(map);
		paymentDAO.insertPaymentExtd(vo);

		// 상태변경, 히스토리 업데이트 안하기로 결정되어 주석.
		// paymentDAO.updateExtdProgStcd(vo);
		// paymentDAO.insertDtapStatHst(vo);

		return 1;
	}

	@Override
	public int insertPaymentDataAplc(PaymentVO vo) throws Exception {
		return paymentDAO.insertPaymentDataAplc(vo);
	}

	@Override
	public int insertPaymentExtd(PaymentVO vo) throws Exception {
		return paymentDAO.insertPaymentExtd(vo);
	}

	@Override
	public int insertPaymentFail(PaymentVO vo) throws Exception {
		return paymentDAO.insertPaymentFail(vo);
	}

	@Override
	public PaymentResultVO selectPaymentResultDataAplc(String dataAplcNo) throws Exception {
		return paymentDAO.selectPaymentResultDataAplc(dataAplcNo);
	}
	
	@Override
	public PaymentResultVO selectPaymentResultExtd(String rsrAsmtNo, String extdAplcNo) throws Exception {
		return paymentDAO.selectPaymentResultExtd(rsrAsmtNo, extdAplcNo);
	}

	public void insertPaymentDataAplcZero(HttpServletRequest request) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
        PaymentVO payZeroVO = new PaymentVO();
        payZeroVO.setDataAplcNo(request.getParameter("dataAplcNo"));
        payZeroVO.setRsrAsmtNo(request.getParameter("rsrAsmtNo"));
        payZeroVO.setExtdAplcNo(request.getParameter("extdAplcNo"));
        payZeroVO.setExtdStcd(request.getParameter("extdStcd"));
        payZeroVO.setTid("");
        payZeroVO.setUserId(user.getId());
        payZeroVO.setPaymentType(request.getParameter("PayMethod"));
        payZeroVO.setPaymentAmount(0);
        payZeroVO.setGoodsType("1");
        insertPaymentDataAplc(payZeroVO);
    }
    
    public void insertPaymentExtdZero(HttpServletRequest request) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
        PaymentVO payZeroVO = new PaymentVO();
        payZeroVO.setDataAplcNo(request.getParameter("dataAplcNo"));
        payZeroVO.setRsrAsmtNo(request.getParameter("rsrAsmtNo"));
        payZeroVO.setExtdAplcNo(request.getParameter("extdAplcNo"));
        payZeroVO.setExtdStcd(request.getParameter("extdStcd"));
        payZeroVO.setTid("");
        payZeroVO.setUserId(user.getId());
        payZeroVO.setPaymentType(request.getParameter("PayMethod"));
        payZeroVO.setPaymentAmount(0);
        payZeroVO.setGoodsType("1");
        insertPaymentExtd(payZeroVO);
    }
    
    public PaymentResultVO requestPayment(HttpServletRequest request, PayType payType) throws Exception {
        request.setCharacterEncoding("utf-8");

        LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        if (user == null) {
        	throw new Exception("Login required");
        }

        /*
         ****************************************************************************************
         * <인증 결과 파라미터>
         ****************************************************************************************
         */
        String authResultCode = (String) request.getParameter("AuthResultCode"); // 인증결과 : 0000(성공)
        String authResultMsg = (String) request.getParameter("AuthResultMsg"); // 인증결과 메시지

        String nextAppURL = (String) request.getParameter("NextAppURL"); // 승인 요청 URL
        String nextAppURL2 = EgovProperties.getProperty("pay.nextAppURL");
        if (nextAppURL2 != null && nextAppURL2 != "") {
        	nextAppURL = nextAppURL2;
        }

        String txTid = (String) request.getParameter("TxTid"); // 거래 ID
        String authToken = (String) request.getParameter("AuthToken"); // 인증 TOKEN
        String payMethod = (String) request.getParameter("PayMethod"); // 결제수단
        String mid = (String) request.getParameter("MID"); // 상점 아이디
        String moid = (String) request.getParameter("Moid"); // 상점 주문번호
        String amt = (String) request.getParameter("Amt"); // 결제 금액
        String reqReserved = (String) request.getParameter("ReqReserved"); // 상점 예약필드
        String netCancelURL = (String) request.getParameter("NetCancelURL"); // 망취소 요청 URL
        // String authSignature = (String)request.getParameter("Signature"); // Nicepay에서 내려준 응답값의 무결성 검증 Data
        String dataAplcNo = (String) request.getParameter("dataAplcNo");
        String rsrAsmtNo = (String) request.getParameter("rsrAsmtNo");
        String extdAplcNo = (String) request.getParameter("extdAplcNo");
        String extdStcd = (String) request.getParameter("extdStcd");

        /*
         ****************************************************************************************
         * Signature : 요청 데이터에 대한 무결성 검증을 위해 전달하는 파라미터로 허위 결제 요청 등 결제 및 보안 관련 이슈가 발생할 만한
         * 요소를 방지하기 위해 연동 시 사용하시기 바라며
         * 위변조 검증 미사용으로 인해 발생하는 이슈는 당사의 책임이 없음 참고하시기 바랍니다.
         ****************************************************************************************
         */
        DataEncrypt sha256Enc = new DataEncrypt();
        // 인증 응답 Signature = hex(sha256(AuthToken + MID + Amt + MerchantKey)
        // String authComparisonSignature = sha256Enc.encrypt(authToken + mid + amt +
        // merchantKey);

        /*
         ****************************************************************************************
         * <승인 결과 파라미터 정의>
         * 샘플페이지에서는 승인 결과 파라미터 중 일부만 예시되어 있으며,
         * 추가적으로 사용하실 파라미터는 연동메뉴얼을 참고하세요.
         ****************************************************************************************
         */
        String ResultCode = "";
        String ResultMsg = "";
        String PayMethod = "";
        String GoodsName = "";
        String Amt = "";
        String TID = "";
        // 계좌이체
        String bankCode = "";
        String bankName = "";
        String rcptType = "";
        String rcptTid = "";
        String rcptAuthCode = "";
        // 가상계좌 인 경우
        String VbankBankCode = "";
        String VbankBankName = "";
        String VbankNum = "";
        String VbankExpDate = "";
        String VbankExpTime = "";
        // String Signature = ""; String paySignature = "";

        /*
         ****************************************************************************************
         * <인증 결과 성공시 승인 진행>
         ****************************************************************************************
         */
        String resultJsonStr = "";
        if ("0000".equals(authResultCode) /* && authSignature.equals(authComparisonSignature) */) {
            /*
             ****************************************************************************************
             * <해쉬암호화> (수정하지 마세요)
             * SHA-256 해쉬암호화는 거래 위변조를 막기위한 방법입니다.
             ****************************************************************************************
             */
            String ediDate = PaymentHelper.getyyyyMMddHHmmss();
            String signData = sha256Enc.encrypt(authToken + mid + amt + ediDate + PaymentHelper.getMerchantKey());

            /*
             ****************************************************************************************
             * <승인 요청>
             * 승인에 필요한 데이터 생성 후 server to server 통신을 통해 승인 처리 합니다.
             ****************************************************************************************
             */
            StringBuffer requestData = new StringBuffer();
            requestData.append("TID=").append(txTid).append("&");
            requestData.append("AuthToken=").append(authToken).append("&");
            requestData.append("MID=").append(mid).append("&");
            requestData.append("Amt=").append(amt).append("&");
            requestData.append("EdiDate=").append(ediDate).append("&");
            requestData.append("CharSet=").append("utf-8").append("&");
            requestData.append("SignData=").append(signData);

            resultJsonStr = PaymentHelper.connectToServer(requestData.toString(), nextAppURL);

            HashMap<String, Object> resultData = new HashMap<String, Object>();
            boolean paySuccess = false;
            if ("9999".equals(resultJsonStr)) {
                /*
                 *************************************************************************************
                 * <망취소 요청>
                 * 승인 통신중에 Exception 발생시 망취소 처리를 권고합니다.
                 *************************************************************************************
                 */
                requestData.append("&").append("NetCancel=").append("1");
                String cancelResultJsonStr = PaymentHelper.connectToServer(requestData.toString(), netCancelURL);

                HashMap<String, Object> cancelResultData = PaymentHelper.jsonStringToHashMap(cancelResultJsonStr);
                ResultCode = (String) cancelResultData.get("ResultCode");
                ResultMsg = (String) cancelResultData.get("ResultMsg");

                // 결제 실패 저장
                PaymentVO payVO = new PaymentVO();
                payVO.setGoodsName(GoodsName);
                payVO.setTid("9999");
                payVO.setErrorCode(ResultCode);
                payVO.setErrorDesc(ResultMsg);
                payVO.setDataAplcNo(dataAplcNo);
                payVO.setRsrAsmtNo(rsrAsmtNo);
                payVO.setExtdAplcNo(extdAplcNo);
                payVO.setExtdStcd(extdStcd);
                payVO.setGoodsType("1");
                insertPaymentFail(payVO);
            } else {
                resultData = PaymentHelper.jsonStringToHashMap(resultJsonStr);

                ResultCode = (String) resultData.get("ResultCode"); // 결과코드 (정상 결과코드:3001)
                ResultMsg = (String) resultData.get("ResultMsg"); // 결과메시지
                PayMethod = (String) resultData.get("PayMethod"); // 결제수단
                GoodsName = (String) resultData.get("GoodsName"); // 상품명
                Amt = (String) resultData.get("Amt"); // 결제 금액
                TID = (String) resultData.get("TID"); // 거래번호
                // Signature : Nicepay에서 내려준 응답값의 무결성 검증 Data
                // 가맹점에서 무결성을 검증하는 로직을 구현하여야 합니다.
                /*
                 * Signature = (String)resultData.get("Signature");
                 * paySignature = sha256Enc.encrypt(TID + mid + Amt + merchantKey);
                 */

                /*
                 *************************************************************************************
                 * <결제 성공 여부 확인>
                 *************************************************************************************
                 */
                if (PayMethod != null) {
                    if (PayMethod.equals("CARD")) {
                        if (ResultCode.equals("3001"))
                            paySuccess = true; // 신용카드(정상 결과코드:3001)
                    } else if (PayMethod.equals("BANK")) {
                        if (ResultCode.equals("4000"))
                            paySuccess = true; // 계좌이체(정상 결과코드:4000)

                        bankCode = (String) resultData.get("bankCode"); // 결제은행 코드
                        bankName = (String) resultData.get("BankName"); // 결제은행명
                        rcptType = (String) resultData.get("RcptType"); // 현금영수증 타입 (0:발행안함, 1:소득공제, 2:지출증빙)
                        rcptTid = (String) resultData.get("RcptTID"); // 현금영수증 TID
                        rcptAuthCode = (String) resultData.get("RcptAuthCode"); // 현금영수증 승인번호
                    } else if (PayMethod.equals("CELLPHONE")) {
                        if (ResultCode.equals("A000"))
                            paySuccess = true; // 휴대폰(정상 결과코드:A000)
                    } else if (PayMethod.equals("VBANK")) {
                        if (ResultCode.equals("4100"))
                            paySuccess = true; // 가상계좌(정상 결과코드:4100)
                        VbankBankCode = (String) resultData.get("VbankBankCode"); // 가상계좌 은행 코드
                        VbankBankName = (String) resultData.get("VbankBankName"); // 가상계좌 은행명
                        VbankNum = (String) resultData.get("VbankNum"); // 가상계좌 번호
                        VbankExpDate = (String) resultData.get("VbankExpDate"); // 가상계좌 만료일
                        VbankExpTime = (String) resultData.get("VbankExpTime"); // 가상계좌 만료시간
                    } else if (PayMethod.equals("SSG_BANK")) {
                        if (ResultCode.equals("0000"))
                            paySuccess = true; // SSG은행계좌(정상 결과코드:0000)
                    } else if (PayMethod.equals("CMS_BANK")) {
                        if (ResultCode.equals("0000"))
                            paySuccess = true; // 계좌간편결제(정상 결과코드:0000)
                    }
                }

                PaymentVO payVO = new PaymentVO();
                payVO.setDataAplcNo(dataAplcNo);
                payVO.setRsrAsmtNo(rsrAsmtNo);
                payVO.setExtdAplcNo(extdAplcNo);
                payVO.setExtdStcd(extdStcd);
                payVO.setTid(TID);
                payVO.setUserId(user.getId());
                payVO.setPaymentType(PayMethod);
                payVO.setPaymentAmount(Integer.parseInt(Amt));
                payVO.setGoodsType("1");

                if (paySuccess) {
                    // 결과 저장
                    resultData.put("goodsType", "1");
                    resultData.put("userId", user.getId());
                    // 결제 정보 저장
                	if (payType == PayType.DATA_APLC) {
                        insertNicePaymentAndPaymentDataAplc(payVO, resultData);
                	} else if (payType == PayType.EXTD) {
                		insertNicePaymentAndPaymentExtd(payVO, resultData);
                	}
                } else {
                    // 결제 정보 저장
                    payVO.setGoodsName(GoodsName);
                    payVO.setErrorCode(ResultCode);
                    payVO.setErrorDesc(ResultMsg);
                    insertPaymentFail(payVO);
                }
            }
        } else/* if(authSignature.equals(authComparisonSignature)) */ {
            // 실패
            ResultCode = authResultCode;
            ResultMsg = authResultMsg;

            // 결제 정보 저장
            PaymentVO payVO = new PaymentVO();
            payVO.setGoodsName(GoodsName);
            payVO.setTid("9999");
            payVO.setErrorCode(ResultCode);
            payVO.setErrorDesc(ResultMsg);
            payVO.setDataAplcNo(dataAplcNo);
            payVO.setRsrAsmtNo(rsrAsmtNo);
            payVO.setExtdAplcNo(extdAplcNo);
            payVO.setExtdStcd(extdStcd);
            payVO.setGoodsType("1");
            insertPaymentFail(payVO);

        } /*
           * else{
           * System.out.println("인증 응답 Signature : " + authSignature);
           * System.out.println("인증 생성 Signature : " + authComparisonSignature);
           * }
           */

        PaymentResultVO resultVO = null;
        if (payType == PayType.DATA_APLC) {
        	resultVO = selectPaymentResultDataAplc(dataAplcNo);
        } else if (payType == PayType.EXTD) {
        	resultVO = selectPaymentResultExtd(rsrAsmtNo, extdAplcNo);
        }
        return resultVO;
    }
}
