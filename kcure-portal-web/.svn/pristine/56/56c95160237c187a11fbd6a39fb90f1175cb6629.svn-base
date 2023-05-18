package kcure.portal.bbs.prt.faq.web;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import kcure.portal.bbs.faq.service.FaqService;
import kcure.portal.bbs.ntc.service.impl.NtcVO;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.usr.stt.service.UsrSttService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.prt.faq.web
  * @FileName : PrtFaqController.java
  * @since : 2023. 3. 23.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	기관 FAQ Controller
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
@RequestMapping("/portal/bbs/prt/faq")
public class PrtFaqController {
	//게시판Id
	public static String BBS_ID = "BBSMSTR_000000000005";

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "FaqService")
    private FaqService faqService;

    @Resource(name = "usrSttService")
    private UsrSttService usrSttService;

    /**
      * @Method Name : viewPrtFaq
      * @작성일 : 2023. 3. 13.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	Faq 목록 조회
      *  </p>
      * @param : ntcVO NtcVO
      * @return : String
      */
    @RequestMapping(value="/viewPrtFaq.do")
    public String viewFaq(@ModelAttribute("searchVO") NtcVO ntcVO, ModelMap model) throws Exception {
    	ntcVO.setBbsId(BBS_ID);
    	ntcVO.setPageUnit(propertyService.getInt("pageUnit"));
    	ntcVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(ntcVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(ntcVO.getPageUnit());
		paginationInfo.setPageSize(ntcVO.getPageSize());

		ntcVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ntcVO.setLastIndex(paginationInfo.getLastRecordIndex());
		ntcVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		int totCnt =  faqService.selectFaqListTotCnt(ntcVO);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", faqService.selectFaqList(ntcVO));
		model.addAttribute("resultCnt", totCnt);
		model.addAttribute("searchVO", ntcVO);
		model.addAttribute(GridVar.gridPage, paginationInfo);
		model.addAttribute("nttSeCdList", usrSttService.selectCdCbo("NTT_SE_CODE"));

        return "kcure/portal/bbs/prt/faq/ViewPrtFaq";
    }
}
