package kcure.portal.sys.aum.mnu.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.aum.mnu.service.AumMnuService;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmm.sys.aum.web
  * @FileName : AuthorManageController.java
  * @since : 2023. 1. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : 권한 목록 설정
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
@RequestMapping("/portal/sys/aum/mnu")
public class AumMnuController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "aumMnuService")
    private AumMnuService aumMnuService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : viewAuthorMenuManage
      * @작성일 : 2023. 1. 4.
      * @작성자 : hjjeon
      * @Method 설명 : 권한, 메뉴 맵핑 관리 화면
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewAuthorMenuManage.do")
    public String viewAuthorMenuManage() throws Exception {
        return "kcure/portal/sys/aum/ViewAuthorMenuManage";
    }

    /**
      * @Method Name : selectAuthorMenuManage
      * @작성일 : 2023. 1. 4.
      * @작성자 : hjjeon
      * @Method 설명 : 권한, 메뉴 맵핑 조회
      *  <p>
      *  </p>
      * @param : RmtVO rmtVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectAuthorMenuManage.do")
    public ModelAndView selectAuthorMenuManage(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {

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

        model.addAttribute(GridVar.gridView, aumMnuService.selectAuthorMenuList(comDefaultVO));

        int totCnt = aumMnuService.selectAuthorMenuListTotCnt(comDefaultVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", comDefaultVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
      * @Method Name : saveAuthorMenu
      * @작성일 : 2023. 1. 5.
      * @작성자 : hjjeon
      * @Method 설명 : 권한 메뉴 맵핑 저장
      *  <p>
      *  </p>
      * @param : gridParameterMap GridParameterMap
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveAuthorMenu.do")
    public ModelAndView saveAuthorMenu(GridParameterMap gridParameterMap, ModelMap model) throws Exception {

    	aumMnuService.saveAuthorMenu(gridParameterMap);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }
}
