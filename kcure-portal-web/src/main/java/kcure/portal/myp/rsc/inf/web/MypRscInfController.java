package kcure.portal.myp.rsc.inf.web;

import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.string.EgovStringUtil;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.CommonEnum.PayType;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.cmn.service.DataFileService;
import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.cmn.tags.service.TagsService;
import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.cmn.util.SendFtpUtil;
import kcure.portal.dac.clc.inf.service.ClcInfReserchService;
import kcure.portal.dac.clc.inf.service.Clcinf2Service;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchVo;
import kcure.portal.myp.rsc.inf.service.MypRscInfService;
import kcure.portal.myp.rsc.inf.service.impl.ExtnVO;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.pay.pay.service.PaymentService;
import kcure.portal.sys.pay.pay.service.impl.PaymentHelper;
import kcure.portal.sys.pay.pay.service.impl.PaymentReadyVO;
import kcure.portal.sys.pay.pay.service.impl.PaymentResultVO;
import kcure.portal.uat.uia.service.KcureLoginService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.rsc.inf.web
 * @FileName : MypRscInfController.java
 * @since : 2023. 02. 01.
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	마이페이지 나의연구에 대한 controller 클래스를 정의한다.
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
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/myp/rsc/inf/")
public class MypRscInfController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	@Resource(name = "KcureLoginService")
	private KcureLoginService loginService;

	@Resource(name = "TagsService")
	private TagsService tagsService;

	@Resource(name = "mypRscInfService")
	private MypRscInfService mypRscInfService;

	@Resource(name = "ClcInfReserchService")
	private ClcInfReserchService clcInfReserchService;

	@Resource(name = "commonUtils")
	private CommonUtils commonUtils;

	@Resource(name = "DataFileService")
	private DataFileService dataFileService;

    @Resource(name = "paymentService")
    private PaymentService paymentService;

	@Resource(name = "clcinf2Service")
	private Clcinf2Service clcinf2Service;
    
    /**
	 * @Method Name : viewMypRscInfApl
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	신청 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypRscInfApl.do")
    public String viewMypRscInfApl(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());

    	model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회

    	model.addAttribute("viewGbnChk", "viewApl");	//신청화면
    	model.addAttribute("pageIndex", request.getParameter("pageIndex"));
    	return "kcure/portal/myp/rsc/ViewMypRscInfApl";
    }

    /**
	 * @Method Name : selectMypRscInfAplList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  신청 목록 조회
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="selectMypRscInfAplList.do")
    public ModelAndView selectMypRscInfAplList(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {
		/** EgovPropertyService.sample */
    	comDefaultVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	comDefaultVO.setPageSize(propertiesService.getInt("pageSize"));

		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(comDefaultVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(comDefaultVO.getPageUnit());
		paginationInfo.setPageSize(comDefaultVO.getPageSize());

		comDefaultVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		comDefaultVO.setLastIndex(paginationInfo.getLastRecordIndex());
		comDefaultVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());
    	paramMap.put("recordCountPerPage", comDefaultVO.getRecordCountPerPage());
    	paramMap.put("firstIndex", comDefaultVO.getFirstIndex());
