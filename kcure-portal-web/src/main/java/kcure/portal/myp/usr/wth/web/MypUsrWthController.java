package kcure.portal.myp.usr.wth.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.com.cmm.SessionVO;
import kcure.portal.myp.usr.wth.service.MypUsrWthService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.usr.wth.web
 * @FileName : MypUsrWthController.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	마이페이지 회원탈퇴에 대한 controller 클래스를 정의한다.
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
@RequestMapping("/portal/myp/usr/wth/")
public class MypUsrWthController {
	
	@Resource(name = "mypUsrWthService")
	private MypUsrWthService mypUsrWthService;
	
	/**
	 * @Method Name : viewMypUsrWth
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	회원탈퇴 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypUsrWth.do")
    public String viewMypUsrWth(@RequestParam HashMap<String, Object> commandMap, ModelMap model, HttpServletRequest request) throws Exception {
    	
    	String prevPage = (request.getHeader("Referer") != null) ? (String)request.getHeader("Referer") : "";
    	if (!prevPage.contains("/portal/myp/usr/dtl/viewMypUsrDtl.do")) {
    		return "redirect:/portal/myp/usr/dtl/viewMypUsrChk.do";
    	}
    	
    	return "kcure/portal/myp/usr/ViewMypUsrWth";
    }
	
	/**
	 * @Method Name : saveMypUsrWthChg
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	회원탈퇴 처리
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="saveMypUsrWthChg.do")
    public HashMap<String, Object> saveMypUsrWthChg(@RequestParam HashMap<String, Object> commandMap) throws Exception {
    	
    	mypUsrWthService.saveMypUsrWthChg(commandMap);
    	
    	HashMap<String, Object> resultMap = new HashMap<>();
    	resultMap.put("result", "success");
    	
    	return resultMap;
    }
}
