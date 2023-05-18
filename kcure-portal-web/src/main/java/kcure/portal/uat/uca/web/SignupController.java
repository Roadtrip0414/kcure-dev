package kcure.portal.uat.uca.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.ext.oauth.service.OAuthConfig;
import egovframework.com.ext.oauth.service.OAuthLogin;
import egovframework.com.ext.oauth.service.OAuthVO;
import egovframework.com.utl.sim.service.EgovFileScrty;
import kcure.portal.cmn.util.CheckPlusUtil;
import kcure.portal.cmn.util.TextUtility;
import kcure.portal.sys.pim.mng.service.PimMngService;
import kcure.portal.uat.uca.service.SignupService;
import kcure.portal.uat.uca.service.impl.SignupVO;


/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.uat.uca.web
 * @FileName : SigninController.java
 * @since : 2023. 1. 31.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 : 회원가입
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023.1.31    bhs             최초생성
 *  </pre>
 */
@Controller
@RequestMapping("/portal/uat/uca")
public class SignupController {

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "pimMngService")
	private PimMngService pimMngService;

	@Resource(name = "SignupService")
	private SignupService signupService;
	
	@Inject
	private OAuthVO kakaoAuthVO;
	
	@Inject
	private OAuthVO naverAuthVO;


	private static final Logger LOGGER = LoggerFactory.getLogger(SignupController.class);


	/**
     * @Method Name : viewSignup
     * @작성일 : 2023. 1. 31.
     * @작성자 : bhs
     * @Method 설명 : 회원가입 화면호출
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
	@RequestMapping(value = "/viewSignup.do")
	public String viewSignup(ModelMap model, HttpServletRequest request) throws Exception {
		// 2021.05.30, 정진오, 디지털원패스 처리하기 위해 로그인 화면에 인증방식 전달
		String authType = EgovProperties.getProperty("Globals.Auth").trim();
		model.addAttribute("authType", authType);
				
		//카카오톡 로그인 정보
		kakaoAuthVO.setLoginType("Login");
		OAuthLogin kakaoLogin = new OAuthLogin(kakaoAuthVO);
		LOGGER.debug("kakaoLogin.getOAuthURL() = "+kakaoLogin.getOAuthURL());
		model.addAttribute("kakao_url", kakaoLogin.getOAuthURL());
		
		//네이버 로그인	정보
		naverAuthVO.setLoginType("Login");
		OAuthLogin naverLogin = new OAuthLogin(naverAuthVO);
		LOGGER.debug("naverLogin.getOAuthURL() = "+naverLogin.getOAuthURL());
		model.addAttribute("naver_url", naverLogin.getOAuthURL());
				
		return "kcure/portal/uat/uca/ViewSignup";
	}


	/**
     * @Method Name : procSignupStp1
     * @작성일 : 2023. 1. 31.
     * @작성자 : bhs
     * @Method 설명 : SNS 회원가입 약관동의 화면호출
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
	@RequestMapping(value = "/procSignupStp1.do")
	public String procSignupStp2(ModelMap model, HttpServletRequest request, @ModelAttribute("signupVO") SignupVO signupVO) throws Exception {
		String retrunUrl = "";
        //SignupVO signupVO =  (SignupVO) request.getAttribute("signupVO");
        if(signupVO == null || signupVO.getUserEntMedmCd() == null){
        	retrunUrl = "kcure/portal/uat/uca/ViewSignup";
		}else {
			if(OAuthConfig.NAVER_SERVICE_CODE.equals(signupVO.getUserEntMedmCd())
					|| OAuthConfig.KAKAO_SERVICE_CODE.equals(signupVO.getUserEntMedmCd())
					|| OAuthConfig.ONEPASS_SERVICE_CODE.equals(signupVO.getUserEntMedmCd())
					)
			{
				request.getSession().setAttribute("joinTmpVO", signupVO);
				retrunUrl = "kcure/portal/uat/uca/ViewSignupStp1";
			}else {
				retrunUrl = "kcure/portal/uat/uca/ViewSignup";
			}
		}

		return retrunUrl;
	}


	/**
     * @Method Name : viewSignupStp1
     * @작성일 : 2023. 1. 31.
     * @작성자 : bhs
     * @Method 설명 : 회원가입 약관동의 화면호출
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
	@RequestMapping(value = "/viewSignupStp1.do")
	public String viewSignupStp1(ModelMap model, HttpServletRequest request, @ModelAttribute("signupVO") SignupVO signupVO) throws Exception {
		if(signupVO.getUserEntMedmCd() != null && signupVO.getUserEntMedmCd().equals("01")){
			if(signupVO.getUserId().isEmpty() || signupVO.getUserPswd().isEmpty()) {
				return "redirect:/portal/uat/uca/viewSignup.do";
			}
		}else {
			return "redirect:/portal/uat/uca/viewSignup.do";
		}

		request.getSession().setAttribute("joinTmpVO", signupVO);

		return "kcure/portal/uat/uca/ViewSignupStp1";
	}


	/**
     * @Method Name : viewSignupStp2
     * @작성일 : 2023. 1. 31.
     * @작성자 : bhs
     * @Method 설명 : 회원가입 본인인증 화면호출
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
	@RequestMapping(value = "/viewSignupStp2.do")
	public String viewSignupStp2(ModelMap model, HttpServletRequest request, @ModelAttribute("signupVO") SignupVO signupVO) throws Exception {
		SignupVO joinTmpVO = (SignupVO) request.getSession().getAttribute("joinTmpVO");

		if(joinTmpVO == null || signupVO.getTrmAgrYn() == null || !signupVO.getTrmAgrYn().equals("Y")
				|| signupVO.getPinfCnuAgrYn() == null || !signupVO.getPinfCnuAgrYn().equals("Y")
				|| signupVO.getPinfSp3pAgrYn() == null || !signupVO.getPinfSp3pAgrYn().equals("Y"))
		{
			return "redirect:/portal/uat/uca/viewSignup.do";
		}

		joinTmpVO.setTrmAgrYn(signupVO.getTrmAgrYn());
		joinTmpVO.setPinfCnuAgrYn(signupVO.getPinfCnuAgrYn());
		joinTmpVO.setPinfSp3pAgrYn(signupVO.getPinfSp3pAgrYn());

		HashMap encodeMap = CheckPlusUtil.encode();
		request.getSession().setAttribute("REQ_SEQ", (String)encodeMap.get("sRequestNumber"));

		model.addAttribute("data", encodeMap);

		return "kcure/portal/uat/uca/ViewSignupStp2";
	}


	/**
     * @Method Name : viewSignupStp3
     * @작성일 : 2023. 1. 31.
     * @작성자 : bhs
     * @Method 설명 : 회원가입 회원정보입력 화면호출
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
	@RequestMapping(value = "/viewSignupStp3.do")
	public String viewSignupStp3(ModelMap model, HttpServletRequest request) throws Exception {
		SignupVO joinTmpVO = (SignupVO) request.getSession().getAttribute("joinTmpVO");

		if(joinTmpVO == null || joinTmpVO.getPin() == null
				|| joinTmpVO.getPin().isEmpty()) {
			return "redirect:/portal/uat/uca/viewSignup.do";
		}

		model.addAttribute("prtiList", signupService.selectCmbPrtiList()); //참여기관 콤보용 정보
		model.addAttribute("data", joinTmpVO); //기본 사용자정보

		return "kcure/portal/uat/uca/ViewSignupStp3";
	}


	/**
     * @Method Name : viewSignupStp4
     * @작성일 : 2023. 1. 31.
     * @작성자 : bhs
     * @Method 설명 : 회원가입 완료 화면호출
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
	@RequestMapping(value = "/viewSignupStp4.do")
	public String viewSignupStp4(ModelMap model, HttpServletRequest request, @ModelAttribute("signupVO") SignupVO signupVO) throws Exception {
		SignupVO joinTmpVO = (SignupVO) request.getSession().getAttribute("joinTmpVO");		
		
		request.getSession().invalidate();
		
		if(joinTmpVO == null || joinTmpVO.getPin() == null || joinTmpVO.getPin().isEmpty()) {			
			return "redirect:/portal/uat/uca/viewSignup.do";
		}

		String paramPassword = null;
		
		if(joinTmpVO.getUserEntMedmCd().equals("01")) {
			paramPassword = joinTmpVO.getUserPswd();
		}else {
			paramPassword = signupVO.getUserPswd();			
		}
		
		//패스워드 세팅
		String pswdSltVl = EgovFileScrty.getSalt();
		String enpassword = EgovFileScrty.saltEncryptPassword(paramPassword, pswdSltVl);
		
		signupVO.setPswdSltVl(pswdSltVl); 
		signupVO.setLoginPswd(enpassword);

		//가입자 정보 세팅
		signupVO.setUserId(joinTmpVO.getUserId());
		signupVO.setPin(joinTmpVO.getPin());
		signupVO.setPinfCnuAgrYn(joinTmpVO.getPinfCnuAgrYn());
		signupVO.setPinfSp3pAgrYn(joinTmpVO.getPinfSp3pAgrYn());
		signupVO.setTrmAgrYn(joinTmpVO.getTrmAgrYn());
		signupVO.setUserEntMedmCd(joinTmpVO.getUserEntMedmCd());
		signupVO.setEntMedmRcvId(joinTmpVO.getEntMedmRcvId());
		
		//가입자 승인대기 세팅
		signupVO.setUserStcd("01"); 
		
		//회원정보 신규등록 
		signupService.insertUser(signupVO);
		
		return "kcure/portal/uat/uca/ViewSignupStp4";
	}


	/**
     * @Method Name : checkEmailDplct
     * @작성일 : 2023. 1. 31.
     * @작성자 : bhs
     * @Method 설명 : 이메일 중복 체크
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
	@RequestMapping(value = "/checkEmailDplct.do")
	public ModelAndView checkEmailDplct(@RequestParam Map<String, Object> commandMap) throws Exception {
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.setViewName("jsonView");

		String checkEmail = (String) commandMap.get("checkEmail");

		int usedCnt = signupService.selectCntByEmail(checkEmail);
		modelAndView.addObject("usedCnt", usedCnt);

		return modelAndView;
	}


	/**
     * @Method Name : popCpSuccess
     * @작성일 : 2023. 1. 31.
     * @작성자 : bhs
     * @Method 설명 : 본인인증 성공 팝업호출
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
	@RequestMapping(value = "/popCpSuccess.do")
	public String popCpSuccess(ModelMap model, HttpServletRequest request) {
		try {
			SignupVO joinTmpVO = (SignupVO) request.getSession().getAttribute("joinTmpVO");

			String sEncodeData = TextUtility.requestReplace(request.getParameter("EncodeData"), "encodeData");
			HashMap decodeMap = CheckPlusUtil.decode(sEncodeData);

			String sUserNm = (String)decodeMap.get("NAME");
			String sUserBirthDt = (String)decodeMap.get("BIRTHDATE");
			String sMobileNo = (String)decodeMap.get("MOBILE_NO");
			String sCi = (String)decodeMap.get("CI");
			String sRequestNumber  = (String)decodeMap.get("REQ_SEQ");

			String sessRequestNum = (String)request.getSession().getAttribute("REQ_SEQ");
			
			//회원정보수정 로직 분기 처리를 위한 변수(kyh)
			String sessUseGbn = (String)request.getSession().getAttribute("USE_GBN");

			String isExistUsr = "N";

			HashMap<String, Object> userInfo = null;

			if(sRequestNumber.equals(sessRequestNum))
	        {
				//핸드폰 CI정보 가입여부 체크
		        userInfo = signupService.selectUserByMobile(sCi);

		        if(userInfo != null) {
		        	isExistUsr = "Y";
		        	userInfo.put("mobile", sMobileNo);

		        	//회원정보수정 로직이 아닐 경우 세션초기화(kyh)
		        	if (!"updateUsrInfo".equals(sessUseGbn)) {
			        	userInfo.put("userid", TextUtility.maskingEmail(userInfo.get("userid").toString()));
			        	
		        		request.getSession().invalidate();
		        	} else {
		        		userInfo.put("userid", userInfo.get("userid").toString());
		        	}
		        }
		        
	        	//회원정보수정 로직이 아닐 경우 값 셋팅(kyh)
	        	if (!"updateUsrInfo".equals(sessUseGbn)) {
			        joinTmpVO.setPin(sCi);
			        joinTmpVO.setUserNm(sUserNm);
		        	joinTmpVO.setUserMbphNo(sMobileNo);
		        	joinTmpVO.setUserBirthDt(sUserBirthDt);
	        	}
	        }
			else
			{
				model.addAttribute("resultMessage", egovMessageSource.getMessage("fail.user.checkplusCnfirm",request.getLocale()));
				return "kcure/portal/uat/uca/CpFailPopup";
	        }

			model.addAttribute("isExistUsr", isExistUsr);
			model.addAttribute("userInfo", userInfo);

			model.addAttribute("resultMessage", egovMessageSource.getMessage("success.user.checkplusCnfirm",request.getLocale()));

		}catch(Exception e) {
			model.addAttribute("resultMessage", egovMessageSource.getMessage("fail.user.connectFail",request.getLocale()));
			return "kcure/portal/uat/uca/CpFailPopup";
		}

		return "kcure/portal/uat/uca/CpSuccessPopup";
	}


	/**
     * @Method Name : popCpFail
     * @작성일 : 2023. 1. 31.
     * @작성자 : bhs
     * @Method 설명 : 본인인증 실패 팝업호출
     *  <p>
     *  </p>
     * @param :
     * @return : String
	 * @throws Exception
     */
	@RequestMapping(value = "/popCpFail.do")
	public String popCpFail(ModelMap model, HttpServletRequest request) throws Exception {
		model.addAttribute("resultMessage", egovMessageSource.getMessage("fail.user.checkplusCnfirm",request.getLocale()));
		return "kcure/portal/uat/uca/CpFailPopup";
	}

}
