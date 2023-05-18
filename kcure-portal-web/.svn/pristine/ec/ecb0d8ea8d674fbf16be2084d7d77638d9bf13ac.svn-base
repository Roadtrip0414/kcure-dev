package kcure.portal.sys.pim.mng.web;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.pim.mng.service.PimMngService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.pim.mng.web
  * @FileName : PimController.java
  * @since : 2023. 2. 6.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	참여기관 관리 Controller
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
@RequestMapping("/portal/sys/pim/mng")
public class PimMngController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "pimMngService")
    private  PimMngService pimMngService;

    /**
      * @Method Name : viewPrtiManage
      * @작성일 : 2023. 2. 6.
      * @작성자 : hjjeon
      * @Method 설명 : 참여기관관리 화면 조회
      *  <p>
      *  </p>
      * @param :
      * @return : string
      */
    @RequestMapping(value="/viewPrtiManage.do")
    public String viewPrtiManage() throws Exception {
        return "kcure/portal/sys/pim/ViewPrtiManage";
    }

    /**
      * @Method Name : selectPrtiList
      * @작성일 : 2023. 2. 6.
      * @작성자 : hjjeon
      * @Method 설명 : 참여기관 관리 목록 조회
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : modelAndView ModelAndView
      */
    @RequestMapping(value="/selectPrtiList.do")
    public ModelAndView selectPrtiList(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {

    	/** EgovPropertyService.sample */
    	comDefaultVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	comDefaultVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(comDefaultVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(comDefaultVO.getPageUnit());
		paginationInfo.setPageSize(comDefaultVO.getPageSize());

		comDefaultVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		comDefaultVO.setLastIndex(paginationInfo.getLastRecordIndex());
		comDefaultVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute(GridVar.gridView, pimMngService.selectPrtiList(comDefaultVO));

        int totCnt = pimMngService.selectPrtiListTotCnt(comDefaultVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", comDefaultVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
      * @Method Name : savePrti
      * @작성일 : 2023. 2. 6.
      * @작성자 : hjjeon
      * @Method 설명 : 참여기관 관리 저장
      *  <p>
      *  </p>
      * @param : gridParameterMap GridParameterMap
      * @return : modelAndView ModelAndView
      */
    @RequestMapping(value="/savePrti.do")
    public ModelAndView savePrti(GridParameterMap gridParameterMap, ModelMap model) throws Exception {

    	String rtn = pimMngService.savePrti(gridParameterMap);
    	model.addAttribute("message", rtn);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }
}
