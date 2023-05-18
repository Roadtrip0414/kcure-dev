package kcure.portal.sys.rsr.dto.web;

import java.util.HashMap;
import java.util.List;
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
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.com.service.ComService;
import kcure.portal.sys.com.service.impl.ComVO;
import kcure.portal.sys.pim.mng.service.PimMngService;
import kcure.portal.sys.rsr.dto.service.RsrDtoService;
import kcure.portal.sys.rsr.dto.service.impl.RsrDtoSearchVO;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.dto.web
  * @FileName : RsrDtoController.java
  * @since : 2023.03.20
  * @version 1.0
  * @author : parkgu
  * @프로그램 설명 : 데이터반출관리
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
@RequestMapping("/portal/sys/rsr/dto")
public class RsrDtoController {

    /**
     * 참여기관 service
     */
    @Resource(name = "pimMngService")
    private PimMngService pimMngService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "rsrDtoService")
    private RsrDtoService rsrDtoService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "comService")
    private ComService comService;

    /**
     * @Method Name : viewSvcDttoAplc
     * @작성일 : 2023.03.20
     * @작성자 : parkgu
     * @Method 설명 : 데이터반출관리 화면 조회
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/viewSvcDttoAplc.do")
    public String viewSvcDttoAplc(ModelMap model) throws Exception {
    	List<?> prtiList = pimMngService.selectPrtiAllList("01");
        model.addAttribute("prtiList", prtiList);

    	ComVO searchVO = new ComVO();
    	searchVO.setGrpCd("DTU_APLC_PROG_STCD");
    	List<ComVO> dttoAplcProgStList = comService.selectComList(searchVO);
    	dttoAplcProgStList.removeIf(ComVO -> ComVO.getDetlCd().equals("U05"));
    	
		model.addAttribute("dttoAplcProgStList", dttoAplcProgStList);

        return "kcure/portal/sys/rsr/dto/ViewSvcDttoAplc";
    }

    /**
     * @Method Name : selectSvcDttoAplc
     * @작성일 : 2023.03.20
     * @작성자 : parkgu
     * @Method 설명 : 데이터반출관리 목록 조회
     *  <p>
     *  </p>
     * @param : searchVO RsrDtoSearchVO
     * @return : ModelAndView
     */
    @RequestMapping(value="/selectSvcDttoAplcList.do")
    public ModelAndView selectSvcDttoAplcList(@ModelAttribute("searchVO") RsrDtoSearchVO searchVO, ModelMap model) throws Exception {
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

        model.addAttribute(GridVar.gridView, rsrDtoService.selectSvcDttoAplcList(searchVO));

        int totCnt = rsrDtoService.selectSvcDttoAplcListTotCnt(searchVO);
        paginationInfo.setTotalRecordCount(totCnt);

        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
     * @Method Name : detailSvcDttoAplc
     * @작성일 : 2023.03.20
     * @작성자 : parkgu
     * @Method 설명 : 데이터반출관리 상세 심의화면 조회
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/detailSvcDttoAplc.do")
    public String detailSvcDttoAplc(@ModelAttribute("searchVO") RsrDtoSearchVO searchVO, ModelMap model) throws Exception {
    	Map<String, Object> detail = rsrDtoService.selectSvcDttoAplc(searchVO);
    	List<Map<String, Object>> dttoFileList = rsrDtoService.selectSvcDttoAplcFileList(searchVO);
    	
        model.addAttribute("detail", detail);
        model.addAttribute("dttoFileListCnt", dttoFileList.size());
        model.addAttribute("dttoFileList", dttoFileList);

        return "kcure/portal/sys/rsr/dto/DetailSvcDttoAplc";
    }
    
    /**
     * @Method Name : detailSvcDttoAplc
     * @작성일 : 2023.03.20
     * @작성자 : parkgu
     * @Method 설명 : 데이터반출관리 상세 결과화면 조회
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/detailSvcDttoRsltAplc.do")
    public String detailSvcDttoRsltAplc(@ModelAttribute("searchVO") RsrDtoSearchVO searchVO, ModelMap model) throws Exception {
    	Map<String, Object> detail = rsrDtoService.selectSvcDttoAplc(searchVO);
    	List<Map<String, Object>> dttoFileList = rsrDtoService.selectSvcDttoAplcFileList(searchVO);
    	
        model.addAttribute("detail", detail);
        model.addAttribute("dttoFileListCnt", dttoFileList.size());
        model.addAttribute("dttoFileList", dttoFileList);

        return "kcure/portal/sys/rsr/dto/DetailSvcDttoRsltAplc";
    }
    

    /**
     * @Method Name : saveDttoAplcProg
     * @작성일 : 2023.05.11
     * @작성자 : bhs
     * @Method 설명 : 데이터반출관리 상태변경
     *  <p>
     *  </p>
     * @param : Map<String, Object> param
     * @return : ModelAndView
     */
    @RequestMapping(value="/saveDttoAplcProg.do")
    public String saveDttoAplcProg(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
    	rsrDtoService.saveDttoAplcProg(param);

        return "redirect:/portal/sys/rsr/dto/viewSvcDttoAplc.do";
    }


    /**
     * @Method Name : updateDttoAplcProgStcd
     * @작성일 : 2023.03.20
     * @작성자 : parkgu
     * @Method 설명 : 데이터반출관리 상태
     *  <p>
     *  </p>
     * @param : Map<String, Object> param
     * @return : ModelAndView
     */
    @RequestMapping(value="/updateDttoAplcProgStcd.do")
    public String updateDttoAplcProgStcd(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
        Map<String, Object> param2 = new HashMap<String, Object>();

    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	String userId = user.getId();
        param2.put("userId", userId);

        param2.put("dttoAplcProgStcd", param.get("dttoAplcProgStcd"));
        param2.put("dataAplcNo", param.get("dataAplcNo"));
        param2.put("dttoAplcDt", param.get("dttoAplcDt"));
        param2.put("rjcRsnCont", param.get("rjcRsnCont"));

        rsrDtoService.updateDttoAplcProgStcd(param2);

        return "redirect:/portal/sys/rsr/dto/viewSvcDttoAplc.do";
    }
}
