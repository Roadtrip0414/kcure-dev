package kcure.portal.uat.uia.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.config.EgovLoginConfig;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.ext.oauth.service.OAuthConfig;
import egovframework.com.ext.oauth.service.OAuthLogin;
import egovframework.com.ext.oauth.service.OAuthUniversalUser;
import egovframework.com.ext.oauth.service.OAuthVO;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.uat.uca.service.impl.SignupVO;
import kcure.portal.uat.uia.service.KcureLoginService;
import kcure.portal.uat.uia.service.impl.KcureLoginVO;
import kr.go.onepass.client.dto.api.send.OnepassUserResponse;
import kr.go.onepass.client.dto.api.send.OnepassUserResponse.USER_STATUS;
import kr.go.onepass.client.dto.saml.OnepassResponse;
import kr.go.onepass.client.handler.api.ApiSendHandler;
import kr.go.onepass.client.handler.saml.OnepassRequestHandler;
import kr.go.onepass.client.handler.saml.OnepassResponseHandler;
import kr.go.onepass.client.handler.saml.OnepassResponseHandler.RESULT_CODE;
import kr.go.onepass.client.handler.saml.OnepassResponseHandler.STATUS;
import kr.go.onepass.client.handler.saml.OnepassResponseHandler.TYPE;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.uat.uia.web
  * @FileName : KcureLoginController.java
  * @since : 2023. 1. 31. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 포탈 로그인	
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@RequestMapping("/portal/uat/uia")
@Controller
public class KcureLoginController {

	/** EgovLoginService */
	@Resource(name = "KcureLoginService")
	private KcureLoginService loginService;

	/** EgovCmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "egovLoginConfig")
	EgovLoginConfig egovLoginConfig;
	
	@Inject
	private OAuthVO kakaoAuthVO;
	
	@Inject
	private OAuthVO naverAuthVO;

	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(KcureLoginController.class);

	/**
	  * @Method Name : loginUsrView
	  * @date : 2023. 1. 31.
	  * @Method 설명 :
	  *  <p>	
	  *     로그인 화면 
	  *     /portal/uat/uia/pub/viewLoginUsr.do
	  *     /portal/uat/uia/pub/viewLoginUsr.do
	  *  </p>
	  * @param : 
	  * @return :
	  */
	@RequestMapping(value = "/pub/viewLoginUsr.do")
	public String loginUsrView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		// 2021.05.30, 정진오, 디지털원패스 처리하기 위해 로그인 화면에 인증방식 전달
		String authType = EgovProperties.getProperty("Globals.Auth").trim();
		model.addAttribute("authType", authType);

		String message = (String)request.getParameter("loginMessage");
		if (message!=null) model.addAttribute("loginMessage", message);
		
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
		
