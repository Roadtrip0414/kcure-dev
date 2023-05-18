package kcure.portal.sys.mnu.dvz.web;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.mnu.dvz.service.MnuDvzService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.mnu.dvz.web
  * @FileName : MnuDvzController.java
  * @since : 2023. 3. 27.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :
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
@RequestMapping("/portal/sys/mnu/dvz")
public class MnuDvzController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
     * 시각화 메뉴 관리 Service
     */
    @Resource(name = "mnuDvzService")
    private MnuDvzService mnuDvzService;

    /**
      * @Method Name : viewDvzMenuManage
      * @작성일 : 2023. 3. 27.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	시각화 메뉴 관리 화면 조회
      *  </p>
      * @param :
      * @return : String 메뉴URL
      */
    @RequestMapping(value="/viewDvzMenuManage.do")
    public String viewDvzMenuManage() throws Exception {
        return "kcure/portal/sys/mnu/ViewDvzMenuManage";
    }

    /**
      * @Method Name : selectMenuList
      * @작성일 : 2023. 3. 27.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	시각화 메뉴 관리 총갯수
      *  </p>
      * @param : ComDefaultVO comDefaultVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectMenuList.do")
    public ModelAndView selectMenuList(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {

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

        model.addAttribute(GridVar.gridView, mnuDvzService.selectMenuManageList(comDefaultVO));

        int totCnt = mnuDvzService.selectMenuManageListTotCnt(comDefaultVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("comDefaultVO", comDefaultVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
      * @Method Name : saveMenuManage
      * @작성일 : 2023. 3. 27.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	시각화 관리 메뉴 저장
      *  </p>
      * @param : GridParameterMap gridParameterMap
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveMenuManage.do")
    public ModelAndView saveMenuManage(GridParameterMap gridParameterMap, ModelMap model) throws Exception {

    	mnuDvzService.saveMenuManage(gridParameterMap);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }

    /**
      * @Method Name : dvzMenuXlsUploadPopup
      * @작성일 : 2023. 3. 27.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	엑셀 업로드 팝업 화면 조회
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/dvzMenuXlsUploadPopup.do")
    public String dvzMenuXlsUploadPopup() throws Exception {
        return "kcure/portal/sys/mnu/DvzMenuXlsUploadPopup";
    }
}
