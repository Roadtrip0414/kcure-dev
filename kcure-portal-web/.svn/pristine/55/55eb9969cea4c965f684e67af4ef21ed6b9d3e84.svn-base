package kcure.portal.sys.mnu.mng.web;

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
import kcure.portal.sys.mnu.mng.service.MnuMngService;
import kcure.portal.sys.mnu.mng.service.impl.MnuVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.mnu.mng.web
  * @FileName : MnuController.java
  * @since : 2023. 2. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	메뉴관리 Controller
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
@RequestMapping("/portal/sys/mnu/mng")
public class MnuMngController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "mnuMngService")
    private MnuMngService mnuMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : viewMenuManage
      * @작성일 : 2023. 1. 17.
      * @작성자 : hjjeon
      * @Method 설명 : 메뉴관리 화면 조회
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewMenuManage.do")
    public String viewMenuManage() throws Exception {
        return "kcure/portal/sys/mnu/ViewMenuManage";
    }

    /**
      * @Method Name : selectMenuList
      * @작성일 : 2023. 1. 17.
      * @작성자 : hjjeon
      * @Method 설명 : 메뉴관리 목록 조회
      *  <p>
      *  </p>
      * @param : mnuVO MnuVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectMenuList.do")
    public ModelAndView selectMenuList(@ModelAttribute("searchVO") MnuVO mnuVO, ModelMap model) throws Exception {

    	/** EgovPropertyService.sample */
    	mnuVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	mnuVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(mnuVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(mnuVO.getPageUnit());
		paginationInfo.setPageSize(mnuVO.getPageSize());

		mnuVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		mnuVO.setLastIndex(paginationInfo.getLastRecordIndex());
		mnuVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute(GridVar.gridView, mnuMngService.getMenuManageList(mnuVO));

        int totCnt = mnuMngService.getMenuManageListTotCnt(mnuVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("mnuVO", mnuVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
      * @Method Name : saveMenuManage
      * @작성일 : 2023. 2. 14.
      * @작성자 : hjjeon
      * @Method 설명 : 메뉴관리 저장
      *  <p>
      *  </p>
      * @param : gridParameterMap GridParameterMap
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveMenuManage.do")
    public ModelAndView saveMenuManage(GridParameterMap gridParameterMap, ModelMap model) throws Exception {

    	mnuMngService.saveMenuManage(gridParameterMap);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }
}
