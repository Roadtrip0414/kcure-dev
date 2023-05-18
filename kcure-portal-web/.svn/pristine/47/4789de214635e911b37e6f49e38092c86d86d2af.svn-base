package kcure.portal.sys.etc.srv.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.etc.srv.service.EtcSrvService;
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
  * @package_name : kcure.portal.cmm.sys.etc.web
  * @FileName : EtcSrvController.java
  * @since : 2023. 3. 29.
  * @version 1.0
  * @author : kyj
  * @프로그램 설명 : 설문조사 관리
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
@RequestMapping("/portal/sys/etc/srv")
public class EtcSrvController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "EtcSrvService")
    private EtcSrvService etcSrvService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : ViewSrvyIvstg
      * @작성일 : 2023. 3. 29.
      * @작성자 : kyj
      * @Method 설명 : 설문조사 관리 뷰 페이지
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewSrvyIvstg.do")
    public String ViewSrvyIvstg() throws Exception {
        return "kcure/portal/sys/etc/ViewSrvyIvstg";
    }

    /**
      * @Method Name : selectSrvyIvstg
      * @작성일 : 2023. 3. 29.
      * @작성자 : kyj
      * @Method 설명 : 설문조사 리스트 조회
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectSrvyIvstg.do")
    public ModelAndView selectSrvyIvstg(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {

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

      model.addAttribute(GridVar.gridView, etcSrvService.selectSrvyList(comDefaultVO));

        int totCnt = etcSrvService.selectSrvyListTotCnt(comDefaultVO);
		  paginationInfo.setTotalRecordCount(totCnt);
      model.addAttribute(GridVar.gridPage, paginationInfo);
      model.addAttribute("searchVO", comDefaultVO);
      model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
      ModelAndView modelAndView = new ModelAndView("jsonView", model);
      return modelAndView;
    }

    /**
      * @Method Name : saveSrvyIvstg
      * @작성일 : 2023. 3. 29.
      * @작성자 : kyj
      * @Method 설명 : 설문조사 리스트 저장
      *  <p>
      *  </p>
      * @param : gridParameterMap
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveSrvyIvstg.do")
    public ModelAndView saveSrvyIvstg(GridParameterMap gridParameterMap, ModelMap model) throws Exception {

    	etcSrvService.saveSrvy(gridParameterMap);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }

  }