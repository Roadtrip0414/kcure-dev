package kcure.portal.sys.ctg.dts.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.ctg.dts.service.CtgDtsService;
import kcure.portal.sys.ctg.dts.service.impl.CtgDtsVO;
import kcure.portal.sys.pim.mng.service.PimMngService;

@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/sys/ctg/dts")
public class CtgDtsController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "ctgDtsService")
    private CtgDtsService ctgDtsService;

    /**
     * 참여기관 service
     */
    @Resource(name = "pimMngService")
    private PimMngService pimMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : viewDtsDfndManage
      * @작성일 : 2023. 2. 2.
      * @작성자 : parkgu
      * @Method 설명 : 데이터셋 화면 조회
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewDtsDfndManage.do")
    public String viewDtsDfndManage(ModelMap model) throws Exception {
    	List<?> prtiList = pimMngService.selectPrtiAllList("01");
		model.addAttribute("prtiList", prtiList);

        return "kcure/portal/sys/ctg/ViewDtsDfndManage";
    }

    /**
      * @Method Name : selectDtsDfndList
      * @작성일 : 2023. 2. 2.
      * @작성자 : parkgu
      * @Method 설명 : 데이터셋 목록 조회
      *  <p>
      *  </p>
      * @param : ctgDtsVO CtgDtsVO
      * @return : ModelAndView
      */
    @RequestMapping(value={"/selectDtsDfndList.do"})
    public ModelAndView selectDtsDfndList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		CtgDtsVO searchVO = new CtgDtsVO();

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

        List<CtgDtsVO> list = ctgDtsService.selectDtsDfndList(searchVO);

        model.addAttribute("searchVO", searchVO);

        int totCnt = ctgDtsService.selectDtsDfndListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute(GridVar.gridPage, paginationInfo);
	    model.addAttribute("searchVO", searchVO);
		model.addAttribute(GridVar.gridView, list);

        ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }

    /**
      * @Method Name : saveDtsDfnd
      * @작성일 : 2023. 2. 17.
      * @작성자 : parkgu
      * @Method 설명 : 데이터셋 저장
      *  <p>
      *  </p>
      * @param : gridParameterMap GridParameterMap
      * @return : ModelAndView
      */
    @RequestMapping(value={"/saveDtsDfnd.do"})
    public ModelAndView saveDtsDfnd(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	String userId = user.getId();
    	ctgDtsService.saveDtsDfnd(gridParameterMap, userId);

		String resultMsg = egovMessageSource.getMessage("success.common.insert");
		model.addAttribute("resultMsg", resultMsg);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }
}

