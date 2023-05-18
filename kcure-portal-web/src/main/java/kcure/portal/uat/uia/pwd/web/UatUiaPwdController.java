package kcure.portal.uat.uia.pwd.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.utl.sim.service.EgovFileScrty;
import kcure.portal.cmn.util.SendMailUtil;
import kcure.portal.uat.uia.pwd.service.UatUiaPwdService;
import kcure.portal.uat.uia.service.KcureLoginService;
import kcure.portal.uat.uia.service.impl.KcureLoginVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.uat.uia.pwd.web
 * @FileName : UatUiaPwdController.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	비밀번호 찾기에 대한 controller 클래스를 정의한다.
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
@RequestMapping("/portal/uat/uia/pwd/")
public class UatUiaPwdController {

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name = "KcureLoginService")
	private KcureLoginService loginService;
	
	@Resource(name = "uatUiaPwdService")
	private UatUiaPwdService uatUiaPwdService;
	
    /**
	 * @Method Name : viewPwdFind
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	비밀번호 찾기 초기 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewPwdFind.do")
    public String viewPwdFind(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
    	if (flashMap!=null) model.addAttribute("actMessage", (String)flashMap.get("actMessage"));
		
        return "kcure/portal/uat/uia/viewPwdFind";
    }
	
    /**
	 * @Method Name : viewPwdFindChk
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	등록된 email인지 확인한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewPwdFindChk.do")
    public String viewPwdFindChk(@ModelAttribute("loginVO") KcureLoginVO loginVO, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {
		// 사용자 정보 확인
	    Map<?,?> chkUserInfo = (EgovMap)loginService.getLoginIncorrect(loginVO);
	    
	    if (chkUserInfo != null) {
	    	String pswdRsetTknId = "";
	    	
	    	do {
	    		pswdRsetTknId = RandomStringUtils.randomAlphabetic(15);
	    		
	    		HashMap<String, Object> paramMap = new HashMap<>();
		    	paramMap.put("pswdRsetTknId", pswdRsetTknId);
		    	paramMap.put("userId", (String)chkUserInfo.get("userId"));
		    	
		    	//pswdRsetTknId 중복 확인
		    	Map<String, Object> pswdRsetTknIdDupl = uatUiaPwdService.selectPswdRsetTknIdDupl(paramMap);
		    	
		    	if (pswdRsetTknIdDupl == null) {
		    		uatUiaPwdService.insertPswdRset(paramMap);
		    	} else {
		    		pswdRsetTknId = "";
		    	}
	    	} while (pswdRsetTknId.equals(""));
	    	
	    	redirectAttributes.addFlashAttribute("pswdRsetTknId", pswdRsetTknId);
	    	redirectAttributes.addFlashAttribute("rcvEmailAddr", (String)chkUserInfo.get("userId"));
	    	return "redirect:/portal/uat/uia/pwd/viewPwdFindEnd.do";	    	
	    } else {
	    	redirectAttributes.addFlashAttribute("actMessage", egovMessageSource.getMessage("fail.common.emailSearch",request.getLocale()));
	    	return "redirect:/portal/uat/uia/pwd/viewPwdFind.do";
	    }
    }
	
    /**
	 * @Method Name : viewPwdFindEnd
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	비밀번호 설정 안내 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewPwdFindEnd.do")
    public String viewPwdFindEnd(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

    	Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
    	
    	if (flashMap!=null) {
    		model.addAttribute("pswdRsetTknId", (String)flashMap.get("pswdRsetTknId"));
    		
    		//메일 발송
        	File emailTmpltFile = new File(EgovProperties.getProperty("email.send.template.filePath").trim() + "pswdResetGuide.html");
        	
        	String emailTitle = "K-cure 비밀번호 재설정 안내";	//메일제목
        	
        	String emailContents = SendMailUtil.getEmailContents(emailTmpltFile);	//메일내용
        	emailContents = emailContents.replaceAll("\\{serverUrl\\}", EgovProperties.getProperty("email.send.template.url").trim());
        	emailContents = emailContents.replaceAll("\\{pswdRsetTknId\\}", (String)flashMap.get("pswdRsetTknId"));
        	
        	List<String> rcvEmailAddrArr = new ArrayList<String>();	//메일수신자 목록
        	rcvEmailAddrArr.add((String)flashMap.get("rcvEmailAddr"));
        	
        	//List<File> emailAtchfiles = new ArrayList<File>();	//첨부파일 목록
        	List<File> emailAtchfiles = null;	//첨부파일 목록
        	        	
        	SendMailUtil.sendMail(emailTitle, emailContents, rcvEmailAddrArr, emailAtchfiles);
    	} else {
	    	model.addAttribute("actMessage",  egovMessageSource.getMessage("comUatUia.pwdChg.expired", request.getLocale()));
    	}
		
        return "kcure/portal/uat/uia/viewPwdFindEnd";
    }
	
    /**
	 * @Method Name : viewPwdChgSet
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	비밀번호 변경 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="token{pswdRsetTknId}.do")
    public String viewPwdChgSet(@PathVariable String pswdRsetTknId, ModelMap model, HttpServletRequest request) throws Exception {
    	
    	//현재 시간 구하기
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    	Date now = new Date();
    	String nowDate = sdf.format(now);
    	
    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("pswdRsetTknId", pswdRsetTknId);
    	
    	Map<String, Object> chkPwdInfo = uatUiaPwdService.selectPswdRset(paramMap);
    	
    	if (chkPwdInfo == null || ((String)chkPwdInfo.get("pswdRsetEddt")).compareTo(nowDate) < 0) {
    		model.addAttribute("actMessage", egovMessageSource.getMessage("comUatUia.pwdChg.expired", request.getLocale()));
    	}

    	model.addAttribute("pswdRsetTknId", pswdRsetTknId);
		
        return "kcure/portal/uat/uia/viewPwdChgSet";
    }
	
    /**
	 * @Method Name : updatePwdChg
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	비밀번호를 변경한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="updatePwdChg.do")
    public ModelAndView updatePwdChg(@RequestParam Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.setViewName("jsonView");
    	
    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("pswdRsetTknId", (String)commandMap.get("pswdRsetTknId"));
    	
    	Map<String, Object> chkPwdInfo = uatUiaPwdService.selectPswdRset(paramMap);
    	paramMap.put("userId", (String)chkPwdInfo.get("userId"));
    	
    	uatUiaPwdService.updatePswdRset(paramMap);    	

		String pswdSltVl = EgovFileScrty.getSalt();
		String enpassword = EgovFileScrty.saltEncryptPassword((String)commandMap.get("userPswd"), pswdSltVl);

    	paramMap.put("pswdSltVl", pswdSltVl);
    	paramMap.put("enpassword", enpassword);
    	uatUiaPwdService.updateUsrPswdRset(paramMap);
    	
    	modelAndView.addObject("rstMsg", egovMessageSource.getMessage("success.common.update", request.getLocale()));    	
    	return modelAndView;
    }
}
