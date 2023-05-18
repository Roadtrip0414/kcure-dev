/**
 * 
 */
package kcure.portal.dvz.clb.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
  * @FileName : DvzClbIntroduceController.java
  * @Project : kcure-portal-web
  * @since : 2022. 12. 20. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 데이터 시각화 > 임상라이브러리 > 개요	
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
@RequestMapping("/portal/dvz")
public class DvzClbIntroduceController {
	
	@RequestMapping(value ="/clb/viewScmIntroduce.do")
	public String viewLibIntroduce() { 
		return "kcure/portal/dvz/clb/ViewDvzClbIntroduce";
	}

}
