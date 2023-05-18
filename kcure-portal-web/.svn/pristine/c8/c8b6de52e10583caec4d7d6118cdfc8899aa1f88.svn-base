package kcure.portal.sys.rsr.tkin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import kcure.portal.myp.rsc.inf.service.MypRscInfService;
import kcure.portal.sys.com.service.ComService;
import kcure.portal.sys.com.service.impl.ComVO;
import kcure.portal.sys.pim.mng.service.PimMngService;
import kcure.portal.sys.rsr.tkin.service.RsrTkinService;
import kcure.portal.sys.rsr.tkin.service.impl.RsrTkinSearchVO;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.dto.web
  * @FileName : RsrTkinController.java
  * @since : 2023.05.08
  * @version 1.0
  * @author : bhs
  * @프로그램 설명 : 데이터반입관리
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
@RequestMapping("/portal/sys/rsr/tkin")
public class RsrTkinController {

    /**
     * 참여기관 service
     */
    @Resource(name = "pimMngService")
    private PimMngService pimMngService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "rsrTkinService")
    private RsrTkinService rsrTkinService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "comService")
    private ComService comService;
    
    @Resource(name = "mypRscInfService")
	private MypRscInfService mypRscInfService;

    /**
     * @Method Name : viewSvcTkinAplc
     * @작성일 : 2023.05.08
     * @작성자 : bhs
     * @Method 설명 : 데이터반입관리 화면 조회
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/viewSvcTkinAplc.do")
    public String viewSvcTkinAplc(RsrTkinSearchVO searchVO, ModelMap model) throws Exception {
    	ComVO comVo = new ComVO();
    	comVo.setGrpCd("DTU_APLC_PROG_STCD");
    	List<ComVO> tkinDataProgStList = comService.selectComList(comVo);
    	tkinDataProgStList.removeIf(ComVO -> ComVO.getDetlCd().equals("U05"));
    	
		model.addAttribute("tkinDataProgStList", tkinDataProgStList);
		model.addAttribute("searchVO", searchVO);

        return "kcure/portal/sys/rsr/tkin/ViewSvcTkinAplc";
    }

    /**
     * @Method Name : selectSvcTkinAplcList
     * @작성일 : 2023.03.20
     * @작성자 : parkgu
     * @Method 설명 : 데이터반입관리 목록 조회
     *  <p>
     *  </p>
     * @param : searchVO RsrDtoSearchVO
     * @return : ModelAndView
     */
    @RequestMapping(value="/selectSvcTkinAplcList.do")
    public ModelAndView selectSvcTkinAplcList(@ModelAttribute("searchVO") RsrTkinSearchVO searchVO, ModelMap model) throws Exception {
    	try {
    		 /** EgovPropertyService.sample */
            searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
            searchVO.setPageSize(propertiesService.getInt("pageSize"));

            PaginationInfo paginationInfo = new PaginationInfo();
            
            paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
    		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
    		paginationInfo.setPageSize(searchVO.getPageSize());

            searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
            searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
            searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

            model.addAttribute(GridVar.gridView, rsrTkinService.selectSvcTkinAplcList(searchVO));

            int totCnt = rsrTkinService.selectSvcTkinAplcListTotCnt(searchVO);
            paginationInfo.setTotalRecordCount(totCnt);

            model.addAttribute(GridVar.gridPage, paginationInfo);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
       
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
     * @Method Name : detailSvcTkinAplc
     * @작성일 : 2023.05.08
     * @작성자 : bhs
     * @Method 설명 : 데이터반입관리 상세 화면 조회
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/detailSvcTkinAplc.do")
    public String detailSvcTkinAplc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", sessionVo.getId());
		paramMap.put("dataAplcNo", (String)request.getParameter("dataAplcNo"));
		paramMap.put("rsrAsmtNo", (String)request.getParameter("rsrAsmtNo"));
		paramMap.put("tkinDtapNo", (String)request.getParameter("tkinDtapNo"));

		Map<String, Object> tkinInfo = rsrTkinService.selectSvcTkinAplcDetail(paramMap);	//반입신청상세정보
		List<Map<String, Object>> tkInFileList = rsrTkinService.selectSvcTkinAplcFileList(paramMap);	 //반입파일리스트

		model.addAttribute("tkinInfo", tkinInfo);	 //반입신청상세정보
		model.addAttribute("tkInFileListCnt", tkInFileList.size()); //반입파일리스트 사이즈
		model.addAttribute("tkInFileList", tkInFileList);	 //반입파일리스트
    	
        return "kcure/portal/sys/rsr/tkin/DetailSvcTkinAplc";
    }
    
    /**
     * @Method Name : detailSvcTkinRsltAplc
     * @작성일 : 2023.05.09
     * @작성자 : bhs
     * @Method 설명 : 데이터반입관리 상세 결과화면 조회
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/detailSvcTkinRsltAplc.do")
    public String detailSvcTkinRsltAplc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", sessionVo.getId());
		paramMap.put("dataAplcNo", (String)request.getParameter("dataAplcNo"));
		paramMap.put("rsrAsmtNo", (String)request.getParameter("rsrAsmtNo"));
		paramMap.put("tkinDtapNo", (String)request.getParameter("tkinDtapNo"));

		Map<String, Object> tkinInfo = rsrTkinService.selectSvcTkinAplcDetail(paramMap);	//반입신청상세정보
		List<Map<String, Object>> tkInFileList = rsrTkinService.selectSvcTkinAplcFileList(paramMap);	 //반입파일리스트

		model.addAttribute("tkinInfo", tkinInfo);	 //반입신청상세정보
		model.addAttribute("tkInFileListCnt", tkInFileList.size()); //반입파일리스트 사이즈
		model.addAttribute("tkInFileList", tkInFileList);	 //반입파일리스트
    	
        return "kcure/portal/sys/rsr/tkin/DetailSvcTkinRsltAplc";
    }


    /**
     * @Method Name : saveTkinAplcProg
     * @작성일 : 2023.05.08
     * @작성자 : bhs
     * @Method 설명 : 데이터반입관리 상태변경
     *  <p>
     *  </p>
     * @param : Map<String, Object> param
     * @return : ModelAndView
     */
    @RequestMapping(value="/saveTkinAplcProg.do")
    public String saveTkinAplcProg(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
        rsrTkinService.saveTkinAplcProg(param);

        return "redirect:/portal/sys/rsr/tkin/viewSvcTkinAplc.do";
    }
}
