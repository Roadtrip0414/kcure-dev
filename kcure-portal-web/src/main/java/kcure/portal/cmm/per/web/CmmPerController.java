package kcure.portal.cmm.per.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmm.per.web
  * @FileName : CmmPerController.java
  * @since : 2023. 3. 28.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	개인정보 처리방침 Controller
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
@RequestMapping("/portal/cmm/per")
public class CmmPerController {
	/**
	  * @Method Name : viewPersonalInfo
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	개인정보처리방침 화면 조회
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value ="/viewPersonalInfo.do")
	public String viewPersonalInfo() throws Exception {
		return "kcure/portal/cmm/per/ViewPersonalInfo";
	}
}
