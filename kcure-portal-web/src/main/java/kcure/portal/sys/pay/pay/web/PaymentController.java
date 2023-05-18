package kcure.portal.sys.pay.pay.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum.PayType;
import kcure.portal.sys.ctg.col.service.CtgColService;
import kcure.portal.sys.pay.pay.service.PaymentService;
import kcure.portal.sys.pay.pay.service.impl.DataEncrypt;
import kcure.portal.sys.pay.pay.service.impl.PaymentHelper;
import kcure.portal.sys.pay.pay.service.impl.PaymentReadyVO;
import kcure.portal.sys.pay.pay.service.impl.PaymentResultVO;
import kcure.portal.sys.pay.pay.service.impl.PaymentVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.EgovProperties;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/sys/pay")
public class PaymentController {
    @Resource(name = "paymentService")
    private PaymentService paymentService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;


    /**
     * 결제 페이지
     *
     * @param model
     * @return
     * @throws NoSuchAlgorithmException
     */
    @RequestMapping(value = "/pay.do")
    public String index(HttpServletRequest request, ModelMap model) throws Exception {
    	Date date = new Date();
        String dataAplcNo = Long.toString(date.getTime() / 1000l); 
        String buyerName = "홍길동";
        String buyerEmail = "test@test.com";
        String buyerTel = "01012341234";
        int amt = 500;
        String goodsName = "연구비";
        String returnUrl = "/portal/sys/pay/request.do";
    	PaymentReadyVO paymentReadyVo = PaymentHelper.getPaymentReady(dataAplcNo, "", "", "", buyerName, buyerEmail, buyerTel, amt, goodsName, returnUrl, request);
    	model.addAttribute("pay", paymentReadyVo);

        return "kcure/portal/sys/pay/ViewPay";
    }

    /**
     * 결제 API 호출
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/request.do")
    public String request(HttpServletRequest request, ModelMap model) throws Exception {
    	PaymentResultVO resultVO = paymentService.requestPayment(request, PayType.DATA_APLC);
        model.addAttribute("resultVO", resultVO);
        return "kcure/portal/sys/pay/ViewResult";
    }
}
