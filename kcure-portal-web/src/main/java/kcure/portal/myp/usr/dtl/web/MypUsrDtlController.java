package kcure.portal.myp.usr.dtl.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovFileScrty;


import kcure.portal.cmn.util.CheckPlusUtil;
import kcure.portal.myp.usr.dtl.service.MypUsrDtlService;
import kcure.portal.uat.uca.service.SignupService;
import kcure.portal.uat.uia.pwd.service.UatUiaPwdService;
import kcure.portal.uat.uia.service.KcureLoginService;
import kcure.portal.uat.uia.service.impl.KcureLoginVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.usr.dtl.web
 * @FileName : MypUsrDtlController.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	마이페이지 나의정보관리에 대한 controller 클래스를 정의한다.
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023.02.01   kyh           최초생성
 *  </pre>
 */
@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/myp/usr/dtl/")
public class MypUsrDtlController {

	/** EgovLoginService */
	@Resource(name = "KcureLoginService")
	private KcureLoginService loginService;
	
	@Resource(name = "mypUsrDtlService")
	private MypUsrDtlService mypUsrDtlService;

	@Resource(name = "SignupService")
	private SignupService signupService;
	
	@Resource(name = "uatUiaPwdService")
	private UatUiaPwdService uatUiaPwdService;
	
	/**
	 * @Method Name : viewMypUsrChk
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	회원확인 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypUsrChk.do")
    public String viewMypUsrChk(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	return "kcure/portal/myp/usr/ViewMypUsrChk";
    }
	
	/**
	 * @Method Name : selectMypUsrDtlChk
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	회원여부 확인
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectMypUsrDtlChk.do")
    public HashMap<String, Object> selectMypUsrDtlChk(@ModelAttribute("loginVO") KcureLoginVO loginVO) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();    	
    	loginVO.setUserId(sessionVo.getId());
    	
    	// 로그인인증확인    	
    	Map<?,?> mapLockUserInfo = (EgovMap)loginService.getLoginIncorrect(loginVO);
    	
    	HashMap<String, Object> resultMap = new HashMap<>();
    	
    	if(mapLockUserInfo != null) {
    		// 비밀번호 확인
    		String enpassword = EgovFileScrty.saltEncryptPassword(loginVO.getLoginPswd(), (String)mapLockUserInfo.get("pswdSltVl"));
    		
    		if (((String)mapLockUserInfo.get("loginPswd")).equals(enpassword)) {
    			resultMap.put("result", "success");
    		} else {
    			resultMap.put("result", "noData");
    		}
    	} else {
    		resultMap.put("result", "noData");
    	}
    	
    	return resultMap;
    }
	
	/**
	 * @Method Name : viewMypUsrDtl
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	회원정보조회 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypUsrDtl.do")
    public String viewMypUsrDtl(@RequestParam HashMap<String, Object> commandMap, ModelMap model, HttpServletRequest request) throws Exception {
    	
    	String prevPage = (request.getHeader("Referer") != null) ? (String)request.getHeader("Referer") : "";
    	if (!prevPage.contains("/portal/myp/usr/dtl/viewMypUsrChk.do") && !prevPage.contains("/portal/myp/usr/wth/viewMypUsrWth.do")) {
    		return "redirect:/portal/myp/usr/dtl/viewMypUsrChk.do";
    	}
    	
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	KcureLoginVO loginVO = new KcureLoginVO();
    	loginVO.setUserId(sessionVo.getId());
    	
    	// 로그인인증확인    	
    	Map<?,?> usrInfo = (EgovMap)loginService.getLoginIncorrect(loginVO);
    	
    	model.addAttribute("prtiList", signupService.selectCmbPrtiList()); //참여기관 콤보용 정보
    	model.addAttribute("usrInfo", usrInfo); //기본 사용자정보
    	
    	//휴대폰 인증관련 셋팅
    	HashMap encodeMap = CheckPlusUtil.encode();
		request.getSession().setAttribute("REQ_SEQ", (String)encodeMap.get("sRequestNumber"));
		request.getSession().setAttribute("USE_GBN", "updateUsrInfo");	//회원정보수정 로직 분기 처리를 위한 변수
		model.addAttribute("data", encodeMap);
    	
    	return "kcure/portal/myp/usr/ViewMypUsrDtl";
    }
	
	/**
	 * @Method Name : updateMypUsrDtlInfo
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	회원정보 수정
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="updateMypUsrDtlInfo.do")
    public HashMap<String, Object> updateMypUsrDtlInfo(@RequestParam HashMap<String, Object> commandMap) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();    	
    	commandMap.put("userId", sessionVo.getId());
    	commandMap.put("frstRegpId", sessionVo.getId());    	
    	
    	mypUsrDtlService.updateMypUsrDtlInfo(commandMap);
    	
    	HashMap<String, Object> resultMap = new HashMap<>();
    	resultMap.put("result", "success");
    	
    	return resultMap;
    }
	
	/**
	 * @Method Name : viewMypUsrPwdChg
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	비밀번호수정 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypUsrPwdChg.do")
    public String viewMypUsrPwdChg(@RequestParam HashMap<String, Object> commandMap, ModelMap model, HttpServletRequest request) throws Exception {
    	
    	String prevPage = (request.getHeader("Referer") != null) ? (String)request.getHeader("Referer") : "";
    	if (!prevPage.contains("/portal/myp/usr/dtl/viewMypUsrDtl.do")) {
    		return "redirect:/portal/myp/usr/dtl/viewMypUsrChk.do";
    	}
    	
    	return "kcure/portal/myp/usr/ViewMypUsrPwdChg";
    }
	
	/**
	 * @Method Name : updateMypUsrPwdChg
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	비밀번호 수정
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="updateMypUsrPwdChg.do")
    public HashMap<String, Object> updateMypUsrPwdChg(@RequestParam HashMap<String, Object> commandMap) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();    	
    	commandMap.put("userId", sessionVo.getId());
    	
    	String pswdSltVl = EgovFileScrty.getSalt();
		String enpassword = EgovFileScrty.saltEncryptPassword((String)commandMap.get("userPswd"), pswdSltVl);
		
		commandMap.put("pswdSltVl", pswdSltVl);
		commandMap.put("enpassword", enpassword);
		
		uatUiaPwdService.updateUsrPswdRset(commandMap);
    	
    	HashMap<String, Object> resultMap = new HashMap<>();
    	resultMap.put("result", "success");
    	
    	return resultMap;
    }
}
