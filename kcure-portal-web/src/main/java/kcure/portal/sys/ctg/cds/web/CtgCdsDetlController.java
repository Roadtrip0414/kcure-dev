package kcure.portal.sys.ctg.cds.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.cdm.mng.service.CdmMngService;
import kcure.portal.sys.cdm.mng.service.Impl.CdmMngDetailVO;
import kcure.portal.sys.ctg.cds.service.CtgCdsDetlService;

@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/sys/ctg/cds")
public class CtgCdsDetlController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "ctgCdsDetlService")
    private CtgCdsDetlService ctgCdsDetlService;
    
	@Resource(name = "cdmMngService")
    private CdmMngService cdmMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : selectCdsDetlList
      * @작성일 : 2023. 2. 2.
      * @작성자 : parkgu
      * @Method 설명 : 코드셋상세 목록 조회
      *  <p>
      *  </p>
      * @param : cdsDetlVO CdsDetlVO
      * @return : ModelAndView
      */
    @RequestMapping(value={"/selectCdsDetlList.do"})
    public ModelAndView selectCdsDetlList(@ModelAttribute("searchVO") CdmMngDetailVO vo, ModelMap model) throws Exception  {

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

    @RequestMapping(value={"/saveCdsDetl.do"})
    public ModelAndView saveCdsDetl(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String userId = user.getId();
		cdmMngService.saveCdmDetailCdData(gridParameterMap, userId);

		String resultMsg = egovMessageSource.getMessage("success.common.insert");
		model.addAttribute("resultMsg", resultMsg);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}
}
