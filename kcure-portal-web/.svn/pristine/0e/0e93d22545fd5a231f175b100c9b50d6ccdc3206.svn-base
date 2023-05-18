package kcure.portal.sys.aum.usr.web;

import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.aum.mng.service.AumMngService;
import kcure.portal.sys.aum.usr.service.AumUsrService;
import kcure.portal.sys.cmm.ComDefaultVO;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.aum.usr.web
  * @FileName : AumUsrController.java
  * @since : 2023. 1. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : 권한 유저 Controller
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
@RequestMapping("/portal/sys/aum/usr")
public class AumUsrController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "aumMngService")
    private AumMngService aumMngService;

    @Resource(name = "aumUsrService")
    private AumUsrService aumUsrService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : viewAuthorUserManage
      * @작성일 : 2023. 1. 25.
      * @작성자 : hjjeon
      * @Method 설명 : 권한, 유저 맵핑 관리
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewAuthorUserManage.do")
    public String viewAuthorUserManage(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {
    	model.addAttribute("curPageIndex", comDefaultVO.getCurPageIndex());
    	model.addAttribute("allAuthList", aumMngService.selectAuthAllList());
    	
        return "kcure/portal/sys/aum/ViewAuthorUserManage";
    }

    /**
      * @Method Name : selectAuthorUserManage
      * @작성일 : 2023. 1. 25.
      * @작성자 : hjjeon
      * @Method 설명 : 권한 유저 맵핑 목록 조회
      *  <p>
      *  </p>
      * @param : aumVO AumVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectAuthorUserManage.do")
    public ModelAndView selectAuthorUserManage(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {
    	comDefaultVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	comDefaultVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo((comDefaultVO.getCurPageIndex() == 0)?comDefaultVO.getPageIndex():comDefaultVO.getCurPageIndex());
		paginationInfo.setRecordCountPerPage(comDefaultVO.getPageUnit());
		paginationInfo.setPageSize(comDefaultVO.getPageSize());

		comDefaultVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		comDefaultVO.setLastIndex(paginationInfo.getLastRecordIndex());
		comDefaultVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute(GridVar.gridView, aumUsrService.selectAuthorUserList(comDefaultVO));
        model.addAttribute("allAuthList", aumMngService.selectAuthAllList());

        int totCnt = aumUsrService.selectAuthorUserListTotCnt(comDefaultVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);

        model.addAttribute("searchVO", comDefaultVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
      * @Method Name : saveAuthorUser
      * @작성일 : 2023. 2. 14.
      * @작성자 : hjjeon
      * @Method 설명 : 권한 유저 저장
      *  <p>
      *  </p>
      * @param : gridParameterMap GridParameterMap
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveAuthorUser.do")
    public ModelAndView saveAuthorUser(@RequestParam Map<String,Object> map, ModelMap model) throws Exception {
    	aumUsrService.saveAuthorUser(map);

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
      * @Method Name : detailViewAuthorUserManage
      * @작성일 : 2023. 4. 3.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	사용자별 권한 관리 상세 화면 조회
      *  </p>
      * @param : Map<String,Object> map
      * @return : String
      */
    @RequestMapping(value="/detailViewAuthorUserManage.do")
    public String detailViewAuthorUserManage(@RequestParam Map<String,Object> map, ModelMap model) throws Exception {
    	model.addAttribute("searchVO", map);
    	model.addAttribute("detailVO", aumUsrService.selectAuthorUser(map));
    	model.addAttribute("allAuthList", aumMngService.selectAuthAllList());
        return "kcure/portal/sys/aum/DetailViewAuthorUserManage";
    }
}