		return "kcure/portal/uat/uia/KcureLoginUsr";
	}
	
	/**
	  * @Method Name : actionLogin
	  * @date : 2023. 1. 31.
	  * @Method 설명 :
	  *  <p>	
	  *     일반(세션) 로그인을 처리한다
	  *  </p>
	  * @param : 
	  * @return :
	  */
	@RequestMapping(value = "/actionLogin.do")
	public String actionLogin(@ModelAttribute("loginVO") KcureLoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {	
		System.out.println("---------actionLogin.do----------------");
		System.out.println(loginVO.toString());
		// 1. 로그인인증확인
	    Map<?,?> mapLockUserInfo = (EgovMap)loginService.getLoginIncorrect(loginVO);
	    
	    if(mapLockUserInfo != null){			
			//2.1 로그인인증제한 처리
	    	/**
	    	 * sLoginIncorrectCode = C : 로그인 실패
	    	 * sLoginIncorrectCode = E : 로그인 성공( 비밀번호 확인 완료 )
	    	 *  */
			String sLoginIncorrectCode = loginService.processLoginIncorrect(loginVO, mapLockUserInfo);				
			//STODO : 우선 비밀번호 확인 만으로 로그인 여부 확인.
			if(!sLoginIncorrectCode.equals("E")){
				//비밀번호가 틀릴경우
				if(sLoginIncorrectCode.equals("C")){
					model.addAttribute("loginMessage", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
				}
				//return "kcure/portal/uat/uia/KcureLoginUsr";
				return "redirect:/portal/uat/uia/pub/viewLoginUsr.do";
			}
			
	    }else{
	    	model.addAttribute("loginMessage", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
	    	//return "kcure/portal/uat/uia/KcureLoginUsr";
	    	return "redirect:/portal/uat/uia/pub/viewLoginUsr.do";
	    	
	    	
	    	// 
	    }
	    
	    
	    ObjectMapper objectMapper = new ObjectMapper();
	    KcureLoginVO resultVO = objectMapper.convertValue(mapLockUserInfo, KcureLoginVO.class);
	    //세션 및 해당내역 공통 처리.
	    return loginAction(resultVO,model);
		
	}
	
	
	/**
	  * @Method Name : loginAction
	  * @date : 2023. 2. 1.
	  * @Method 설명 :
	  *  <p>	
	  *     로그인 확인후 처리 function 
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public String loginAction(KcureLoginVO resultVO,ModelMap model) throws Exception{
		// 일반 로그인 처리
		if (resultVO != null && resultVO.getUserId() != null && !resultVO.getUserId().equals("")) {
			// 3-1. 로그인 정보를 세션에 저장
			//STODO : 로그인 완료후 session 처리 정리 필요.
			LoginVO sessionInfo = new LoginVO();
			sessionInfo.setId(resultVO.getUserId());
			sessionInfo.setName(resultVO.getUserNm());
			sessionInfo.setPassword(resultVO.getLoginPswd());
			sessionInfo.setUniqId(resultVO.getPin());
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();			 
			request.getSession().setAttribute("loginVO", sessionInfo);
			//로그인 로그 남기기.
			sessionInfo.setIp(request.getRemoteAddr());
			sessionInfo.setConectMthd("I");
			
			//추가사용자정보
			sessionInfo.setPswdSltVl(resultVO.getPswdSltVl());	//비밀번호솔트값
			sessionInfo.setUserStcd(resultVO.getUserStcd());	//사용자상태코드
			sessionInfo.setPrtiId(resultVO.getPrtiId());	//참여기관ID
			sessionInfo.setPrtiNm(resultVO.getPrtiNm());	//참여기관명
			sessionInfo.setUserMbphNo(resultVO.getUserMbphNo());	//사용자이동전화번호
			sessionInfo.setUserEntMedmCd(resultVO.getUserEntMedmCd());	//사용자가입매체코드
			sessionInfo.setEntMedmRcvId(resultVO.getEntMedmRcvId());	//가입매체수신ID
			sessionInfo.setTrmAgrYn(resultVO.getTrmAgrYn());	//이용약관동의여부
			sessionInfo.setPinfCnuAgrYn(resultVO.getPinfCnuAgrYn());	//개인정보수집이용동의여부
			sessionInfo.setPinfSp3pAgrYn(resultVO.getPinfSp3pAgrYn());	//개인정보제3자제공동의여부
			sessionInfo.setEmailRcvAgrYn(resultVO.getEmailRcvAgrYn());	//이메일수신동의여부
			sessionInfo.setSmsRcvAgrYn(resultVO.getSmsRcvAgrYn());	//SMS수신동의여부
			sessionInfo.setAdmAuthPossYn(resultVO.getAdmAuthPossYn());	//관리자권한보유여부
			sessionInfo.setUsrMnuMode("01");	//사용자메뉴모드( 01 : 사용자영역 / 02 : 관리자영역 )
			//domain 및 참여기관 host_cd 값
			
			
			return "redirect:/portal/uat/uia/actionMain.do";
		} else {
			//로그인 화면으로 리턴
			model.addAttribute("loginMessage", egovMessageSource.getMessage("fail.common.login"));
			return "forward:/portal/uat/uia/pub/viewLoginUsr.do";
		}
		
	}
	
	
	/**
	 * 로그인 후 메인화면으로 들어간다
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/actionMain.do")
	public String actionMain(ModelMap model, HttpServletRequest request) throws Exception {
		// 메인 페이지 이동
		String main_page = Globals.MAIN_PAGE;
		LOGGER.debug("Globals.MAIN_PAGE > " + Globals.MAIN_PAGE);
		LOGGER.debug("main_page > {}", main_page);
		return "redirect:"+request.getContextPath()+ main_page;
	}

	/**
	  * @Method Name : oauthLoginCallback
	  * @date : 2023. 2. 1.
	  * @Method 설명 :
	  *  <p>	
	  *     카카오, 네이버 로그인 callback 
	  *  </p>
	  * @param : 
	  * @return :
	  */
	@RequestMapping(value = "/auth/{oauthService}/callback", 
			method = { RequestMethod.GET, RequestMethod.POST})
	public String oauthLoginCallback(@PathVariable String oauthService,
			ModelMap model, @RequestParam String code, HttpSession session) throws Exception {
		System.out.println("oauthLoginCallback: service={}"+oauthService);
		System.out.println("===>>> code = "+ code);
		for(String key : model.keySet()) {
			System.out.println(key);
		}
		
		SignupVO signupVo = new SignupVO();
		
		OAuthVO oauthVO = null;
		if (StringUtils.equals(OAuthConfig.NAVER_SERVICE_NAME, oauthService)) {
			oauthVO = naverAuthVO;
			signupVo.setUserEntMedmCd(OAuthConfig.NAVER_SERVICE_CODE);
		}else {
			oauthVO = kakaoAuthVO;
			signupVo.setUserEntMedmCd(OAuthConfig.KAKAO_SERVICE_CODE);
		}
			
		
		System.out.println(oauthVO.toString());
		// 1. code를 이용해서 Access Token 받기
		// 2. Access Token을 이용해서 사용자 제공정보 가져오기
		OAuthLogin oauthLogin = new OAuthLogin(oauthVO);
		System.out.println("------------------------------------------------------");
		System.out.println("------------------------------------------------------");
		System.out.println("------------------------------------------------------");
		OAuthUniversalUser oauthUser = oauthLogin.getUserProfile(code); // 1,2번 동시
		LOGGER.debug("Profile ===>>" + oauthUser);
		
		KcureLoginVO param = new KcureLoginVO();
		param.setEntMedmRcvId(oauthUser.getUserId());
		//회원가입 
		signupVo.setEntMedmRcvId(oauthUser.getUserId());
		signupVo.setUserId(oauthUser.getEmail());
		
		Map<?,?> resultDBInfo = (EgovMap)loginService.getLoginIncorrect(param);
		
		ObjectMapper objectMapper = new ObjectMapper();
	    KcureLoginVO resultVO = objectMapper.convertValue(resultDBInfo, KcureLoginVO.class);
	    
	    if(resultVO != null && resultVO.getUserId() != "") {
	    	System.out.println("------------------------1------------------------------");
	    	//세션 및 해당내역 공통 처리.
		    return loginAction(resultVO,model);
	    }else {
	    	System.out.println("------------------------2------------------------------");
	    	//회원가입 호출
	    	model.addAttribute("signupVO", signupVo);
	    	
	    	model.addAttribute("userEntMedmCd", signupVo.getUserEntMedmCd());
			model.addAttribute("userId", signupVo.getUserId());
			model.addAttribute("entMedmRcvId", signupVo.getEntMedmRcvId());
			//return "forward:/portal/uat/uca/procSignupStp1.do";
	    	return "kcure/portal/uat/uia/snsLoginResult";
	    }
	    
	    
	    /*
	    if(oauthVO.getLoginType().equals("Login")) {
	    	//세션 및 해당내역 공통 처리.
		    return loginAction(resultVO,model);
	    }else {
	    	//STODO : 회원가입 정보로 return 추후 처리.
			model.addAttribute("loginVo", oauthVO);
			return "/portal/uat/uia/pub/viewLoginUsr.do";
	    }
	    */
	}
	
	
	
	/**
	 * 디지털원패스 로그인 처리
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/onepass/onepassLogin.do", method=RequestMethod.POST)
	public String onepassLogin(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		String serviceType = request.getParameter("serviceType");
		String action = null;
		String inputName = null;
		String inputValue = null;
		String pageType = OnepassRequestHandler.pageType(request);

		try {
			if ("LOGIN".equals(serviceType)) {
				action = OnepassRequestHandler.LOGIN_DEST;
				inputName = OnepassRequestHandler.LOGIN_INPUT_NAME;
				inputValue = OnepassRequestHandler.login();
			} else if ("LOGOUT".equals(serviceType)) {
				action = OnepassRequestHandler.logoutDest(request);
				inputName = OnepassRequestHandler.LOGOUT_INPUT_NAME;
				inputValue = OnepassRequestHandler.logout(request);
			} else {
				action = request.getContextPath()+"/";
				inputName = "";
				inputValue = "";
			}
		} catch (Exception e) {
			return "egovframework/com/cmm/error/onepassAccessDenied";
		}

		model.addAttribute("redirectUrl", action);
		model.addAttribute("inputName", inputName);
		model.addAttribute("inputValue", inputValue);
		model.addAttribute("pageType", pageType);

		//return "egovframework/com/uat/uia/onepass/onepassLogin";
		return "kcure/portal/uat/uia/onepass/onepassLogin";
		
	}
	
	
	/**
	 * 디지털원패스 로그인 완료 후 응답받은 callback
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/onepass/onepassCallback.do", method=RequestMethod.POST)
	public String onepassCallback(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String onepassReturnPage = "kcure/portal/uat/uia/onepass/onepassResult";
		// 인증체크
		OnepassResponse onepassResponse = OnepassResponseHandler.check(request);
		System.out.println("====================");
		System.out.println(onepassResponse.getStatus());
		System.out.println("====================");
		// 인증 성공
		if (onepassResponse.getStatus() == STATUS.SUCCESS  && onepassResponse.getResultCode() == RESULT_CODE.SUCCESS) {

			// type 이 LOGIN
			if (onepassResponse.getType() == TYPE.LOGIN) {
				String userKey = onepassResponse.getUserKey();
			    String intfToken = onepassResponse.getIntfToken();

			    // 인증 후 사용자 정보 조회
			    ApiSendHandler apiSendHandler = new ApiSendHandler();
			    OnepassUserResponse findOnepassUser = apiSendHandler.findUser(userKey, intfToken);

			    // 사용자 정보 조회 성공
			    if (findOnepassUser != null && findOnepassUser.getStatus() == USER_STATUS.USE) {

			    	// 디지털원패스 사용자 정보 - 신규회원일 경우 이 정보를 이용할 수 있음
			    	LOGGER.info("getId:{}", findOnepassUser.getId()); // 사용자의 ID (최대 30자)
			    	LOGGER.info("getName:{}", findOnepassUser.getName()); // 사용자의 이름 (최대 70자)
			    	LOGGER.info("getUserKey:{}", findOnepassUser.getUserKey()); // 사용자 유일값인 user key 가 전달된다. (최대 50자)
			    	LOGGER.info("getCi:{}", findOnepassUser.getCi()); // 사용자의 CI (최대 255자)
			        LOGGER.info("getBirth:{}", findOnepassUser.getBirth()); // 사용자의 생년월일 (최대 8자)
			        LOGGER.info("getPhone:{}", findOnepassUser.getPhone()); // 사용자의 휴대전화번호 (최대 14자)
			        LOGGER.info("getEmail:{}", findOnepassUser.getEmail()); // 사용자의 E-mail (최대 70자)
			    	LOGGER.info("getSex:{}", findOnepassUser.getSex()); // 사용자의 성별 (남:M, 여:F)
			        LOGGER.info("getNation:{}", findOnepassUser.getNation()); // 내외국인 구분(내국인:L, 외국인:F)

			    	// 기관 아이디 조회
			    	// int usedCnt = egovOnepassService.onePassCheckIdDplct(findOnepassUser.getId());
			    	
			    	KcureLoginVO param = new KcureLoginVO();
					param.setPin(findOnepassUser.getCi());
					
					Map<?,?> resultDBInfo = (EgovMap)loginService.getLoginIncorrect(param);
					
					ObjectMapper objectMapper = new ObjectMapper();
				    KcureLoginVO resultVO = objectMapper.convertValue(resultDBInfo, KcureLoginVO.class);

					// 기관 아이디 조회 성공
				    if (resultVO != null && resultVO.getUserId() != null && !resultVO.getUserId().equals("")) {
				    	 //세션 및 해당내역 공통 처리.
					    return loginAction(resultVO,model);
						
					}else {									
						//회원가입 호출
						model.addAttribute("userEntMedmCd", OAuthConfig.ONEPASS_SERVICE_CODE);
						model.addAttribute("userId", findOnepassUser.getEmail());
				    	return "kcure/portal/uat/uia/snsLoginResult";				    	
						//model.addAttribute("resultMessage", egovMessageSource.getMessage("digital.onepass.connect.join.failure"));
						//model.addAttribute("redirectUrl",request.getContextPath()+ Globals.MAIN_PAGE);
						//return "egovframework/com/uat/uia/onepass/onepassResult";
						//return onepassReturnPage;
					}

			    }

			    // 사용자 정보 조회 실패
			    else {
			    	model.addAttribute("resultMessage", egovMessageSource.getMessage("digital.onepass.connect.user.infomation.failure"));
			    	model.addAttribute("redirectUrl", request.getContextPath()+Globals.MAIN_PAGE);
			    	//return "egovframework/com/uat/uia/onepass/onepassResult";
			    	return onepassReturnPage;
			    }

			}

			// type 이 LOGIN 이 아님
			else {
		    	model.addAttribute("resultMessage", egovMessageSource.getMessage("digital.onepass.connect.athentication.failure"));
		    	model.addAttribute("redirectUrl", request.getContextPath()+Globals.MAIN_PAGE);
		    	//model.addAttribute("redirectUrl", request.getContextPath()+"/index.do");
		    	//return "egovframework/com/uat/uia/onepass/onepassResult";
		    	return onepassReturnPage;
		    }

		}

		// 인증 실패
		else {
			model.addAttribute("resultMessage", egovMessageSource.getMessage("digital.onepass.connect.athentication.failure"));
			model.addAttribute("redirectUrl", request.getContextPath()+"/index.do");
			//return "egovframework/com/uat/uia/onepass/onepassResult";
			return onepassReturnPage;
		}
		

	}
	
	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/kcureLogOut.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {
		/*String userIp = EgovClntInfo.getClntIP(request);
		// 1. Security 연동
		return "redirect:/j_spring_security_logout";*/
		//로그아웃 로그 남기기.
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if(loginVO != null) {
			loginVO.setConectMthd("O");
		}
		request.getSession().setAttribute("loginVO", null);
		// 세션모드인경우 Authority 초기화
		// List<String> authList = (List<String>)EgovUserDetailsHelper.getAuthorities();
		request.getSession().setAttribute("accessUser", null);
		//return "redirect:/egovDevIndex.jsp";
		return "redirect:"+Globals.MAIN_PAGE;
	}
	
	
	
	
	/**
	  * @Method Name : accessDenied
	  * @date : 2023. 2. 15.
	  * @Method 설명 :
	  *  <p>	
	  *     accessDenied 에러 페이지 호출
	  *  </p>
	  *  /portal/uat/uia/accessDenied.do
	  * @param : 
	  * @return : accessDenied 에러 페이지 
	  */
	@RequestMapping(value = "/accessDenied.do")
	public String accessDenied(HttpServletRequest request, ModelMap model) throws Exception {
		return "kcure/portal/com/error/accessDenied";
	}
	
	
	
	@RequestMapping(value="/ajaxError.do")
	public ModelAndView refreshSessionTimeout(HttpServletRequest request, ModelMap model) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception", "err");
		String returnPage = request.getContextPath()+"/portal/uat/uia/kcureError.do";
		if(!EgovStringUtil.isEmpty(request.getParameter("err_return"))) {
			returnPage = request.getParameter("err_return");
		}
		modelAndView.addObject("returnPage", returnPage);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}
	
	
	@RequestMapping(value="/kcureError.do")
	public String egovError(HttpServletRequest request, ModelMap model) throws Exception {
		return "kcure/portal/com/error/egovError";
	}
	
	/**
	 * 사용자메뉴모드를 전환한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/kcureMnuModChg.do")
	public String actionMnuModChg(HttpServletRequest request, ModelMap model) throws Exception {
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(loginVO != null) {
			
			if (loginVO.getUsrMnuMode().equals("01")) {
				loginVO.setUsrMnuMode("02");	//사용자메뉴모드( 01 : 사용자영역 / 02 : 관리자영역 )
			} else {
				loginVO.setUsrMnuMode("01");	//사용자메뉴모드( 01 : 사용자영역 / 02 : 관리자영역 )	
			}	
		}
		
		//에러페이지 에서 문의하기 가기
		String menuMod = request.getParameter("menuMod");
		if(!EgovStringUtil.isEmpty(menuMod)) {
			loginVO.setUsrMnuMode(menuMod);
		}
		String defualtPage = Globals.MAIN_PAGE;
		String returnUrl = request.getParameter("returnUrl");
		if(!EgovStringUtil.isEmpty(returnUrl)) {
			defualtPage =returnUrl; 
		}
		
		
		return "redirect:"+defualtPage;
	}
}