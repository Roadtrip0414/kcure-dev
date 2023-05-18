package kcure.portal.bbs.dur.web;

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
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.bbs.dur.service.BbsDurService;
import kcure.portal.sys.bbs.dur.service.impl.DataUtlcVO;
import kcure.portal.sys.usr.stt.service.UsrSttService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.dur.web
  * @FileName : DurController.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	데이터 활용사례 Controller
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
@RequestMapping("/portal/bbs/dur")
public class DurController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "bbsDurService")
    private  BbsDurService durService;

    @Resource(name = "usrSttService")
    private UsrSttService usrSttService;

    @RequestMapping(value="/{viewPageNm}.do")
    public String viewDur(@PathVariable String viewPageNm, @ModelAttribute("searchVO") DataUtlcVO dataUtlcVO, ModelMap model) throws Exception {
    	String viewNm = viewPageNm.substring(0, 1).toUpperCase() + viewPageNm.substring(1);
    	model.addAttribute("rsrSpcdList", usrSttService.selectCdCbo("RSR_SPCD"));
    	model.addAttribute("searchVO", dataUtlcVO);

        return "kcure/portal/bbs/dur/"+viewNm;
    }

    /**
      * @Method Name : selectDurList
      * @작성일 : 2023. 3. 14.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	데이터 활용사례 목록 조회
      *  </p>
      * @param : durVO DurVO
      * @return : String
      */
    @RequestMapping(value="/selectDurList.do")
    public ModelAndView selectDurList(@ModelAttribute("searchVO") DataUtlcVO durVO, ModelMap model) throws Exception {
    	
    	durVO.setViewYn("Y");

    	durVO.setPageUnit(propertyService.getInt("pageUnit"));
    	durVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(durVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(durVO.getPageUnit());
		paginationInfo.setPageSize(durVO.getPageSize());

		durVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		durVO.setLastIndex(paginationInfo.getLastRecordIndex());
		durVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute(GridVar.gridView, durService.selectDataUtlcList(durVO));

		int totCnt = durService.selectDataUtlcListTotCnt(durVO);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", durVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);

		return modelAndView;
    }
}
