package kcure.portal.sys.aum.mng.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.aum.mng.service.AumMngService;
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
@RequestMapping("/portal/sys/aum/mng")
public class AumMngController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "aumMngService")
    private AumMngService aumMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : viewAuthorManage
      * @작성일 : 2023. 1. 3.
      * @작성자 : hjjeon
      * @Method 설명 : 권한 목록화면
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewAuthorManage.do")
    public String viewAuthorManage() throws Exception {
        return "kcure/portal/sys/aum/ViewAuthorManage";
    }

    /**
      * @Method Name : selectAuthorManage
      * @작성일 : 2023. 1. 3.
      * @작성자 : hjjeon
      * @Method 설명 : 권한 목록을 조회한다
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectAuthorManage.do")
    public ModelAndView selectAuthorManage(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {

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

        model.addAttribute(GridVar.gridView, aumMngService.selectAuthorList(comDefaultVO));

        int totCnt = aumMngService.selectAuthorListTotCnt(comDefaultVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", comDefaultVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
      * @Method Name : saveAuthor
      * @작성일 : 2023. 1. 3.
      * @작성자 : hjjeon
      * @Method 설명 : 권한 세부정보를 저장한다.
      *  <p>
      *  </p>
      * @param : gridParameterMap
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveAuthor.do")
    public ModelAndView saveAuthor(GridParameterMap gridParameterMap, ModelMap model) throws Exception {

    	aumMngService.saveAuthor(gridParameterMap);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }

    /**
     * @Method Name : selectAllAuth
     * @작성일 : 2023. 1. 26.
     * @작성자 : hjjeon
     * @Method 설명 : 모든 권한 조회 (사용여부: Y)
     *  <p>
     *  </p>
     * @param : comDefaultVO ComDefaultVO
     * @return : modelandview
     */
   @RequestMapping(value="/selectAllAuth.do")
   public ModelAndView selectAllAuth(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {

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

        model.addAttribute(GridVar.gridView, aumMngService.selectAuthAllList());

		int totCnt = aumMngService.selectAuthAllListTotCnt();
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute(GridVar.gridPage, paginationInfo);
		model.addAttribute("searchVO", comDefaultVO);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
   }
}
