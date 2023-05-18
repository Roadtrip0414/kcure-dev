package kcure.portal.sys.rsr.daz.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.ModelAttribute;
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
import kcure.portal.sys.rsr.daz.service.RsrDazService;
import kcure.portal.sys.rsr.daz.service.impl.RsrDazSearchVO;
import kcure.portal.sys.pim.mng.service.PimMngService;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.com.service.ComService;
import kcure.portal.sys.com.service.impl.ComVO;

@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/sys/rsr/daz")
public class RsrDazController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "comService")
    private ComService comService;

    @Resource(name = "rsrDazService")
    private RsrDazService rsrDazService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : viewSvcPrtiDsz
      * @작성일 : 2023. 3. 16
      * @작성자 : parkgu
      * @Method 설명 : 코드셋 화면 조회
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewSvcPrtiDsz.do")
    public String viewSvcPrtiDsz(ModelMap model) throws Exception {
    	ComVO searchVO = new ComVO();
    	searchVO.setGrpCd("SI_DO_STCD");
    	List<ComVO> siDoStcdList = comService.selectComList(searchVO);
		model.addAttribute("siDoStcdList", siDoStcdList);

		return "kcure/portal/sys/rsr/daz/ViewSvcPrtiDsz";
    }

    /**
      * @Method Name : selectSvcPrtiSpCdIs02
      * @작성일 : 2023. 3. 16
      * @작성자 : parkgu
      * @Method 설명 : 활용센터 관리 목록 조회
      *  <p>
      *  </p>
      * @param : rsrDazVO RsrDazSearchVO
      * @return : ModelAndView
      */
    @RequestMapping(value={"/selectSvcPrtiSpCdIs02.do"})

    public ModelAndView selectSvcPrtiSpCdIs02(@ModelAttribute("searchVO") RsrDazSearchVO searchVO, ModelMap model) throws Exception {
        /** EgovPropertyService.sample */
        searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
        searchVO.setPageSize(propertiesService.getInt("pageSize"));

        /** paging */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
        paginationInfo.setPageSize(searchVO.getPageSize());

        searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
        searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute(GridVar.gridView, rsrDazService.selectSvcPrtiSpCdIs02(searchVO));

        int totCnt = rsrDazService.selectSvcPrtiSpCdIs02TotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);

        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    @RequestMapping(value={"/saveSvcPrtiCtpvSpcd.do"})
    public ModelAndView saveSvcPrtiCtpvSpcd(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	String userId = user.getId();
    	rsrDazService.saveSvcPrtiCtpvSpcd(gridParameterMap, userId);

		String resultMsg = egovMessageSource.getMessage("success.common.insert");
		model.addAttribute("resultMsg", resultMsg);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }


    /**
      * @Method Name : selectSvcPrtiDszList
      * @작성일 : 2023. 3. 16
      * @작성자 : parkgu
      * @Method 설명 : 코드셋상세 목록 조회
      *  <p>
      *  </p>
      * @return : ModelAndView
      */
    @RequestMapping(value={"/selectSvcPrtiDszList.do"})
    public ModelAndView selectSvcPrtiDszList(@ModelAttribute("searchVO") ComDefaultVO searchVO, @RequestParam Map<String, Object> param, ModelMap model) throws Exception {
        /** EgovPropertyService.sample */
        searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
        searchVO.setPageSize(propertiesService.getInt("pageSize"));

        /** paging */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
        paginationInfo.setPageSize(searchVO.getPageSize());

        searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
        searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		searchVO.setSearchKeyword(param.get("prtiIdMaster") + "");

        model.addAttribute(GridVar.gridView, rsrDazService.selectSvcPrtiDszList(searchVO));

        int totCnt = rsrDazService.selectSvcPrtiDszListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);

        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    @RequestMapping(value={"/saveSvcPrtiDsz.do"})
    public ModelAndView saveSvcPrtiDsz(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	String userId = user.getId();
    	rsrDazService.saveSvcPrtiDsz(gridParameterMap, userId);

		String resultMsg = egovMessageSource.getMessage("success.common.insert");
		model.addAttribute("resultMsg", resultMsg);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }
}
