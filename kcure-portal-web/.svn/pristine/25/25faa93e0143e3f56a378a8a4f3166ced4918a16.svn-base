package kcure.portal.sys.usr.wth.web;

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
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.usr.stt.service.impl.UsrVO;
import kcure.portal.sys.usr.stt.service.UsrSttService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.usr.web
  * @FileName : UsrController.java
  * @since : 2023. 1. 31.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	사용자관리 Controller
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
@RequestMapping("/portal/sys/usr/wth")
public class UsrWthController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "usrSttService")
    private UsrSttService usrSttService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;


    /**
      * @Method Name : viewUsrStatus
      * @작성일 : 2023. 1. 31.
      * @작성자 : hjjeon
      * @Method 설명 : 사용자 현황 화면 조회
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewUsrWthdStatus.do")
    public String viewUsrStatus() throws Exception {
        return "kcure/portal/sys/usr/ViewUsrWthdStatus";
    }

    /**
      * @Method Name : selectUsrWthList
      * @작성일 : 2023. 1. 31.
      * @작성자 : hjjeon
      * @Method 설명 : 사용자현황 목록 조회
      *  <p>
      *  </p>
      * @param : usrVO UsrVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectUsrWthList.do")
    public ModelAndView selectUsrWthList(@ModelAttribute("searchVO") UsrVO usrVO, ModelMap model) throws Exception {

    	/** EgovPropertyService.sample */
    	usrVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	usrVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(usrVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(usrVO.getPageUnit());
		paginationInfo.setPageSize(usrVO.getPageSize());

		usrVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		usrVO.setLastIndex(paginationInfo.getLastRecordIndex());
		usrVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute(GridVar.gridView, usrSttService.selectUserList(usrVO));

        int totCnt = usrSttService.selectUserListTotCnt(usrVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("usrVO", usrVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }
}
