package kcure.portal.dit.lit.inf.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.com.cmm.SessionVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.dit.lit.inf.web
 * @FileName : DitLitInfController.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	K-CURE 라이브러리 소개에 대한 controller 클래스를 정의한다.
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
@RequestMapping("/portal/dit/lit/inf/")
public class DitLitInfController {
	
    /**
	 * @Method Name : viewDitLitInf
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	K-CURE 라이브러리 소개 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewDitLitInf.do")
    public String viewDitLitInf(ModelMap model) throws Exception {    	
        return "kcure/portal/dit/lit/viewDitLitInf";
    }
}