//    	paramMap.put("rsrEndYn", "N");		//연구종료여부

		int totCnt = mypRscInfService.selectMypRscAplcListTotCnt(paramMap);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute(GridVar.gridPage, paginationInfo);
		model.addAttribute(GridVar.gridView, mypRscInfService.selectMypRscAplcList(paramMap));
    	model.addAttribute("searchVO", comDefaultVO);
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
	 * @Method Name : viewMypRscInfUse
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	활용 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypRscInfUse.do")
    public String viewMypRscInfUse(HttpServletRequest request, HttpServletResponse response, ModelMap model, @ModelAttribute("searchVO") ComDefaultVO comDefaultVO) throws Exception {
    	/** EgovPropertyService.sample */
    	comDefaultVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	comDefaultVO.setPageSize(propertiesService.getInt("pageSize"));

		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(comDefaultVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(comDefaultVO.getPageUnit());
		paginationInfo.setPageSize(comDefaultVO.getPageSize());

		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());
    	paramMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
    	paramMap.put("firstIndex", paginationInfo.getFirstRecordIndex());
    	paramMap.put("aplcProgStcd", "05");		//승인완료
    	paramMap.put("rsrEndYn", "N");		//연구종료여부

		int totCnt = mypRscInfService.selectMypRscInfAplListTotCnt(paramMap);
		paginationInfo.setTotalRecordCount(totCnt);

    	model.addAttribute("rscInfAplList", mypRscInfService.selectMypRscInfAplList(paramMap));	//나의연구 신청목록 조회
    	model.addAttribute("paginationInfo", paginationInfo);

    	Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
    	if (flashMap!=null) {
    		model.addAttribute("actMessage", (String)flashMap.get("actMessage"));
    	}

    	model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회
    	model.addAttribute("viewGbnChk", "viewUse");	//활용화면

    	return "kcure/portal/myp/rsc/ViewMypRscInfUse";
    }

    /**
	 * @Method Name : viewMypRscInfIn
	 * @작성일 : 2023. 05. 02.
	 * @작성자 : bhs
	 * @Method 설명 :  	반입 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypRscInfIn.do")
    public String viewMypRscInfIn(HttpServletRequest request, HttpServletResponse response, ModelMap model, @ModelAttribute("searchVO") ComDefaultVO comDefaultVO) throws Exception {
    	/** EgovPropertyService.sample */
    	comDefaultVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	comDefaultVO.setPageSize(propertiesService.getInt("pageSize"));

		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(comDefaultVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(comDefaultVO.getPageUnit());
		paginationInfo.setPageSize(comDefaultVO.getPageSize());

    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());
    	paramMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
    	paramMap.put("firstIndex", paginationInfo.getFirstRecordIndex());

    	int totCnt = mypRscInfService.selectMypRscInfInListTotCnt(paramMap);
		paginationInfo.setTotalRecordCount(totCnt);

    	model.addAttribute("rscInfInList", mypRscInfService.selectMypRscInfInList(paramMap));	//나의연구 반입신청목록 조회
    	model.addAttribute("paginationInfo", paginationInfo);

    	model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회
    	model.addAttribute("viewGbnChk", "viewIn");	//반출화면

    	return "kcure/portal/myp/rsc/ViewMypRscInfIn";
    }


    /**
	 * @Method Name : selectMypRscInfUseList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 목록 조회
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="selectMypRscInfUseList.do")
    public ModelAndView selectMypRscInfUseList(@RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());
    	paramMap.put("dataAplcNo", (String)commandMap.get("dataAplcNo"));

    	/***************************************************
    	 * 2023.04.28
    	 * gGeon
    	 * 테이블 키 구조의 변경으로 인해 연구과제번호 추가
    	 *************************************************** */
    	paramMap.put("rsrAsmtNo", (String)commandMap.get("rsrAsmtNo"));
    	paramMap.put("allListYn", (String)commandMap.get("allListYn"));

		model.addAttribute(GridVar.gridView, mypRscInfService.selectMypRscInfUseList(paramMap));
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	model.addAttribute("totCnt", mypRscInfService.selectMypRscInfUseListTotCnt(paramMap));

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
	 * @Method Name : selectMypRscInfUse
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 내역 조회
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectMypRscInfUse.do")
    public HashMap<String, Object> selectMypRscInfUse(@RequestParam HashMap<String, Object> commandMap) throws Exception {
    	HashMap<String, Object> resultMap = new HashMap<>();

    	Map<String, Object> useInfo = mypRscInfService.selectMypRscInfUse(commandMap);

    	if (useInfo != null && !useInfo.isEmpty()) {
        	resultMap.put("result", "success");
        	resultMap.put("useInfo", useInfo);
    	} else {
        	resultMap.put("result", "nodata");
    	}

    	return resultMap;
    }

    /**
  	 * @Method Name : selectMypRscInfTkinList
  	 * @작성일 : 2023. 02. 01.
  	 * @작성자 : kyh
  	 * @Method 설명 :  활용 신청 목록 조회
  	 * @param : model
  	 * @return :
  	 */
      @RequestMapping(value="selectMypRscInfTkinList.do")
      public ModelAndView selectMypRscInfTkinList(@RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {
  		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

      	HashMap<String, Object> paramMap = new HashMap<>();
      	paramMap.put("userId", sessionVo.getId());
      	paramMap.put("dataAplcNo", (String)commandMap.get("dataAplcNo"));
      	paramMap.put("rsrAsmtNo", (String)commandMap.get("rsrAsmtNo"));
      	paramMap.put("allListYn", (String)commandMap.get("allListYn"));

      	model.addAttribute("totCnt", mypRscInfService.selectMypRscInfTkinListTotCnt(paramMap));
  		model.addAttribute(GridVar.gridView, mypRscInfService.selectMypRscInfTkinList(paramMap));
      	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

      	ModelAndView modelAndView = new ModelAndView("jsonView", model);
      	return modelAndView;
      }


    /**
	 * @Method Name : selectMypRscInfUseRsvSeat
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  활용 신청 예약좌석 조회
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectMypRscInfUseRsvSeat.do")
    public HashMap<String, Object> selectMypRscInfUseRsvSeat(@RequestParam HashMap<String, Object> commandMap) throws Exception {
    	HashMap<String, Object> resultMap = new HashMap<>();

    	resultMap.put("result", "success");
    	resultMap.put("acidList", mypRscInfService.selectMypRscInfUseAcidList(commandMap));	//분석자목록
    	resultMap.put("dszRsvList", mypRscInfService.selectMypRscInfUseDszRsvList(commandMap));	//좌석목록

    	return resultMap;
    }

    /**
	 * @Method Name : viewMypRscInfUseForm
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	활용 신청 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypRscInfUseForm.do")
    public String viewMypRscInfUseForm(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());
    	paramMap.put("dataAplcNo", (String)request.getParameter("dataAplcNo"));

    	Map<String, Object> aplcInfo = mypRscInfService.selectMypRscInfAplc(paramMap);	//신청기본정보
    	List<Map<String, Object>> rspList = mypRscInfService.selectMypRscInfRspList(paramMap);	//연구자목록

    	ComCdDetailVo comCd = new ComCdDetailVo();

    	/***********************
    	 * 폐쇄형, 원격형
    	 **********************/
    	comCd.setGrpCd("FORM_CD");
    	model.addAttribute("aenvSpcdList", tagsService.searchCommonCodeDetailList(comCd));	//센터참여형태코드
    	//comCd.setGrpCd("SI_DO_STCD");
    	//model.addAttribute("siDoCdList", tagsService.searchCommonCodeDetailList(comCd));	//센터위치(시도전체)
    	
    	/***********************
    	 * 가상화분석도구
    	 **********************/
    	comCd.setGrpCd("VRT_ANLS_DVCE_SPCD");
    	model.addAttribute("vrtDvceCdList", tagsService.searchCommonCodeDetailList(comCd));	//가상화분석도구코드

    	/*************************
    	 * 시도 구분에 따른 안심활용센터
    	 ************************/
    	model.addAttribute("siDoCdList", mypRscInfService.selectMypRscInfDszSiDoList(comCd));	//센터위치(안심활용센터가 있는 시도만)

    	model.addAttribute("aplcInfo", aplcInfo);	//연구기본정보
    	model.addAttribute("rspList", rspList);		//분석자목록

    	model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회
    	model.addAttribute("viewGbnChk", "viewUse");	//활용화면

    	return "kcure/portal/myp/rsc/ViewMypRscInfUseForm";
    }

    /**
   	 * @Method Name : viewMypRscInfInForm
   	 * @작성일 : 2023. 02. 01.
   	 * @작성자 : kyh
   	 * @Method 설명 :  	반입 신청 화면을 호출한다.
   	 * @param : model
   	 * @return :
   	 */
       @RequestMapping(value="viewMypRscInfInForm.do")
       public String viewMypRscInfInForm(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
       	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

       	HashMap<String, Object> paramMap = new HashMap<>();
       	paramMap.put("userId", sessionVo.getId());
       	paramMap.put("dataAplcNo", (String)request.getParameter("dataAplcNo"));
       	paramMap.put("rsrAsmtNo", (String)request.getParameter("rsrAsmtNo"));

       	Map<String, Object> aplcInfo = mypRscInfService.selectMypRscInfAplc(paramMap);	//신청기본정보


       	model.addAttribute("aplcInfo", aplcInfo);	//연구기본정보

       	model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회
       	model.addAttribute("viewGbnChk", "viewIn");	//활용화면

       	return "kcure/portal/myp/rsc/ViewMypRscInfInForm";
       }

   /**
  	 * @Method Name : viewMypRscInfInForm
  	 * @작성일 : 2023. 05. 04.
  	 * @작성자 : bhs
  	 * @Method 설명 :  	반입 신청 상세화면을 호출한다.
  	 * @param : model
  	 * @return :
  	 */
      @RequestMapping(value="viewMypRscInfInDetail.do")
      public String viewMypRscInfInDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", sessionVo.getId());
		paramMap.put("dataAplcNo", (String)request.getParameter("dataAplcNo"));
		paramMap.put("rsrAsmtNo", (String)request.getParameter("rsrAsmtNo"));
		paramMap.put("tkinDtapNo", (String)request.getParameter("tkinDtapNo"));

		Map<String, Object> aplcInfo = mypRscInfService.selectMypRscInfInDetail(paramMap);	//신청연구정보
		Map<String, Object> tkinInfo = mypRscInfService.selectMypRscInfTkInDetailInfo(paramMap);	//반입신청상세정보
		List<Map<String, Object>> fileList = mypRscInfService.selectMypRscInfTkInFileList(paramMap);	//반입파일리스트

		model.addAttribute("aplcInfo", aplcInfo); //연구기본정보
		model.addAttribute("tkinInfo", tkinInfo);	 //반입신청상세정보
		model.addAttribute("fileList", fileList);	 //반입파일리스트

		model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회
		model.addAttribute("viewGbnChk", "viewIn");	//활용화면

      	return "kcure/portal/myp/rsc/ViewMypRscInfInDetail";
      }


    /**
	 * @Method Name : updateFileUnldYn
	 * @작성일 : 2023. 05. 15.
	 * @작성자 : bhs
	 * @Method 설명 :  반출파일다운로드 여부 업데이트
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="updateFileUnldYn.do")
    public HashMap<String, Object> updateFileUnldYn(@RequestParam HashMap<String, Object> commandMap) throws Exception {
    	HashMap<String, Object> resultMap = new HashMap<>();

    	int resultCnt = mypRscInfService.updateFileUnldYn(commandMap);

    	if (resultCnt > 0) {
        	resultMap.put("result", "success");
    	} else {
        	resultMap.put("result", "fail");
    	}

    	return resultMap;
    }
    
    /**
   	 * @Method Name : selectMypRscInfDszPrtiIdList
   	 * @작성일 : 2023. 02. 01.
   	 * @작성자 : kyh
   	 * @Method 설명 :  안심활용센터 목록 조회
   	 * @param : model
   	 * @return :
   	 */
       @ResponseBody
       @RequestMapping(value="selectMypRscInfDszPrtiIdList.do")
       public HashMap<String, Object> selectMypRscInfDszPrtiIdList(@RequestParam HashMap<String, Object> commandMap) throws Exception {
       	HashMap<String, Object> resultMap = new HashMap<>();

       	List<Map<String, Object>> prtiIdList = mypRscInfService.selectMypRscInfDszPrtiIdList(commandMap);

       	if (prtiIdList != null && prtiIdList.size() > 0) {
           	resultMap.put("result", "success");
           	resultMap.put("prtiIdList", prtiIdList);
       	} else {
           	resultMap.put("result", "nodata");
       	}

       	return resultMap;
       }

    /**
	 * @Method Name : selectMypRscInfDszCalList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  안심활용센터 기간선택 달력 조회
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectMypRscInfDszCalList.do")
    public HashMap<String, Object> selectMypRscInfDszCalList(@RequestParam HashMap<String, Object> commandMap) throws Exception {
    	HashMap<String, Object> resultMap = new HashMap<>();
    	
    	//공공신청건인 경우 센터선택 암센터로 지정
    	commandMap.put("dszInstId", commandMap.get("dszInstId") == null ? "M0019" : commandMap.get("dszInstId"));
    	
    	Map<String, Object> aplcInfo = mypRscInfService.selectMypRscInfAplc(commandMap);	//신청기본정보

    	//캘린더 셋팅
    	List<Map<String, Object>> calList = new ArrayList<Map<String, Object>>();
    	List<Map<String, Object>> calExceptList = new ArrayList<Map<String, Object>>();
    	if (aplcInfo.get("dtuSdt") != null && !"".equals(aplcInfo.get("dtuSdt"))) {
        	Calendar calendar = Calendar.getInstance();
        	int loopCnt = 0;
        	for (int i = Integer.parseInt(aplcInfo.get("dtuSdt").toString().substring(0, 6)); i <= Integer.parseInt(aplcInfo.get("dtuEdt").toString().substring(0, 6)) ; i++) {
        		HashMap<String, Object> calMap = new HashMap<>();
        		calMap.put("dtuSdt", (String)aplcInfo.get("dtuSdt"));
        		calMap.put("dtuEdt", (String)aplcInfo.get("dtuEdt"));
        		calMap.put("yyyy", (i+"").substring(0, 4));
        		calMap.put("mm", (i+"").substring(4, 6));

        		//매달 1일
        		calendar.set(Integer.parseInt((i+"").substring(0, 4)), Integer.parseInt((i+"").substring(4, 6))-1, 1);
        		calMap.put("firstDayOfWeek", calendar.get(Calendar.DAY_OF_WEEK));
        		calMap.put("lastDayOfMonth", calendar.getActualMaximum(Calendar.DAY_OF_MONTH));

        		//매달 마지막날 요일
        		calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        		calMap.put("lastDayOfWeek", calendar.get(Calendar.DAY_OF_WEEK));

        		calList.add(loopCnt, calMap);
        		loopCnt = loopCnt + 1;
        	}

        	//제외기간 조회
        	commandMap.put("calDsgnYmdSdt", (String)aplcInfo.get("dtuSdt"));
        	commandMap.put("calDsgnYmdEdt", (String)aplcInfo.get("dtuEdt"));
        	commandMap.put("calDsgnYmdCnt", Integer.parseInt((String)commandMap.get("chkRsrpIdCnt")));
        	calExceptList = mypRscInfService.selectMypRscInfCalExceptList(commandMap);

        	resultMap.put("result", "success");
    	} else {
    		resultMap.put("result", "nodata");
    	}

    	resultMap.put("calList", calList);		//활용신청기간 달력정보
    	resultMap.put("calExceptList", calExceptList);		//활용신청기간 제외기간 달력정보

    	return resultMap;
    }

    /**
	 * @Method Name : saveMypRscInfUseAplc
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	활용 신청 저장
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="saveMypRscInfUseAplc.do")
    public String saveMypRscInfUseAplc(MultipartHttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {

    	mypRscInfService.saveMypRscInfUseAplc(request);	//활용신청정보 저장

    	redirectAttributes.addFlashAttribute("actMessage", egovMessageSource.getMessage("success.common.insert"));

    	return "redirect:/portal/myp/rsc/inf/viewMypRscInfUse.do";
    }

    /**
   	 * @Method Name : saveMypRscInfInAplc
   	 * @작성일 : 2023. 05. 03.
   	 * @작성자 : bhs
   	 * @Method 설명 :  	반입 신청 저장
   	 * @param : model
   	 * @return :
   	 */
       @RequestMapping(value="saveMypRscInfInAplc.do")
       public String saveMypRscInfInAplc(MultipartHttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {

       	mypRscInfService.saveMypRscInfInAplc(request);	//반입신청정보 저장

       	redirectAttributes.addFlashAttribute("actMessage", egovMessageSource.getMessage("success.common.apply"));

       	return "redirect:/portal/myp/rsc/inf/viewMypRscInfIn.do";
       }

    /**
	 * @Method Name : viewMypRscInfOut
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	반출 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypRscInfOut.do")
    public String viewMypRscInfOut(HttpServletRequest request, HttpServletResponse response, ModelMap model, @ModelAttribute("searchVO") ComDefaultVO comDefaultVO) throws Exception {
    	/** EgovPropertyService.sample */
    	comDefaultVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	comDefaultVO.setPageSize(propertiesService.getInt("pageSize"));

		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(comDefaultVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(comDefaultVO.getPageUnit());
		paginationInfo.setPageSize(comDefaultVO.getPageSize());

    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());
    	paramMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
    	paramMap.put("firstIndex", paginationInfo.getFirstRecordIndex());
    	paramMap.put("aplcProgStcd", "05");		//승인완료
    	paramMap.put("rsrEndYn", "N");		//연구종료여부

    	int totCnt = mypRscInfService.selectMypRscInfAplListTotCnt(paramMap);
		paginationInfo.setTotalRecordCount(totCnt);

    	model.addAttribute("rscInfAplList", mypRscInfService.selectMypRscInfAplList(paramMap));	//나의연구 신청목록 조회
    	model.addAttribute("paginationInfo", paginationInfo);

    	model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회
    	model.addAttribute("viewGbnChk", "viewOut");	//반출화면

    	model.addAttribute("srvyLnk", mypRscInfService.selectSrvyLnk());	//설문조사 링크 조회

    	return "kcure/portal/myp/rsc/ViewMypRscInfOut";
    }

    /**
	 * @Method Name : selectMypRscInfOutList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 목록 조회
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="selectMypRscInfOutList.do")
    public ModelAndView selectMypRscInfOutList(@RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());
    	paramMap.put("rsrAsmtNo", (String)commandMap.get("rsrAsmtNo"));
      	paramMap.put("allListYn", (String)commandMap.get("allListYn"));

      	model.addAttribute("totCnt", mypRscInfService.selectMypRscInfOutListTotCnt(paramMap));
		model.addAttribute(GridVar.gridView, mypRscInfService.selectMypRscInfOutList(paramMap));
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }
    
    /**
	 * @Method Name : viewMypRscInfOutDetail
	 * @작성일 : 2023. 05. 10.
	 * @작성자 : bhs
	 * @Method 설명 :  	반출 신청 상세화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypRscInfOutDetail.do")
    public String viewMypRscInfOutDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
  		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

  		HashMap<String, Object> paramMap = new HashMap<>();
  		paramMap.put("userId", sessionVo.getId());
  		paramMap.put("dataAplcNo", (String)request.getParameter("dataAplcNo"));
  		paramMap.put("rsrAsmtNo", (String)request.getParameter("rsrAsmtNo"));
  		paramMap.put("dttoAplcDt", (String)request.getParameter("dttoAplcDt"));

  		Map<String, Object> aplcInfo = mypRscInfService.selectMypRscInfOutApl(paramMap);	//신청연구정보
  		List<Map<String, Object>> fileList = mypRscInfService.selectMypRscInfTkOutFileList(paramMap);	//반입파일리스트
  		Map<String, Object> srvyInfo =  mypRscInfService.selectSrvyLnk();

  		model.addAttribute("aplcInfo", aplcInfo); //연구기본정보
  		model.addAttribute("fileList", fileList);	 //반출파일리스트
  		
  		model.addAttribute("dttoAplcDt", fileList.get(0).get("dttoAplcDt") + "");	 
  		model.addAttribute("fileUnldYn", fileList.get(0).get("tkotFileUnldYn") + "");	 //반출파일다운로드여부
  		model.addAttribute("srvyLnk", srvyInfo);	//설문조사 링크 조회
  		
  		model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회
  		model.addAttribute("viewGbnChk", "viewOut");

       	return "kcure/portal/myp/rsc/ViewMypRscInfOutDetail";
    }


    /**
   	 * @Method Name : selectMypRscInfIn
   	 * @작성일 : 2023. 05. 04.
   	 * @작성자 : bhs
   	 * @Method 설명 :  반입 신청 내역 조회(반려사유)
   	 * @param : model
   	 * @return :
   	 */
      @ResponseBody
      @RequestMapping(value="selectMypRscInfIn.do")
      public HashMap<String, Object> selectMypRscInfIn(@RequestParam HashMap<String, Object> commandMap) throws Exception {
       	HashMap<String, Object> resultMap = new HashMap<>();

       	List<Map<String, Object>> inInfoList = mypRscInfService.selectMypRscInfIn(commandMap);

       	if (inInfoList != null && inInfoList.size() > 0) {
           	resultMap.put("result", "success");
           	resultMap.put("inInfoList", inInfoList);
       	} else {
           	resultMap.put("result", "nodata");
       	}

       	return resultMap;
     }

    /**
	 * @Method Name : selectMypRscInfOut
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 내역 조회
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectMypRscInfOut.do")
    public HashMap<String, Object> selectMypRscInfOut(@RequestParam HashMap<String, Object> commandMap) throws Exception {
    	HashMap<String, Object> resultMap = new HashMap<>();
    	List<Map<String, Object>> outInfoList = mypRscInfService.selectMypRscInfOut(commandMap);

    	if (outInfoList != null && !outInfoList.isEmpty()) {
        	resultMap.put("result", "success");
        	resultMap.put("outInfoList", outInfoList);
    	} else {
        	resultMap.put("result", "nodata");
    	}

    	return resultMap;
    }

    /**
	 * @Method Name : selectMypRscInfOutFileDown
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  반출 신청 파일 다운로드
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="selectMypRscInfOutFileDown.do")
    public void selectMypRscInfOutFileDown(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dataAplcNo = (String)commandMap.get("dataAplcNo");
		String dttoAplcId = (String)commandMap.get("dttoAplcId");
		String dttoAplcDt = (String)commandMap.get("dttoAplcDt").toString().replaceAll("/", "").substring(0, 8);

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("dataAplcNo", dataAplcNo);
    	paramMap.put("dttoAplcId", dttoAplcId);
    	paramMap.put("dttoAplcDt", dttoAplcDt);

    	List<Map<String, Object>> outFileList = mypRscInfService.selectMypRscInfOutFileList(paramMap);

    	Map<String, Object> outFileInfo = null;
    	String sendFolder = "";
    	String fileName = "";
    	String downFileName = "";

    	if (outFileList.size() > 0) {
    		if (outFileList.size() > 1) {		//N건은 zip으로 받는다

    			OutputStream outputStream = null;
    			InputStream inputStream = null;
    			ZipOutputStream zipOut = null;

    			try {
    				outputStream = new BufferedOutputStream(response.getOutputStream());
					zipOut = new ZipOutputStream(outputStream);

	        		response.setContentType("application/octet-stream");
	        	    response.setHeader("Content-Disposition", "attachment; filename=" +  URLEncoder.encode(dataAplcNo, "utf-8") + ".zip;");

	        	    /* SFTP일 경우 연결 로직을 for문 밖에 놓아도 됨 */
	        	    //SendFtpUtil ftp = new SendFtpUtil();
					//ftp.connect();

					for (int i=0; i < outFileList.size(); i++ ) {
						/* SFTP일 경우 연결 로직은 for문 안에 있어야 함 */
						//ftp 다운방식인 retrieveFileStream가 동시에 2개 이상 처리를 못하기 때문에 FTP를 여러번 연결한다.
						SendFtpUtil ftp = new SendFtpUtil();
						ftp.connect();

						outFileInfo = outFileList.get(i);

	    				sendFolder = (String)outFileInfo.get("attfPthNm");
	    				fileName = (String)outFileInfo.get("attfStrNm");
	    				downFileName = (String)outFileInfo.get("attfNm");

						//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
			    		sendFolder = ftp.chkFolderPath(sendFolder, "N");

			    		inputStream = ftp.downFile(sendFolder, fileName);

						byte[] bytesArray = new byte[1024];
		        		int bytesRead = -1;

		        		ZipEntry zipEntry = new ZipEntry(downFileName);
		    		    zipOut.putNextEntry(zipEntry);

		    		    while ((bytesRead = inputStream.read(bytesArray)) != -1) {
		    		    	zipOut.write(bytesArray, 0, bytesRead);
		                }

		    		    zipOut.closeEntry();

		    		    /* SFTP일 경우 연결 로직은 for문 안에 있어야 함 */
		    		    ftp.disconnect();
					}

					/* SFTP일 경우 연결 로직을 for문 밖에 놓아도 됨 */
					//ftp.disconnect();

					zipOut.close();

        		} catch (Exception e) {
        			e.printStackTrace();
    			} finally {
    				if(zipOut != null) zipOut.close();
    				if(outputStream != null) outputStream.close();
    				if(inputStream != null) inputStream.close();
    			}
    		} else {		//1건은 바로 다운받는다
    			SendFtpUtil ftp = new SendFtpUtil();

    			OutputStream outputStream = null;
    			InputStream inputStream = null;

    			ftp.connect();

    			try {
    				outputStream = new BufferedOutputStream(response.getOutputStream());

    				outFileInfo = outFileList.get(0);

    				sendFolder = (String)outFileInfo.get("attfPthNm");
    				fileName = (String)outFileInfo.get("attfStrNm");
    				downFileName = (String)outFileInfo.get("attfNm");

    				//파일업로드 경로 추출. 조회로직이기 때문에 폴더는 생성하지 않는다.
    	    		sendFolder = ftp.chkFolderPath(sendFolder, "N");

					inputStream = ftp.downFile(sendFolder, fileName);

	                byte[] bytesArray = new byte[4096];
	                int bytesRead = -1;

	        		response.setContentType("application/octet-stream");
	        	    response.setHeader("Content-Disposition", "attachment; filename=" +  URLEncoder.encode(downFileName, "utf-8") + ";");

	                while ((bytesRead = inputStream.read(bytesArray)) != -1) {
	                    outputStream.write(bytesArray, 0, bytesRead);
	                }
        		} catch (Exception e) {
        			e.printStackTrace();
    			} finally {
    				if(outputStream != null) outputStream.close();
    				if(inputStream != null) inputStream.close();
    			}

    			ftp.disconnect();
    		}

    		String userId = "";
    		String ip = "";

    		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        	if(isAuthenticated.booleanValue()) {
    			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    			userId = (user == null || user.getId() == null) ? "" : user.getId();
    		    ip = (user == null || user.getIp() == null) ? "" : user.getIp();
        	}else {
        		ip = commonUtils.getIPFromRequest(request);
        	}

        	String url= request.getRequestURI().replace(request.getContextPath(),"");
        	DataServiceFileVO fileVO = new DataServiceFileVO();
        	fileVO.setAttfPthNm(sendFolder);
        	fileVO.setDataAplcNo(dataAplcNo);
        	fileVO.setAttfNm(downFileName);
        	fileVO.setIp(ip);
        	fileVO.setUserId(userId);
        	fileVO.setMenuUrl(url);
    		dataFileService.addFileLog(fileVO);
    	} else {
    		throw new Exception("첨부파일 없음");
    	}
    }

    /**
	 * @Method Name : viewMypRscInfEnd
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	종료 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypRscInfEnd.do")
    public String viewMypRscInfEnd(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());

    	model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회

    	model.addAttribute("viewGbnChk", "viewEnd");	//종료화면

    	return "kcure/portal/myp/rsc/ViewMypRscInfEnd";
    }

    /**
	 * @Method Name : selectMypRscInfEndList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  종료 목록 조회
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="selectMypRscInfEndList.do")
    public ModelAndView selectMypRscInfEndList(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {
		/** EgovPropertyService.sample */
    	comDefaultVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	comDefaultVO.setPageSize(propertiesService.getInt("pageSize"));

		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(comDefaultVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(comDefaultVO.getPageUnit());
		paginationInfo.setPageSize(comDefaultVO.getPageSize());

		comDefaultVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		comDefaultVO.setLastIndex(paginationInfo.getLastRecordIndex());
		comDefaultVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());
    	paramMap.put("recordCountPerPage", comDefaultVO.getRecordCountPerPage());
    	paramMap.put("firstIndex", comDefaultVO.getFirstIndex());
    	paramMap.put("aplcProgStcd", "05");		//승인완료
    	paramMap.put("rsrEndYn", "Y");		//연구종료여부

		int totCnt = mypRscInfService.selectMypRscInfAplListTotCnt(paramMap);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute(GridVar.gridPage, paginationInfo);
		model.addAttribute(GridVar.gridView, mypRscInfService.selectMypRscInfAplList(paramMap));
    	model.addAttribute("searchVO", comDefaultVO);
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
	 * @Method Name : selectMypRscInfRsrRslt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  연구성과 조회
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectMypRscInfRsrRslt.do")
    public HashMap<String, Object> selectMypRscInfRsrRslt(@RequestParam HashMap<String, Object> commandMap) throws Exception {
    	Map<String, Object> aplcInfo = mypRscInfService.selectMypRscInfAplc(commandMap);	//신청기본정보
    	Map<String, Object> RsrRsltInfo = mypRscInfService.selectMypRscInfRsrRslt(commandMap);

    	HashMap<String, Object> resultMap = new HashMap<>();
    	resultMap.put("aplcInfo", aplcInfo);

    	if (RsrRsltInfo != null && !RsrRsltInfo.isEmpty()) {
        	resultMap.put("result", "success");
        	resultMap.put("RsrRsltInfo", RsrRsltInfo);
    	} else {
        	resultMap.put("result", "nodata");
    	}

    	return resultMap;
    }

    /**
	 * @Method Name : saveMypRscInfRsrRslt
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  연구성과 저장
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="saveMypRscInfRsrRslt.do")
    public HashMap<String, Object> saveMypRscInfRsrRslt(@RequestParam HashMap<String, Object> commandMap) throws Exception {
    	mypRscInfService.saveMypRscInfRsrRslt(commandMap);

    	HashMap<String, Object> resultMap = new HashMap<>();
    	resultMap.put("result", "success");
    	resultMap.put("msg", egovMessageSource.getMessage("success.common.insert"));

    	return resultMap;
    }

    /**
      * @Method Name : selectAplcStpUrl
      * @작성일 : 2023. 4. 6.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	데이터 신청 단계 URL 조회
      *  </p>
      * @param : aplcStpSpcd 신청단계코드
      * @return : 신청단계url
      */
    @ResponseBody
    @RequestMapping(value="selectAplcStpUrl.do")
    public String selectAplcStpUrl(@RequestParam String aplcStpSpcd) throws Exception {

    	String rUrl = "";

    	switch(aplcStpSpcd) {
			case "01":
				rUrl = CommonEnum.DataServiceStep.STEP01.stepUrl();
				break;
			case "02":
				rUrl = CommonEnum.DataServiceStep.STEP02.stepUrl();
				break;
    		case "03":
    			rUrl = CommonEnum.DataServiceStep.STEP03.stepUrl();
    			break;
    		case "04":
    			rUrl = CommonEnum.DataServiceStep.STEP04.stepUrl();
    			break;
    		case "05":
    			rUrl = CommonEnum.DataServiceStep.STEP05.stepUrl();
    			break;
    		case "06":
    			rUrl = CommonEnum.DataServiceStep.STEP06.stepUrl();
    			break;
    	}

    	return rUrl;
    }

    /**
      * @Method Name : deleteSvcDataAplc
      * @작성일 : 2023. 4. 6.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	데이터 신청 삭제
      *  </p>
      * @param : dataAplcNo 신청번호
      * @return :
      */
    @ResponseBody
    @RequestMapping(value="deleteSvcDataAplc.do")
    public ModelAndView deleteSvcDataAplc(@RequestParam String dataAplcNo, ModelMap model) throws Exception {
    	mypRscInfService.deleteSvcDataAplc(dataAplcNo);
    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
      * @Method Name : detailViewMypRsc
      * @작성일 : 2023. 5. 2.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	나의 연구 - 자세히보기
      *  </p>
      * @param : String dataAplcNo
      * @return : String
      */
    @RequestMapping(value="detailViewMypRsc.do")
    public String detailViewMypRsc(@RequestParam String dataAplcNo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());
    	paramMap.put("dataAplcNo", dataAplcNo);
    	model.addAttribute("dataAplcDetail", mypRscInfService.selectDataAplcDetail(paramMap));
    	model.addAttribute("dataPrvdInstList", mypRscInfService.selectDataPrvdInstList(paramMap));

    	model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회
    	model.addAttribute("viewGbnChk", "viewApl");	//신청화면
    	model.addAttribute("pageIndex", request.getParameter("pageIndex"));
    	return "kcure/portal/myp/rsc/DetailViewMypRsc";
    }

    /**
      * @Method Name : detailViewDataPayment
      * @작성일 : 2023. 5. 2.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	연구비 결제
      *  </p>
      * @param :  String dataAplcNo
      * @return : String
      */
    @RequestMapping(value="detailViewDataPayment.do")
    public String detailViewDataPayment(@RequestParam String dataAplcNo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("userId", sessionVo.getId());
    	paramMap.put("dataAplcNo", dataAplcNo);

    	Map<String, Object> dataAplcDetail = mypRscInfService.selectDataAplcDetail(paramMap);
    	model.addAttribute("dataAplcDetail", dataAplcDetail);

    	ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
    	clcInfReserchVo.setDataAplcNo(dataAplcNo);
    	model.addAttribute("dataAplcSmry", clcInfReserchService.selectDataAplcSmry(clcInfReserchVo));	//분석환경 정보

    	model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회
    	model.addAttribute("viewGbnChk", "viewApl");	//신청화면
    	model.addAttribute("pageIndex", request.getParameter("pageIndex"));

    	String pblStlmCmptId = (String)dataAplcDetail.get("pblStlmCmptId");
    	if (EgovStringUtil.isEmpty(pblStlmCmptId)) {
            String buyerName = sessionVo.getName();
            String buyerEmail = sessionVo.getEmail();
            String buyerTel = sessionVo.getUserMbphNo();
            int amt = Integer.parseInt(String.valueOf(dataAplcDetail.get("pblStlmAmt")));
            String goodsName = "연구비";
            String returnUrl = "/portal/myp/rsc/inf/request.do";
        	PaymentReadyVO paymentReadyVo = PaymentHelper.getPaymentReady(dataAplcNo, "", "", "", buyerName, buyerEmail, buyerTel, amt, goodsName, returnUrl, request);
        	model.addAttribute("pay", paymentReadyVo);
    	}

    	return "kcure/portal/myp/rsc/DetailViewDataPayment";
    }

    /**
     * 결제 API 호출 (0원)
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/requestZero.do")
    public String requestZero(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	paymentService.insertPaymentDataAplcZero(request);

        model.addAttribute("success", true);
        model.addAttribute("amt", 0);
        model.addAttribute("errorCode", "");
        model.addAttribute("errorDesc", "");
        model.addAttribute("pageIndex", request.getParameter("pageIndex"));
        model.addAttribute("dataAplcNo", request.getParameter("dataAplcNo"));

        return "kcure/portal/myp/rsc/DetailViewDataPaymentResult";
    }

    /**
     * 결제 API 호출
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/request.do")
    public String request(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	PaymentResultVO resultVO = paymentService.requestPayment(request, PayType.DATA_APLC);
        model.addAttribute("success", resultVO.getSuccess());
        model.addAttribute("amt", resultVO.getPaymentAmount());
        model.addAttribute("errorCode", resultVO.getErrorCode());
        model.addAttribute("errorDesc", resultVO.getErrorDesc());
        model.addAttribute("pageIndex", request.getParameter("pageIndex"));
        model.addAttribute("dataAplcNo", request.getParameter("dataAplcNo"));

        return "kcure/portal/myp/rsc/DetailViewDataPaymentResult";
    }

    /**
     * @Method Name : selectDataAplcRvw
     * @작성일 : 2023. 4. 6.
     * @작성자 : hjjeon
     * @Method 설명 :
     *  <p>
     *  	보완요청, 반려 사유 조회
     *  </p>
     * @param : dataAplcNo 신청번호
     * @return : ModelAndView
     */
   @ResponseBody
   @RequestMapping(value="selectDataAplcRvw.do")
   public ModelAndView selectDataAplcRvw(@RequestParam String dataAplcNo, ModelMap model) throws Exception {
	   model.addAttribute("dataAplcRvw", mypRscInfService.selectDataAplcRvw(dataAplcNo));
	   ModelAndView modelAndView = new ModelAndView("jsonView", model);
	   return modelAndView;
   }

   /**
  * @Method Name : viewMypRscInfExtd
  * @date : 2023. 5. 8.
  * @Method 설명 :
  *  <p>
  *     보관/연장 페이지.
  *  </p>
  * @param :
  * @return :
  */
    @RequestMapping(value="viewMypRscInfExtn.do")
    public String viewMypRscInfExtd(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
   	model.addAttribute("rdrtItemList", clcInfReserchService.selectRdrtItemList());   	
   	

	   	HashMap<String, Object> paramMap = new HashMap<>();
	   	paramMap.put("userId", sessionVo.getId());
	   	model.addAttribute("rscInfNavCnt", mypRscInfService.selectRscInfNavCnt(paramMap));	//나의연구 메뉴별 카운트 조회
	
	   	//보관연장 리스트
	   	List<ExtnVO> extnList = mypRscInfService.selectExtnList(paramMap);
	
	   	model.addAttribute("extnList", extnList);
	   	model.addAttribute("viewGbnChk", "viewExtn");	//보관/연장
	   	model.addAttribute("pageIndex", request.getParameter("pageIndex"));
	
	    ComCdDetailVo comCdVO = new ComCdDetailVo();
	    comCdVO.setGrpCd("VRT_ANLS_DVCE_SPCD");
	   	model.addAttribute("vrtAnlsDvceSpcdList", tagsService.searchCommonCodeDetailList(comCdVO));	//가상화분석도구 공통코드
	
	   	return "kcure/portal/myp/rsc/viewMypRscInfExtn";
    }


    /**
      * @Method Name : viewExtnSubList
      * @date : 2023. 5. 10.
      * @Method 설명 :
      *  <p>	
      *     보관 / 연장 하위 리스트 페이지호출 
      *  </p>
      * @param : 
      * @return :
      */
    @RequestMapping(value="viewExtnSubList.do")
    public String viewExtnSubList(@ModelAttribute("extnVO") ExtnVO extnVO, ModelMap model) throws Exception {
	   	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
	   	model.addAttribute("extnVO", extnVO);
	   	return "kcure/portal/myp/rsc/viewExtnSubList_blankPage";
    }

    //.do
    @RequestMapping(value="/selectExtnSubList.do")
	public ModelAndView selectExtnSubList(@ModelAttribute("extnVO") ExtnVO extnVO,
			ModelMap model) throws Exception{

	    List<HashMap<String, Object>> _map = mypRscInfService.selectExtnSubList(extnVO);
		//int totCnt = Integer.parseInt((String)_map.get("resultCnt"));
		//model.addAttribute(GridVar.gridView, _map.get("resultList"));
	    model.addAttribute(GridVar.gridView, _map);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}

    /**
    * @Method Name : selectExtnPopup
    * @작성일 : 2023. 5. 9.
    * @작성자 : parkgu
    * @Method 설명 :
    *  <p>
    *  	보관/연장 신청 팝업
    *  </p>
    */
    @ResponseBody
    @RequestMapping(value="selectExtnPopup.do")
    public ModelAndView selectExtnPopup(@RequestParam String dataAplcNo, ModelMap model) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	EgovMap map = new EgovMap();
    	map.put("dataAplcNo", dataAplcNo);
    	map.put("userId", sessionVo.getId());
		model.addAttribute("extnPopup", mypRscInfService.selectExtnPopup(map));
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }
    
    /**
      * @Method Name : checkExtdStcdCnt
      * @date : 2023. 5. 10.
      * @Method 설명 :
      *  <p>	
      *      보관/연장 신청 회수 조회
      *  </p>
      * @param : 
      * @return :
      */
    @ResponseBody
    @RequestMapping(value="checkExtdStcdCnt.do")
    public ModelAndView checkExtdStcdCnt(@ModelAttribute("extnVO") ExtnVO extnVO, ModelMap model) throws Exception {
    	model.addAttribute("checkExtdStcdYn", mypRscInfService.checkExtdStcdCnt(extnVO));
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }
    
    
    /**
      * @Method Name : saveReqExit
      * @date : 2023. 5. 12.
      * @Method 설명 :
      *  <p>	
      *     보관연장 신청 저장
      *  </p>
      * @param : 
      * @return :
      */
    @ResponseBody
	@RequestMapping(value = "/saveReqExit.do", method = RequestMethod.POST)
    public ModelAndView saveReqExit(MultipartHttpServletRequest multiRequest, @RequestParam HashMap<String, Object> commandMap) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsonView");
        LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        commandMap.put("userId", sessionVo.getId());
    	mypRscInfService.saveReqExit(commandMap,multiRequest);
        
		return modelAndView;
    }

    /**
    * @Method Name : selectExtnPopup
    * @작성일 : 2023. 5. 10.
    * @작성자 : parkgu
    * @Method 설명 :
    *  <p>
    *  	보관/연장 결제 팝업
    *  </p>
    */
    @ResponseBody
    @RequestMapping(value="selectExtnPayPopup.do")
    public ModelAndView selectExtnPayPopup(HttpServletRequest request, 
    		@RequestParam String dataAplcNo, 
    		@RequestParam String rsrAsmtNo, @RequestParam String extdAplcNo, @RequestParam String extdStcd,
    		ModelMap model) throws Exception {
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	paramMap.put("rsrAsmtNo", rsrAsmtNo);
    	paramMap.put("extdAplcNo", extdAplcNo);
    	Map<String, Object> extnPayPopup = mypRscInfService.selectExtnPayPopup(paramMap);
    	model.addAttribute("extnPayPopup", extnPayPopup);
 	
		//연구신청 제출서류 파일리스트 가져오기
		DataServiceFileVO dataVo = new DataServiceFileVO();
		dataVo.setDataAplcNo(dataAplcNo);
		dataVo.setAttfSpcd("01");
		List<DataServiceFileVO> fileList = clcinf2Service.selectDataServiceFileList(dataVo);
		model.addAttribute("fileList", fileList);
    	
	   	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
	    String buyerName = sessionVo.getName();
	    String buyerEmail = sessionVo.getId(); // getEmail null 리턴하므로 getId로 변경
	    String buyerTel = sessionVo.getUserMbphNo();
	    int amt = Integer.parseInt(String.valueOf(extnPayPopup.get("clncPblStlmAmt")));
	    String goodsName = "보관/연장";
	    String returnUrl = "/portal/myp/rsc/inf/requestExtn.do";
		PaymentReadyVO paymentReadyVo = PaymentHelper.getPaymentReady(dataAplcNo, rsrAsmtNo, extdAplcNo, extdStcd, buyerName, buyerEmail, buyerTel, amt, goodsName, returnUrl, request);
		model.addAttribute("pay", paymentReadyVo);
		
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }

    /**
     * 결제 API 호출 (보관/연장) (0원)
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/requestZeroExtn.do")
    public String requestZeroExtn(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	paymentService.insertPaymentExtdZero(request);
    	
        model.addAttribute("success", true);
        model.addAttribute("amt", 0);
        model.addAttribute("errorCode", "");
        model.addAttribute("errorDesc", "");
        model.addAttribute("pageIndex", request.getParameter("pageIndex"));
        
        return "kcure/portal/myp/rsc/ViewMypRscInfExtnPayPopupResult";
    }

    /**
     * 결제 API 호출 (보관/연장)
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/requestExtn.do")
    public String requestExtn(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	PaymentResultVO resultVO = paymentService.requestPayment(request, PayType.EXTD);
        model.addAttribute("success", resultVO.getSuccess());
        model.addAttribute("amt", resultVO.getPaymentAmount());
        model.addAttribute("errorCode", resultVO.getErrorCode());
        model.addAttribute("errorDesc", resultVO.getErrorDesc());
        model.addAttribute("pageIndex", request.getParameter("pageIndex"));
        
        return "kcure/portal/myp/rsc/ViewMypRscInfExtnPayPopupResult";
    }
}
