package kcure.portal.sys.usr.stt.web;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.aum.mng.service.AumMngService;
import kcure.portal.sys.pim.mng.service.PimMngService;
import kcure.portal.sys.usr.stt.service.UsrSttService;
import kcure.portal.sys.usr.stt.service.impl.UsrVO;

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
@RequestMapping("/portal/sys/usr/stt")
public class UsrSttController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "usrSttService")
    private UsrSttService usrSttService;

    @Resource(name = "aumMngService")
    private AumMngService aumMngService;

    @Resource(name = "pimMngService")
    private PimMngService pimMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : getGridCombo
      * @작성일 : 2023. 2. 14.
      * @작성자 : hjjeon
      * @Method 설명 : 그리드 내부 공통 콤보 조회
      *  <p>
      *  </p>
      * @param : 그룹코드명 String
      * @return : List
      */
    @ResponseBody
    @RequestMapping(value="/getGridCombo.do")
    public List<?> getGridCombo(@RequestParam("gbCd") String gbCd, ModelMap model) throws Exception {
    	List<?> comboList = usrSttService.selectCdCbo(gbCd);
    	return comboList;
    }

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
    @RequestMapping(value="/viewUsrStatus.do")
    public String viewUsrStatus(ModelMap model) throws Exception {
    	model.addAttribute("allAuthList", aumMngService.selectAuthAllList());		//권한조회(콤보용)
    	model.addAttribute("prtiList", pimMngService.selectPrtiAllList("01"));		//참여기관 콤보
        return "kcure/portal/sys/usr/ViewUsrStatus";
    }

    /**
      * @Method Name : selectUsrList
      * @작성일 : 2023. 1. 31.
      * @작성자 : hjjeon
      * @Method 설명 : 사용자현황 목록 조회
      *  <p>
      *  </p>
      * @param : usrVO UsrVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectUsrList.do")
    public ModelAndView selectUsrList(@ModelAttribute("searchVO") UsrVO usrVO, ModelMap model) throws Exception {

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

    /**
      * @Method Name : selectUsrHstList
      * @작성일 : 2023. 1. 31.
      * @작성자 : hjjeon
      * @Method 설명 : 사용자 이력 목록 조회
      *  <p>
      *  </p>
      * @param : usrVO UsrVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectUsrHstList.do")
    public ModelAndView selectUsrHstList(@ModelAttribute("searchVO") UsrVO usrVO, ModelMap model) throws Exception {
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

    	model.addAttribute(GridVar.gridView, usrSttService.selectUsrHstList(usrVO));
    	 int totCnt = usrSttService.selectUsrHstListTotCnt(usrVO);
    	paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);

    	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
      * @Method Name : selectUsrAuthList
      * @작성일 : 2023. 1. 31.
      * @작성자 : hjjeon
      * @Method 설명 : 사용자 권한 목록 조회
      *  <p>
      *  </p>
      * @param : usrVO UsrVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectUsrAuthList.do")
    public ModelAndView selectUsrAuthList(@ModelAttribute("searchVO") UsrVO usrVO, ModelMap model) throws Exception {
    	model.addAttribute(GridVar.gridView, usrSttService.selectUsrAuthList(usrVO));
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
      * @Method Name : updateUsr
      * @작성일 : 2023. 1. 31.
      * @작성자 : hjjeon
      * @Method 설명 : 사용자 정보 수정
      *  <p>
      *  </p>
      * @param : usrVO UsrVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/updateUsr.do")
    public ModelAndView updateUsr(@ModelAttribute("searchVO") UsrVO usrVO, ModelMap model) throws Exception {

    	usrSttService.updateUsr(usrVO);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }

    /**
      * @Method Name : StatChanRsnContPopup
      * @작성일 : 2023. 1. 31.
      * @작성자 : hjjeon
      * @Method 설명 : 사용자 상태 변경 처리 사유 팝업
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/statChanRsnContPopup.do")
    public String statChanRsnContPopup() throws Exception {
        return "kcure/portal/sys/usr/StatChanRsnContPopup";
    }
    
    
    
    	
    /**
      * @Method Name : selectUserChanRsn
      * @date : 2023. 3. 31.
      * @Method 설명 :
      *  <p>	
      *    사용자 처리 사유 select ( 반려 ) 
      *  </p>
      * @param : 
      * @return :
      */
    @RequestMapping(value="/selectUserChanRsn.do")
    public ModelAndView selectUserChanRsn(@ModelAttribute("searchVO") UsrVO usrVO, ModelMap model) throws Exception {

    	UsrVO statChanRsnVo = usrSttService.selectUserChanRsn(usrVO);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		modelAndView.addObject("statChanRsnVo", statChanRsnVo);
		
		return modelAndView;
    }
}
