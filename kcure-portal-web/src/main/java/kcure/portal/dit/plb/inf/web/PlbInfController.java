package kcure.portal.dit.plb.inf.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.dit.plb.inf.web
  * @FileName : PlbInfController.java
  * @since : 2023. 3. 22.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : 공공라이브러리 개요 Controller
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Controller
@RequestMapping("/portal/dit/plb/inf")
public class PlbInfController {
	/**
	  * @Method Name : viewPlbInfo
	  * @작성일 : 2023. 3. 22.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공공 라이브러리 개요 화면 조회
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value ="/viewPlbInfo.do")
	public String viewPlbInfo() throws Exception {
		return "kcure/portal/dit/plb/ViewPlbInfo";
	}
}
