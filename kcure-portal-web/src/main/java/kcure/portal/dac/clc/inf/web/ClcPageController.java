package kcure.portal.dac.clc.inf.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import egovframework.com.cmm.SessionVO;

@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/dac/clc")
public class ClcPageController {

    /**
      * @Method Name : viewClcInfSummary
      * @작성일 : 2023. 2. 20.
      * @작성자 : hjjeon
      * @Method 설명 : 임삼 개요 화면
      *  <p>
      *  </p>
      * @param :
      * @return : string
      */
    @RequestMapping(value="/pub/viewPubInfSummary.do")
    public String viewClPblSummary() throws Exception {
    	return "kcure/portal/dac/clc/inf/ViewPubInfSummary";
    }

    @RequestMapping(value="/com/viewCombInfSummary.do")
    public String viewClcInfSummary() throws Exception {
    	return "kcure/portal/dac/clc/inf/ViewCombInfSummary";
    }

}
