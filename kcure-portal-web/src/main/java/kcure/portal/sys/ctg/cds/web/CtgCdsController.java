package kcure.portal.sys.ctg.cds.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringEscapeUtils;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.cdm.mng.service.CdmMngService;
import kcure.portal.sys.cdm.mng.service.Impl.CdmMngGrpVO;
import kcure.portal.sys.ctg.cds.service.CtgCdsService;
import kcure.portal.sys.ctg.cds.service.impl.CtgCdsVO;
import kcure.portal.sys.ctg.dts.service.CtgDtsService;
import kcure.portal.sys.pim.mng.service.PimMngService;

@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/sys/ctg/cds")
public class CtgCdsController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "ctgCdsService")
    private CtgCdsService ctgCdsService;

    @Resource(name = "ctgDtsService")
    private CtgDtsService ctgDtsService;
    
	@Resource(name = "cdmMngService")
    private CdmMngService cdmMngService;

    /**
     * 참여기관 service
     */
    @Resource(name = "pimMngService")
    private PimMngService pimMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : viewCdsDfndManage
      * @작성일 : 2023. 2. 2.
      * @작성자 : parkgu
      * @Method 설명 : 코드셋 화면 조회
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewCdsDfndManage.do")
    public String viewCdsDfndManage(ModelMap model) throws Exception {
		return "kcure/portal/sys/ctg/ViewCdsDfndManage";
    }

    /**
      * @Method Name : selectCdsDfndList
      * @작성일 : 2023. 2. 2.
      * @작성자 : parkgu
      * @Method 설명 : 코드셋 목록 조회
      *  <p>
      *  </p>
      * @param : ctgCdsVO CtgCdsVO
      * @return : ModelAndView
      */
    @RequestMapping(value={"/selectCdsDfndList.do"})
    public ModelAndView selectCdsDfndList(@ModelAttribute("searchVO") CdmMngGrpVO vo, ModelMap model){
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

 			//카탈로그용 코드 구분 추가
 			vo.setDtsComCdYn("Y");
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

    @RequestMapping(value={"/saveCdsDfnd.do"})
    public ModelAndView saveCdsDfnd(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String userId = user.getId();
		cdmMngService.saveCdmCdData(gridParameterMap, userId);

		String resultMsg = egovMessageSource.getMessage("success.common.insert");
		model.addAttribute("resultMsg", resultMsg);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
   }

    /**
     * @작성일 : 2023. 2. 7
     * @작성자 : parkgu
     * @Method 설명 : 엑셀업로드 팝업
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/uploadCdsDfndPopup.do")
    public String uploadCdsDfndPopup() throws Exception {
    	return "kcure/portal/sys/ctg/UploadCdsDfndPopup";
    }

    /**
     * @작성일 : 2023. 2. 9
     * @작성자 : parkgu
     * @Method 설명 : 코드 조회 팝업
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/selectCdsDfndPopup.do")
    public String selectCdsDfndPopup(ModelMap model) throws Exception {
    	return "kcure/portal/sys/ctg/SelectCdsDfndPopup";
    }

    /**
     * @작성일 : 2023. 2. 7.
     * @작성자 : parkgu
     * @Method 설명 : 코드 업로드
     *  <p>
     *  </p>
     * @return : ModelAndView
     */
	@RequestMapping(value="/insertCdsDfndFromExcel.do")
	public ModelAndView insertCdsDfndFromExcel(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		String rows = StringEscapeUtils.unescapeHtml4((String)param.get("rows"));
		ObjectMapper mapper = new ObjectMapper();
		List<CtgCdsVO> list = mapper.readValue(rows, new TypeReference<List<CtgCdsVO>>(){});

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String userId = user.getId();
		ctgCdsService.insertCdsDfnd(list, userId);

		String resultMsg = egovMessageSource.getMessage("success.common.insert");
		model.addAttribute("resultMsg", resultMsg);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}
}
