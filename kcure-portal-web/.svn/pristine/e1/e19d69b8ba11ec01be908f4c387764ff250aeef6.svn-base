package kcure.portal.bbs.prt.ntc.web;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import kcure.portal.bbs.ntc.service.NtcService;
import kcure.portal.bbs.ntc.service.impl.NtcVO;
import kcure.portal.cmn.grid.GridVar;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.prt.ntc.web
  * @FileName : PrtNtcController.java
  * @since : 2023. 3. 23.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	(기관)공지사항 Controller
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
@RequestMapping("/portal/bbs/prt/ntc")
public class PrtNtcController {
	//게시판Id
	public static String BBS_ID = "BBSMSTR_000000000004";

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    /**
     * 공지사항 Service
     */
    @Resource(name = "NtcService")
    private NtcService ntcService;

    /**
      * @Method Name : viewPrtNtc
      * @작성일 : 2023. 3. 13.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	공지사항 화면 조회
      *  </p>
      * @param : viewPageNm 화면페이지명
      * 		 ntcVO NtcVO
      * @return : String
      */
    @RequestMapping(value="/{viewPageNm}.do")
    public String viewPrtNtc(@PathVariable String viewPageNm, @ModelAttribute("searchVO") NtcVO ntcVO, ModelMap model) throws Exception {
    	String viewNm = viewPageNm.substring(0, 1).toUpperCase() + viewPageNm.substring(1);
    	ntcVO.setBbsId(BBS_ID);
    	model.addAttribute("searchVO", ntcVO);

    	if(ntcVO.getNttId() > 0) {
    		model.addAttribute("ntcVO", ntcService.selectNtcDetail(ntcVO));
    	}
        return "kcure/portal/bbs/prt/ntc/"+viewNm;
    }

    /**
      * @Method Name : selectNtcList
      * @작성일 : 2023. 3. 13.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	공지사항 목록 조회
      *  </p>
      * @param : ntcVO parameter값
      * @return : ModelAndView
      */
    @RequestMapping("/selectNtcList.do")
    public ModelAndView selectNtcList(@ModelAttribute("searchVO") NtcVO ntcVO, ModelMap model) throws Exception {

    	ntcVO.setPageUnit(propertyService.getInt("pageUnit"));
    	ntcVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(ntcVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(ntcVO.getPageUnit());
		paginationInfo.setPageSize(ntcVO.getPageSize());

		ntcVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ntcVO.setLastIndex(paginationInfo.getLastRecordIndex());
		ntcVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute(GridVar.gridView, ntcService.selectNtcList(ntcVO));

		int totCnt = ntcService.selectNtcListTotCnt(ntcVO);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", ntcVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);

		return modelAndView;
    }
}
