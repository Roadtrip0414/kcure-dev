package kcure.portal.sys.ctg.col.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringEscapeUtils;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
import kcure.portal.sys.com.service.ComService;
import kcure.portal.sys.com.service.impl.ComVO;
import kcure.portal.sys.ctg.col.service.CtgColService;
import kcure.portal.sys.ctg.col.service.impl.CtgColVO;
import kcure.portal.sys.ctg.dts.service.CtgDtsService;
import kcure.portal.sys.ctg.dts.service.impl.CtgDtsVO;
import kcure.portal.sys.pim.mng.service.PimMngService;

@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/sys/ctg/col")
public class CtgColController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "ctgColService")
    private CtgColService ctgColService;

    @Resource(name = "ctgDtsService")
    private CtgDtsService ctgDtsService;

    /**
     * 참여기관 service
     */
    @Resource(name = "pimMngService")
    private PimMngService pimMngService;

    @Resource(name = "comService")
    private ComService comService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : viewDtsColDfndManage
      * @작성일 : 2023. 2. 8.
      * @작성자 : parkgu
      * @Method 설명 : 컬럼관리 화면 조회
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewDtsColDfndManage.do")
    public String viewDtsColDfndManage(ModelMap model) throws Exception {
    	List<?> prtiList = pimMngService.selectPrtiAllList("01");
    	List<CtgDtsVO> prtiDtsList = ctgDtsService.selectPrtiDtsList();

    	ComVO searchVO = new ComVO();
    	searchVO.setGrpCd("DATA_TYPE");
    	List<ComVO> dataTpList = comService.selectComList(searchVO);

		model.addAttribute("prtiList", prtiList);
    	model.addAttribute("prtiDtsList", prtiDtsList);
    	model.addAttribute("dataTpList", dataTpList);

        return "kcure/portal/sys/ctg/ViewDtsColDfndManage";
    }

    /**
      * @Method Name : selectDtsColDfndList
      * @작성일 : 2023. 2. 8.
      * @작성자 : parkgu
      * @Method 설명 : 컬럼관리 목록 조회
      *  <p>
      *  </p>
      * @param : dtsColDfndVO CtgColVO
      * @return : ModelAndView
      */
    @RequestMapping(value={"/selectDtsColDfndList.do"})
    public ModelAndView selectDtsColDfndList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		CtgColVO searchVO = new CtgColVO();

		if(param.get("pageIndex") != null) {
			searchVO.setPageIndex(Integer.parseInt(param.get("pageIndex").toString()));
		}

    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		searchVO.setPrtiId(param.get("prtiId") + "");
		searchVO.setSearchKeyword(param.get("searchKeyword") + "");

        List<CtgColVO> list = ctgColService.selectDtsColDfndList(searchVO);

        model.addAttribute("searchVO", searchVO);

        int totCnt = ctgColService.selectDtsColDfndListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute(GridVar.gridPage, paginationInfo);
	    model.addAttribute("searchVO", searchVO);
		model.addAttribute(GridVar.gridView, list);

        ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }

    @RequestMapping(value={"/saveDtsColDfnd.do"})
    public ModelAndView saveDtsColDfnd(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	String userId = user.getId();
    	ctgColService.saveDtsColDfnd(gridParameterMap, userId);

		String resultMsg = egovMessageSource.getMessage("success.common.insert");
		model.addAttribute("resultMsg", resultMsg);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }

    /**
     * @작성일 : 2023. 2. 9
     * @작성자 : parkgu
     * @Method 설명 : 엑셀업로드 팝업
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/uploadDtsColDfndPopup.do")
    public String uploadDtsColDfndPopup() throws Exception {
    	return "kcure/portal/sys/ctg/UploadDtsColDfndPopup";
    }

    /**
     * @작성일 : 2023. 2. 9.
     * @작성자 : parkgu
     * @Method 설명 : 컬럼관리 업로드
     *  <p>
     *  </p>
     * @return : ModelAndView
     */
	@RequestMapping(value="/insertDtsColDfndFromExcel.do")
	public ModelAndView insertDtsColDfndFromExcel(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		String rows = StringEscapeUtils.unescapeHtml4((String)param.get("rows"));
		ObjectMapper mapper = new ObjectMapper();
		List<CtgColVO> list = mapper.readValue(rows, new TypeReference<List<CtgColVO>>(){});

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String userId = user.getId();
		ctgColService.insertDtsColDfnd(list, userId);

		String resultMsg = egovMessageSource.getMessage("success.common.insert");
		model.addAttribute("resultMsg", resultMsg);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}
}
