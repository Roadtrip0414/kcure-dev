package kcure.portal.uss.umt.web;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.uss.umt.service.UmtService;
import kcure.portal.uss.umt.service.impl.UmtVO;

@Controller
@RequestMapping("/portal/uss")
public class UmtController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "umtService")
    private UmtService umtService;

    /**
      * @Method Name : userPopup
      * @작성일 : 2023. 1. 6.
      * @작성자 : hjjeon
      * @Method 설명 : 사용자 팝업 화면
      *  <p>
      *  </p>
      * @param :
      * @return :
      */
    @RequestMapping(value="/umt/userPopup.do")
    public String userPopup() throws Exception {
        return "kcure/portal/uss/umt/UserPopup";
    }

    @RequestMapping(value="/umt/selectUserList.do")
    public ModelAndView selectUserList(@ModelAttribute("umtVO") UmtVO umtVO, ModelMap model) throws Exception {

    	/** EgovPropertyService.sample */
    	umtVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	umtVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(umtVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(umtVO.getPageUnit());
		paginationInfo.setPageSize(umtVO.getPageSize());

		umtVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		umtVO.setLastIndex(paginationInfo.getLastRecordIndex());
		umtVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		umtVO.setUserList(umtService.viewUser(umtVO));
        model.addAttribute(GridVar.gridView, umtVO.getUserList());

        int totCnt = umtService.viewUserTotCnt(umtVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("umtVO", umtVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }
}
