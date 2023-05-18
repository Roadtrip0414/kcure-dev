package kcure.portal.sys.cdm.mng.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.cdm.mng.service.CdmMngService;
import kcure.portal.sys.cdm.mng.service.Impl.CdmMngDetailVO;
import kcure.portal.sys.cdm.mng.service.Impl.CdmMngGrpVO;
import kcure.portal.sys.cmm.KcureMessageSource;
/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.cdm.mng.web
 * @FileName :CdmMngController.java
 * @since : 2023. 02. 10.
 * @version 1.0
 * @author : jyk
 * @프로그램 설명 :	공통코드관리에 대한 controller 클래스를 정의한다.
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023.02.01   kyh           최초생성
 *  </pre>
 */
@Controller
@RequestMapping("/portal/sys/cdm/mng/")
public class CdmMngController {

	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** EgovProgrmManageService */
	@Resource(name = "cdmMngService")
    private CdmMngService cdmMngService;

	/** EgovMessageSource */
    @Resource(name="kcureMessageSource")
    KcureMessageSource kcureMessageSource;

    /**
	 * @Method Name : viewGrpCodeList
	 * @작성일 : 2023. 01. 06.
	 * @작성자 : bhs
	 * @Method 설명 :  마스터코드목록관리 화면을 호출한다.
	 * @param  model
	 * @return
	 */
    @RequestMapping(value ="viewCdmMng.do")
    public String selectGrpCodeList(ModelMap model) {
		return "kcure/portal/sys/cdm/ViewCdmManage";
	}

    /**
     * @Method Name : viewGrpCodeList
     * @작성일 : 2023. 1. 6.
     * @작성자 : bhs
     * @Method 설명 : 마스터코드목록을 조회한다.
     * @param : param
     * @return :
     */
   @RequestMapping(value="selectGrpCdList.do")
   public ModelAndView selectGrpCdList(@ModelAttribute("searchVO") CdmMngGrpVO vo, ModelMap model){
	   try {
			vo.setPageUnit(propertiesService.getInt("pageUnit"));
			vo.setPageSize(propertiesService.getInt("pageSize"));
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(vo.getPageIndex());
			paginationInfo.setRecordCountPerPage(vo.getPageUnit());
			paginationInfo.setPageSize(vo.getPageSize());

			vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
			vo.setLastIndex(paginationInfo.getLastRecordIndex());
			vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			List<Map<String, Object>> list = cdmMngService.selectGrpCdList(vo);

			model.addAttribute("cdsearchVO", vo);

			int totCnt = cdmMngService.selectGrpCdListTotCnt(vo);
			paginationInfo.setTotalRecordCount(totCnt);

			model.addAttribute(GridVar.gridPage, paginationInfo);
			model.addAttribute("cdsearchVO", vo);
			model.addAttribute(GridVar.gridView, list);
	   	}catch(Exception e) {
	   		e.printStackTrace();
	   	}

       ModelAndView modelAndView = new ModelAndView("jsonView", model);
       return modelAndView;
   }

   /**
	  * @Method Name : saveCdmCdData
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	공통 코드 저장
	  *  </p>
	  * @param : GridParameterMap
	  * @return : ModelAndView
	  */
   @RequestMapping(value="saveCdmCdData.do")
   public ModelAndView saveCdmCdData(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String userId = user.getId();
		cdmMngService.saveCdmCdData(gridParameterMap, userId);

		String resultMsg = egovMessageSource.getMessage("success.common.insert");
		model.addAttribute("resultMsg", resultMsg);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
   }

   /**
	 * @Method Name : viewDetailCodeList
	 * @작성일 : 2023. 01. 06.
	 * @작성자 : bhs
	 * @Method 설명 :  상세코드목록관리 화면을 호출한다.
	 * @param  model
	 * @return
	 */
    @RequestMapping(value ="viewCdmMngDetail.do")
    public String detailCdList(ModelMap model) {
		return "kcure/portal/sym/detail/ViewDetailCodeList";
	}


	/**
	  * @Method Name : selectGrpDetailList
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공통 코드 상세 테이블 조회
	  *  </p>
	  * @param : CdmMngDetailVO
	  * @return : ModelAndView
	  */
	@RequestMapping(value ="selectGrpDetailList.do")
	public ModelAndView selectGrpDetailList(@ModelAttribute("searchVO") CdmMngDetailVO vo, ModelMap model) throws Exception  {

		try {
			vo.setPageUnit(propertiesService.getInt("pageUnit"));
			vo.setPageSize(propertiesService.getInt("pageSize"));
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(vo.getPageIndex());
			paginationInfo.setRecordCountPerPage(vo.getPageUnit());
			paginationInfo.setPageSize(vo.getPageSize());

			vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
			vo.setLastIndex(paginationInfo.getLastRecordIndex());
			vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			List<Map<String, Object>> list = cdmMngService.selectDetailCdList(vo);

			model.addAttribute("detailcdsearchVO", vo);

			int totCnt = cdmMngService.selecthDetailCdListTotCnt(vo);
			paginationInfo.setTotalRecordCount(totCnt);

			model.addAttribute(GridVar.gridPage, paginationInfo);
			model.addAttribute("detailcdsearchVO", vo);
			model.addAttribute(GridVar.gridView, list);
		}catch(Exception e) {
			e.printStackTrace();
		}

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}

	/**
	  * @Method Name : saveCdmDetailCdData
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	공통 코드 상세 테이블 저장
	  *  </p>
	  * @param : GridParameterMap
	  * @return : ModelAndView
	  */
	@RequestMapping(value="saveCdmDetailCdData.do")
	public ModelAndView saveCdmDetailCdData(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String userId = user.getId();
		cdmMngService.saveCdmDetailCdData(gridParameterMap, userId);

		String resultMsg = egovMessageSource.getMessage("success.common.insert");
		model.addAttribute("resultMsg", resultMsg);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}

}
