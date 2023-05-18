package kcure.portal.dit.phw.inf.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.com.cmm.SessionVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.dit.phw.inf.web
 * @FileName : SpeInfController.java
 * @since : 2023. 05. 12. 
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	보건복지 공공데이터 소개 Controller
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023.05.12   bhs           최초생성
 *  </pre>
 */
@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/dit/phw/inf/")
public class PhwInfController {
	
    /**
	 * @Method Name : viewPhwInf
	 * @작성일 : 2023. 05. 12.
	 * @작성자 : bhs
	 * @Method 설명 :  	보건복지 공공데이터 소개 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewPhwInf.do")
    public String viewPhwInf(ModelMap model) throws Exception {    	
        return "kcure/portal/dit/phw/viewPhwInf";
    }
}
