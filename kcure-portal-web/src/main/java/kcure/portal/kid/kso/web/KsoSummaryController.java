/**
 * 
 */
package kcure.portal.kid.kso.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author gGeon
 *
 */
@Controller
@RequestMapping("/portal/kid")
public class KsoSummaryController {
	
	@RequestMapping(value ="/kso/nonCheck/viewKsoSummary.do")
	public String viewLibIntroduce() { 
		return "kcure/portal/kid/kso/ViewKsoSummary";
	}

}
