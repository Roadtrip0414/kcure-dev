package kcure.portal.sys.dac.rvw.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.dac.rvw.service.DacRvwService;
import kcure.portal.sys.dac.rvw.service.impl.DacRvwSearchVO;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.ctg.cds.service.impl.CtgCdsVO;
import kcure.portal.sys.ctg.dts.service.impl.CtgDtsVO;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.dac.rvw.web
  * @FileName : DacRvwController.java
  * @since : 2023. 3. 10.
  * @version 1.0
  * @author : parkgu
  * @프로그램 설명 : 데이터신청관리
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
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/sys/dac/rvw")
public class DacRvwController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "dacRvwService")
    private DacRvwService dacRvwService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
     * @Method Name : viewDataAplcRvw
     * @작성일 : 2023. 3. 14.
     * @작성자 : parkgu
     * @Method 설명 : 데이터신청관리 화면 조회
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/viewDataAplcRvw.do")
    public String viewDataAplcRvw(ModelMap model) throws Exception {
        List<Map<String, Object>> rvwStpSpcdList = dacRvwService.selectRvwStpSpcdList();
        model.addAttribute("rvwStpSpcdList", rvwStpSpcdList);
        return "kcure/portal/sys/dac/rvw/ViewDataAplcRvw";
    }

    /**
     * @Method Name : selectDataAplcRvw
     * @작성일 : 2023. 3. 14.
     * @작성자 : parkgu
     * @Method 설명 : 데이터신청관리 목록 조회
     *  <p>
     *  </p>
     * @param : searchVO DacRvwSearchVO
     * @return : ModelAndView
     */
    @RequestMapping(value="/selectDataAplcRvwList.do")
    public ModelAndView selectDataAplcRvwList(@ModelAttribute("searchVO") DacRvwSearchVO searchVO, ModelMap model) throws Exception {
        /** EgovPropertyService.sample */
        searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
        searchVO.setPageSize(propertiesService.getInt("pageSize"));

        /** paging */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
        paginationInfo.setPageSize(searchVO.getPageSize());

        searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
        searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
        LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        searchVO.setPrtiId(sessionVo.getPrtiId());

        model.addAttribute(GridVar.gridView, dacRvwService.selectDataAplcRvwList(searchVO));

        int totCnt = dacRvwService.selectDataAplcRvwListTotCnt(searchVO);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }
    
    
    /**
      * @Method Name : movePage
      * @작성일 : 2023. 3. 17.
      * @작성자 : shpark
      * @Method 설명 :
      *  <p>
      *  	심의 페이지 이동 	
      *  </p>
      * @param :  dataAplcNo
      * @param :  rvwStpSpcd
      * @return : 이동할 페이지 
      */
    @RequestMapping(value="/movePage.do")
    public String movePage(@RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {
    	String rvwStpSpcd =  (String) commandMap.get("rvwStpSpcd");
    	String dataAplcNo =  (String) commandMap.get("dataAplcNo");
    	String targetStepUrl = CommonEnum.rvwStpSpcdInfo.valueOfStpSpcdInfo(rvwStpSpcd).stpUrl() ;
    	model.addAttribute("dataAplcNo", dataAplcNo);
    	model.addAttribute("rvwStpSpcd", rvwStpSpcd);
    	model.addAttribute("targetStepUrl", targetStepUrl);
        return "kcure/portal/sys/dac/rvw/ViewDacRvwStepResult";
    }
}
