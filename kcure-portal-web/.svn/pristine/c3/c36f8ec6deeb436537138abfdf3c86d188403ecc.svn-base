package kcure.portal.sys.dac.rvw.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.dac.clc.inf.service.ClcInfReserchService;
import kcure.portal.dac.clc.inf.service.Clcinf2Service;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchVo;
import kcure.portal.dac.clc.inf.service.impl.ClcInfRspVo;
import kcure.portal.sys.dac.rvw.service.DacRvwAplcDtsService;
import kcure.portal.sys.dac.rvw.service.impl.DacRvwVo;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.dac.rvw.web
  * @FileName : DacRvwAplcDtsController.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : bhs
  * @프로그램 설명 : 데이터 신청 심의관리
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
@RequestMapping("/portal/sys/dac/rvw")
public class DacRvwAplcDtsController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "dacRvwAplcDtsService")
    private DacRvwAplcDtsService dacRvwAplcDtsService;

    @Resource(name = "ClcInfReserchService")
    private ClcInfReserchService clcInfReserchService;
    
    @Resource(name = "clcinf2Service")
	private Clcinf2Service clcinf2Service;
    

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;



    /**
      * @Method Name : viewRevAplcRsch
      * @작성일 : 2023. 3. 14.
      * @작성자 : bhs
      * @Method 설명 : 연구접수/사무국 검토 화면
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewRevAplcRsch.do")
    public String viewRevAplcRsch(@ModelAttribute DacRvwVo dacRvwVo, ModelMap model) throws Exception {
    	//심의 진행정보 조회
    	DacRvwVo basicInfoVo = dacRvwAplcDtsService.selectDetailDataAplcRvw(dacRvwVo);
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		//참여기관 정보
		dacRvwVo.setPrtiId(sessionVo.getPrtiId());
		dacRvwVo.setUserId(sessionVo.getId());
		//현재 진행 단계정보
    	//심의 진행정보 조회
	    List<DacRvwVo> basicInfoList = dacRvwAplcDtsService.selectDetailDataAplcRvwList(dacRvwVo);
	    
	    
    	ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
		clcInfReserchVo.setDataAplcNo(dacRvwVo.getDataAplcNo());
		clcInfReserchVo = clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo);
		
		
		ClcInfRspVo clcInfRspVo = clcinf2Service.selectClcInfRsp(clcInfReserchVo.getDataAplcNo());
		int rspCnt = clcinf2Service.selectClcInfRspCnt(clcInfReserchVo.getDataAplcNo());

		//연구신청 제출서류 파일리스트 가져오기
		DataServiceFileVO dataVo = new DataServiceFileVO();
		dataVo.setDataAplcNo(clcInfReserchVo.getDataAplcNo());
		dataVo.setAttfSpcd("01");
		List<DataServiceFileVO> fileList = clcinf2Service.selectDataServiceFileList(dataVo);

		model.addAttribute("clcInfRspList", clcinf2Service.selectClcInfRspList(clcInfReserchVo.getDataAplcNo()));	//연구자 정보 목록
		model.addAttribute("dataAplcSmry", clcInfReserchService.selectDataAplcSmry(clcInfReserchVo));				//가상화 환경 정보
		model.addAttribute("fileList", fileList);
		model.addAttribute("rspCnt", rspCnt);
		model.addAttribute("clcInfRspVo", clcInfRspVo);
		
		//심의단계정보 조회
    	DacRvwVo stpRvwVo = dacRvwAplcDtsService.selectStpRvw(basicInfoVo);
		model.addAttribute("stpData", stpRvwVo);

		model.addAttribute("isMod", "N");
		model.addAttribute("rchData", clcInfReserchVo);
		model.addAttribute("data", basicInfoVo);
		model.addAttribute("list", basicInfoList);

        return "kcure/portal/sys/dac/rvw/ViewRevAplcRsch";
    }

    /**
     * @Method Name : viewRevPrti
     * @작성일 : 2023. 3. 14.
     * @작성자 : bhs
     * @Method 설명 : 제공기관 심의 화면
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
   @RequestMapping(value="/viewRevPrti.do")
   public String viewRevPrti(@ModelAttribute DacRvwVo dacRvwVo, ModelMap model) throws Exception {
	    //심의 진행정보 조회
	    DacRvwVo basicInfoVo = dacRvwAplcDtsService.selectDetailDataAplcRvw(dacRvwVo);
	    LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		//참여기관 정보
		dacRvwVo.setPrtiId(sessionVo.getPrtiId());
		dacRvwVo.setUserId(sessionVo.getId());
		//현재 진행 단계정보
   	    //심의 진행정보 조회
	    List<DacRvwVo> basicInfoList = dacRvwAplcDtsService.selectDetailDataAplcRvwList(dacRvwVo);
	   	//심의단계정보 조회
	   	DacRvwVo stpRvwVo = dacRvwAplcDtsService.selectStpRvw(basicInfoVo);
	   	ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
		clcInfReserchVo.setDataAplcNo(basicInfoVo.getDataAplcNo());
		ClcInfReserchVo resarchData = clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo);

	   //연구신청 제출서류 파일리스트 가져오기
		DataServiceFileVO dataVo = new DataServiceFileVO();
		dataVo.setDataAplcNo(dacRvwVo.getDataAplcNo());
		dataVo.setAttfSpcd("01");
		List<DataServiceFileVO> fileList = dacRvwAplcDtsService.selectDataServiceFileList(dataVo);

		model.addAttribute("stpData", stpRvwVo);
		model.addAttribute("rchData", resarchData);
		model.addAttribute("data", basicInfoVo);
		model.addAttribute("list", basicInfoList);
		model.addAttribute("fileList", fileList);

       return "kcure/portal/sys/dac/rvw/ViewRevPrti";
   }

    /**
	  * @Method Name : saveRevAplcRsch
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	연구접수/사무국 검토 정보 저장
	  *  </p>
	  * @param :
	  * @return :
	  */
	 @RequestMapping(value="/saveRevAplcRsch.do")
	 public String saveRevAplcRsch(@ModelAttribute DacRvwVo dacRvwVo, ModelMap model) throws Exception {
		 LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		 dacRvwVo.setUserId(sessionVo.getId());
		 dacRvwVo.setPrtiId(sessionVo.getPrtiId());
		 //사무국검토 정보 저장
		 boolean nextYn = dacRvwAplcDtsService.saveRevAplcRsch(dacRvwVo);
		 if(nextYn) {
			 model.addAttribute("dataAplcNo", dacRvwVo.getDataAplcNo());
			 model.addAttribute("rvwStpSpcd", dacRvwVo.getNextSpcd());
			 model.addAttribute("targetStepUrl",  CommonEnum.rvwStpSpcdInfo.valueOfStpSpcdInfo(dacRvwVo.getNextSpcd()).stpUrl());
			 //현재 결재가 모두 끝나지 않았을경우.
		 }else {
			 model.addAttribute("dataAplcNo", dacRvwVo.getDataAplcNo());
			 model.addAttribute("rvwStpSpcd", dacRvwVo.getRvwStpSpcd());
			 model.addAttribute("targetStepUrl",  CommonEnum.rvwStpSpcdInfo.valueOfStpSpcdInfo(dacRvwVo.getRvwStpSpcd()).stpUrl());
		 }
		 

		 return "kcure/portal/sys/dac/rvw/ViewDacRvwStepResult";
	}

	 /**
	  * @Method Name : saveRvwTmplt
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	연구접수/사무국 검토서 저장
	  *  </p>
	  * @param :
	  * @return :
	  */
	@ResponseBody
	@RequestMapping(value = "/saveRvwTmplt.do", method = RequestMethod.POST)
	public ModelAndView saveRvwTmplt(@ModelAttribute DacRvwVo dacRvwVo, Model model) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
	     modelAndView.setViewName("jsonView");

	     try {
		 	 // LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		 	 // dacRvwVo.setUserId(sessionVo.getId());
			 dacRvwVo.setUserId("TEST");

			 if("Y".equals(dacRvwVo.getIsMod())) {
				 dacRvwAplcDtsService.updateRsrAcptAprp(dacRvwVo);
			 }else {
				 dacRvwAplcDtsService.insertRsrAcptAprp(dacRvwVo);
			 }

			 modelAndView.addObject("resultCode", "Y");
			 modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
			 modelAndView.addObject("resultCode", "N");
			 modelAndView.addObject("message", e.getMessage());
			 //e.printStackTrace();
	     }

	     return modelAndView;
	}


   /**
	  * @Method Name : saveRevAplcRsch
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	제공기관 심의 정보 저장
	  *  </p>
	  * @param :
	  * @return :
	  */
	 @RequestMapping(value="/saveRevPrti.do")
	 public String saveRevPrti(@ModelAttribute DacRvwVo dacRvwVo, ModelMap model) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		dacRvwVo.setUserId(sessionVo.getId());
		dacRvwVo.setPrtiId(sessionVo.getPrtiId());

		dacRvwAplcDtsService.saveRevPrti(dacRvwVo);

		model.addAttribute("dataAplcNo", dacRvwVo.getDataAplcNo());
		model.addAttribute("rvwStpSpcd", dacRvwVo.getNextSpcd());
		model.addAttribute("targetStepUrl",  CommonEnum.rvwStpSpcdInfo.valueOfStpSpcdInfo(dacRvwVo.getNextSpcd()).stpUrl());

		return "kcure/portal/sys/dac/rvw/ViewDacRvwStepResult";
	  }


	 /**
	  * @Method Name : saveRvwPrtiTmplt
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	제공기관 심의양식 저장
	  *  </p>
	  * @param :
	  * @return :
	  */
	 @ResponseBody
	 @RequestMapping(value = "/saveRvwPrtiTmplt.do", method = RequestMethod.POST)
	 public ModelAndView saveRvwPrtiTmplt(@ModelAttribute DacRvwVo dacRvwVo, Model model) throws Exception {
		  ModelAndView modelAndView = new ModelAndView();
	      modelAndView.setViewName("jsonView");

	     try {
		 	 LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		 	 dacRvwVo.setUserId(sessionVo.getId());

			 dacRvwAplcDtsService.insertPrvdRvw(dacRvwVo);

			 modelAndView.addObject("resultCode", "Y");
			 modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
			 modelAndView.addObject("resultCode", "N");
			 modelAndView.addObject("message", e.getMessage());
	     }

	     return modelAndView;
	}

	 /**
	  * @Method Name : selectRvwPrtiTmplt
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	데이터결합 검토서 조회
	  *  </p>
	  * @param :
	  * @return :
	  */
	 @ResponseBody
	 @RequestMapping(value = "/selectRvwTmplt.do", method = RequestMethod.POST)
	 public ModelAndView selectRvwTmplt(@ModelAttribute DacRvwVo dacRvwVo, Model model) throws Exception {
		  ModelAndView modelAndView = new ModelAndView();
	      modelAndView.setViewName("jsonView");

	     try {
		 	 LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		 	 dacRvwVo.setUserId(sessionVo.getId());

			 DacRvwVo data = dacRvwAplcDtsService.selectRvwTmplt(dacRvwVo);

			 modelAndView.addObject("resultData", data);
			 modelAndView.addObject("resultCode", "Y");
			 modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
			 modelAndView.addObject("resultCode", "N");
			 modelAndView.addObject("message", e.getMessage());
	     }

	     return modelAndView;
	}

	 /**
	  * @Method Name : selectRvwPrtiTmplt
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>
	  *  	제공기관 심의결과 조회
	  *  </p>
	  * @param :
	  * @return :
	  */
	 @ResponseBody
	 @RequestMapping(value = "/selectRvwPrtiTmplt.do", method = RequestMethod.POST)
	 public ModelAndView selectRvwPrtiTmplt(@ModelAttribute DacRvwVo dacRvwVo, Model model) throws Exception {
		  ModelAndView modelAndView = new ModelAndView();
	      modelAndView.setViewName("jsonView");

	     try {
		 	 LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		 	 dacRvwVo.setUserId(sessionVo.getId());

			 DacRvwVo data = dacRvwAplcDtsService.selectPrvdRvw(dacRvwVo);

			 modelAndView.addObject("resultData", data);
			 modelAndView.addObject("resultCode", "Y");
			 modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
			 modelAndView.addObject("resultCode", "N");
			 modelAndView.addObject("message", e.getMessage());
	     }

	     return modelAndView;
	}


    /**
      * @Method Name : selectRevPrtiList
      * @작성일 : 2023. 3. 14.
      * @작성자 : bhs
      * @Method 설명 : 심의제공기관 목록 조회 (RealGrid)
      *  <p>
      *  </p>
      * @param : DacRvwVo
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectRevPrtiList.do")
	public ModelAndView selectRevPrtiList(@ModelAttribute  DacRvwVo dacRvwVo, ModelMap model) throws Exception {
		List<Map<String,Object>> list = dacRvwAplcDtsService.selectRevPrtiList(dacRvwVo);

		model.addAttribute(GridVar.gridView, list);
	    model.addAttribute("totCnt", list.size());

	    ModelAndView modelAndView = new ModelAndView("jsonView", model);

		return modelAndView;
	}


    /**
      * @Method Name : updateRjcRgst
      * @date : 2023. 5. 2.
      * @Method 설명 :
      *  <p>	
      *     반려, 보완요청 사유 저장. 
      *  </p>
      * @param : 
      * @return :
      */
    @ResponseBody
	@RequestMapping(value = "/updateRjcRgst.do", method = RequestMethod.POST)
    public ModelAndView updateRjcRgst(@ModelAttribute DacRvwVo dacRvwVo, Model model) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
	     modelAndView.setViewName("jsonView"); 
	     try {
	    	 LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
	    	 dacRvwVo.setUserId(sessionVo.getId());

	    	 /* 반려정보 셋팅. */
	    	 dacRvwAplcDtsService.updateRjcRgst(dacRvwVo);

	         modelAndView.addObject("resultCode", "Y");
             modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
	    	 modelAndView.addObject("resultCode", "N");
	         modelAndView.addObject("message", e.getMessage());
	     }

	     return modelAndView;
	}
	
    /**
     * @Method Name : returnRvw
     * @작성일 : 2023. 3. 15.
     * @작성자 : bhs
     * @Method 설명 : 심의반려처리
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return : ModelAndView
     */
    @ResponseBody
	@RequestMapping(value = "/saveRtnRvw.do", method = RequestMethod.POST)
    public ModelAndView saveRtnRvw(@ModelAttribute DacRvwVo dacRvwVo, Model model) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
	     modelAndView.setViewName("jsonView"); 
	     try {
	    	 LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
	    	 dacRvwVo.setUserId(sessionVo.getId());

	    	//반려상태
	    	 dacRvwVo.setRvwStpStcd(CommonEnum.RvwStpStcd.STCDRP03.getStcd());
	    	 dacRvwVo.setAplcProgStcd(CommonEnum.AplcProgStcd.STCD04.aplcProgStcd());
	    	 /* 반려정보 셋팅. */
	    	 dacRvwAplcDtsService.updateDacRvwStat(dacRvwVo);

	         modelAndView.addObject("resultCode", "Y");
             modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
	    	 modelAndView.addObject("resultCode", "N");
	         modelAndView.addObject("message", e.getMessage());
	     }

	     return modelAndView;
	}

    /**
     * @Method Name : selectRjcRsnContView
     * @작성일 : 2023. 3. 15.
     * @작성자 : bhs
     * @Method 설명 : 반려사유조회
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return : ModelAndView
     */
    @ResponseBody
	@RequestMapping(value = "/selectRjcRsnContView.do", method = RequestMethod.POST)
    public ModelAndView selectRjcRsnContView(@ModelAttribute DacRvwVo dacRvwVo, Model model) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
	     modelAndView.setViewName("jsonView");

	     try {
	    	 DacRvwVo rjcContData = dacRvwAplcDtsService.selectRjcRsnContView(dacRvwVo);

	    	 modelAndView.addObject("data", rjcContData);
	         modelAndView.addObject("resultCode", "Y");
             modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
	    	 modelAndView.addObject("resultCode", "N");
	         modelAndView.addObject("message", e.getMessage());
	     }

	     return modelAndView;
	}

    /**
     * @Method Name : selectAcptAprpCnt
     * @작성일 : 2023. 3. 15.
     * @작성자 : bhs
     * @Method 설명 : 연구접수 검토서 제출여부 조회
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return : ModelAndView
     */
    @ResponseBody
	@RequestMapping(value = "/selectAcptAprpCnt.do", method = RequestMethod.POST)
    public ModelAndView selectAcptAprpCnt(@ModelAttribute DacRvwVo dacRvwVo, Model model) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
	     modelAndView.setViewName("jsonView");

	     try {
	    	 int resultCnt = dacRvwAplcDtsService.selectAcptAprpCnt(dacRvwVo);

	    	 modelAndView.addObject("data", resultCnt);
	         modelAndView.addObject("resultCode", "Y");
             modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
	    	 modelAndView.addObject("resultCode", "N");
	         modelAndView.addObject("message", e.getMessage());
	     }

	     return modelAndView;
	}

    /**
     * @Method Name :  saveAprRvw
     * @작성일 : 2023. 3. 15.
     * @작성자 : bhs
     * @Method 설명 : 심의승인처리
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return : ModelAndView
     */
    @ResponseBody
	@RequestMapping(value = "/saveAprvRvw.do", method = RequestMethod.POST)
    public ModelAndView saveAprvRvw(@ModelAttribute DacRvwVo dacRvwVo, Model model) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
	     modelAndView.setViewName("jsonView");

	     try {
	    	 LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		     dacRvwVo.setUserId(sessionVo.getId());

	    	 dacRvwVo.setRvwStpStcd("RP02"); //승인상태
	    	 dacRvwAplcDtsService.updateDacRvwStat(dacRvwVo);

	         modelAndView.addObject("resultCode", "Y");
             modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
	    	 modelAndView.addObject("resultCode", "N");
	         modelAndView.addObject("message", e.getMessage());
	     }

	     return modelAndView;
	}

    /**
     * @Method Name :  selectPrvdRvw
     * @작성일 : 2023. 3. 15.
     * @작성자 : bhs
     * @Method 설명 : 제공기관 심의결과 조회 [레이어팝업]
     *  <p>
     *  </p>
     * @param : DacRvwVo
     * @return : ModelAndView
     */
    @ResponseBody
	@RequestMapping(value = "/selectPrvdRvw.do", method = RequestMethod.POST)
    public ModelAndView selectPrvdRvw(@ModelAttribute DacRvwVo dacRvwVo, Model model) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
	     modelAndView.setViewName("jsonView");

	     try {
	    	 DacRvwVo data = dacRvwAplcDtsService.selectPrvdRvw(dacRvwVo);

	    	 modelAndView.addObject("data", data);
	         modelAndView.addObject("resultCode", "Y");
             modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
	    	 modelAndView.addObject("resultCode", "N");
	         modelAndView.addObject("message", e.getMessage());
	     }

	     return modelAndView;
	}

    /**
     * @Method Name :  viewSendPay
     * @작성일 : 2023. 4. 26.
     * @작성자 : parkgu
     * @Method 설명 : 연구접수 최종금액전송 화면
     *  <p>
     *  </p>
     * @param :
     * @return : String
     */
    @RequestMapping(value="/viewSendPay.do")
    public String viewSendPay(@ModelAttribute DacRvwVo dacRvwVo, ModelMap model) throws Exception {
    	//심의 진행정보 조회
	    DacRvwVo basicInfoVo = dacRvwAplcDtsService.selectDetailDataAplcRvw(dacRvwVo);
   	    //심의 진행정보 조회
	    List<DacRvwVo> basicInfoList = dacRvwAplcDtsService.selectDetailDataAplcRvwList(dacRvwVo);
	   	//심의단계정보 조회
	   	DacRvwVo stpRvwVo = dacRvwAplcDtsService.selectStpRvw(basicInfoVo);
	   	ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
		clcInfReserchVo.setDataAplcNo(dacRvwVo.getDataAplcNo());
		ClcInfReserchVo resarchData = clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo);

		model.addAttribute("stpData", stpRvwVo);
		model.addAttribute("rchData", resarchData);
		model.addAttribute("basicData", basicInfoVo);
		model.addAttribute("list", basicInfoList);

    	Map<String, Object> data = dacRvwAplcDtsService.selectDetailDataAplcSendPay(dacRvwVo);
		model.addAttribute("data", data);

        return "kcure/portal/sys/dac/rvw/ViewSendPay";
    }

    /**
	 * @Method Name : updateClcInfPblAmt
	 *  @작성일 : 2023. 4. 26.
	 * @작성자 : parkgu
	 * @Method 설명 : 연구접수 최종금액전송 저장
	 * @param :
	 * @return :
	 */
	@RequestMapping(value="/updateClcInfPblAmt.do")
	public String updateClcInfPblAmt(@ModelAttribute DacRvwVo dacRvwVo, ModelMap model) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		dacRvwVo.setUserId(sessionVo.getId());
		dacRvwVo.setPrtiId(sessionVo.getPrtiId());
		dacRvwAplcDtsService.updateClcInfPblAmt(dacRvwVo);
		model.addAttribute("dataAplcNo", dacRvwVo.getDataAplcNo());
		model.addAttribute("rvwStpSpcd", dacRvwVo.getNextSpcd());
		model.addAttribute("targetStepUrl",  CommonEnum.rvwStpSpcdInfo.valueOfStpSpcdInfo(dacRvwVo.getNextSpcd()).stpUrl());
		return "kcure/portal/sys/dac/rvw/ViewDacRvwStepResult";
	}
	
	
	
		
    /**
      * @Method Name : splmntReq
      * @date : 2023. 5. 2.
      * @Method 설명 :
      *  <p>	
      *     보완요청 
      *  </p>
      * @param : 
      * @return :
      */
    @ResponseBody
	@RequestMapping(value = "/splmntReq.do", method = RequestMethod.POST)
    public ModelAndView splmntReq(@ModelAttribute DacRvwVo dacRvwVo, Model model) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
	     modelAndView.setViewName("jsonView");

	     try {
	    	 LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		     dacRvwVo.setUserId(sessionVo.getId());
		     dacRvwVo.setRvwStpStcd(CommonEnum.RvwStpStcd.STCDRP04.getStcd());
	    	 dacRvwVo.setAplcProgStcd(CommonEnum.AplcProgStcd.STCD06.aplcProgStcd());

	    	 dacRvwAplcDtsService.updateSplmntReq(dacRvwVo);

	         modelAndView.addObject("resultCode", "Y");
             modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
	    	 modelAndView.addObject("resultCode", "N");
	         modelAndView.addObject("message", e.getMessage());
	     }

	     return modelAndView;
	}
}
