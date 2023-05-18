package kcure.portal.sys.rsr.dac.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.rsr.dac.service.RsrDacService;
import kcure.portal.sys.rsr.dac.service.impl.RsrDacSearchVO;
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
  * @package_name        : kcure.portal.sys.rsr.dac.web
  * @FileName : RsrDacController.java
  * @since : 2023. 3. 15
  * @version 1.0
  * @author : parkgu
  * @프로그램 설명 : 데이터 종료 관리
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
@RequestMapping("/portal/sys/rsr/dac")
public class RsrDacController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "rsrDacService")
    private RsrDacService rsrDacService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
     * @Method Name : viewDataAplcEnd
     * @작성일 : 2023. 3. 15
     * @작성자 : parkgu
     * @Method 설명 : 데이터 종료 관리 화면 조회
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/viewDataAplcEnd.do")
    public String viewDataAplcEnd(ModelMap model) throws Exception {
        return "kcure/portal/sys/rsr/dac/ViewDataAplcEnd";
    }

    /**
     * @Method Name : selectDataAplcEnd
     * @작성일 : 2023. 3. 15
     * @작성자 : parkgu
     * @Method 설명 : 데이터 종료 관리 목록 조회
     *  <p>
     *  </p>
     * @param : searchVO RsrDacSearchVO
     * @return : ModelAndView
     */
    @RequestMapping(value="/selectDataAplcEndList.do")
    public ModelAndView selectDataAplcEndList(@ModelAttribute("searchVO") RsrDacSearchVO searchVO, ModelMap model) throws Exception {
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

        model.addAttribute(GridVar.gridView, rsrDacService.selectDataAplcEndList(searchVO));

        int totCnt = rsrDacService.selectDataAplcEndListTotCnt(searchVO);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }
}
