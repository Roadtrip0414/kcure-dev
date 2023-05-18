/**
 *
 */
package kcure.portal.pfm.kif.inf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/portal/pfm/kif/inf")
public class PfmKifInfController {

	@RequestMapping(value ="viewPfmKifInf.do")
	public String viewPfmKifInf() {
		return "kcure/portal/pfm/kif/inf/ViewPfmKifInf";
	}

}
