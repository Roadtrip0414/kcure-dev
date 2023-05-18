/**
 *
 */
package kcure.portal.pfm.kif.org;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/portal/pfm/kif/org")
public class PfmKifOrgController {

	@RequestMapping(value ="viewPfmKifOrg.do")
	public String viewPfmKifOrg() {
		return "kcure/portal/pfm/kif/org/ViewPfmKifOrg";
	}

}
