package kcure.portal.dac.clc.inf.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.access.service.EgovUserDetailsHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.CommonEnum.DataServiceStep;
import kcure.portal.cmn.service.DataServiceFileVO;
import kcure.portal.cmn.service.KcureDadaServiceFileMngUtil;
import kcure.portal.cmn.tags.service.TagsService;
import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.dac.clc.inf.service.ClcInfReserchService;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchVo;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.dac.clc.inf.web
  * @FileName : ClcInfController.java
  * @since : 2023. 2. 20.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	데이터활용 신청 - 임상 신청하기(01,02단계)
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
@RequestMapping("/portal/dac/clc/inf")
public class ClcInfController {

	@Resource(name = "TagsService")
	private TagsService tagsService;

	@Resource(name = "ClcInfReserchService")
    private ClcInfReserchService clcInfReserchService;

	@Resource(name = "KcureDadaServiceFileMngUtil")
    private KcureDadaServiceFileMngUtil fileMngUtil;

    /**
      * @Method Name : viewClcInfSummary
      * @작성일 : 2023. 2. 20.
      * @작성자 : hjjeon
      * @Method 설명 : 임상 개요 화면
      *  <p>
      *  </p>
      * @param :
      * @return : string
      */
    @RequestMapping(value="/viewClcInfSummary.do")
    public String viewClcInfSummary() throws Exception {
        return "kcure/portal/dac/clc/inf/ViewClcInfSummary";
    }
    
   
    /**
      * @Method Name : viewClcInfTermAgree
      * @작성일 : 2023. 2. 20.
      * @작성자 : hjjeon
      * @Method 설명 : 임상 신청 약관 동의 화면
      *  <p>
      *  </p>
      * @param : ClcInfReserchVo clcInfReserchVo
      * @return : String
      */
    @RequestMapping(value="/viewClcInfTermAgree.do")
    public String viewClcInfTermAgree(@ModelAttribute("searchVO") ClcInfReserchVo clcInfReserchVo, ModelMap model) throws Exception {
    	model.addAttribute("clcInfReserchVo", clcInfReserchVo);
    	return "kcure/portal/dac/clc/inf/ViewClcInfTermAgree";
    }

    /**
      * @Method Name : saveSvcDataAplc
      * @작성일 : 2023. 2. 24.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	데이터 신청
      *  </p>
      * @param : ClcInfReserchVo clcInfReserchVo
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveSvcDataAplc.do")
    public ModelAndView saveSvcDataAplc(@ModelAttribute("searchVO") ClcInfReserchVo clcInfReserchVo, ModelMap model) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		clcInfReserchVo.setUserId(sessionVo.getId());
		clcInfReserchVo.setPrtiId(sessionVo.getPrtiId());	//참여기관ID
		if(CommonUtils.empty(clcInfReserchVo.getDataAplcNo())) {
			//저장
			clcInfReserchVo.setDataAplcNo(clcInfReserchService.insertClcInfReserch(clcInfReserchVo));
		}

    	model.addAttribute("clcInfReserchVo", clcInfReserchVo);
    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
      * @Method Name : viewClcInfReserchSummary
      * @작성일 : 2023. 4. 18.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	신청서류 작성
      *  </p>
      * @param : ClcInfReserchVo clcInfReserchVo
      * @return : ModelAndView
      */
    @RequestMapping(value="/viewClcInfReserchSummary.do")
    public String viewClcInfReserchSummary(@ModelAttribute("searchVO") ClcInfReserchVo clcInfReserchVo, ModelMap model) throws Exception {

    	if(!CommonUtils.empty(clcInfReserchVo.getDataAplcNo())) {
			clcInfReserchVo = clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo);
			DataServiceFileVO selectFileVo =  new DataServiceFileVO();

			selectFileVo.setDataAplcNo(clcInfReserchVo.getDataAplcNo());
			selectFileVo.setAttfSpcd(CommonEnum.DataAttfSpcd.ATTFSPCD01.attfSpcd());

			selectFileVo.setAttdNmSpcd(CommonEnum.attNmSpcdInfo.ATTNMSPCD04.attNmSpcd());
			model.addAttribute("clcInfFile04", fileMngUtil.selectFileOne(selectFileVo));

			selectFileVo.setAttdNmSpcd(CommonEnum.attNmSpcdInfo.ATTNMSPCD12.attNmSpcd());
			model.addAttribute("clcInfFile12", fileMngUtil.selectFileOne(selectFileVo));

			selectFileVo.setAttdNmSpcd(CommonEnum.attNmSpcdInfo.ATTNMSPCD13.attNmSpcd());
			model.addAttribute("clcInfFile13", fileMngUtil.selectFileOne(selectFileVo));

			model.addAttribute("dataAplcSmry", clcInfReserchService.selectDataAplcSmry(clcInfReserchVo));
		}
    	model.addAttribute("clcInfReserchVo", clcInfReserchVo);

    	model.addAttribute("naviDataAplcNo", clcInfReserchVo.dataAplcNo);
    	model.addAttribute("naviStepCd", clcInfReserchVo.aplcStpSpcd);
    	model.addAttribute("naviUrlsByStepCd", DataServiceStep.getUrlsByStepCd());
    	model.addAttribute("rdrtItemList", clcInfReserchService.selectRdrtItemList());
	    ComCdDetailVo comCdVO = new ComCdDetailVo();
	    comCdVO.setGrpCd("VRT_ANLS_DVCE_SPCD");
	    model.addAttribute("vrtAnlsDvceSpcdList", tagsService.searchCommonCodeDetailList(comCdVO));	//가상화분석도구 공통코드
    	return "kcure/portal/dac/clc/inf/ViewClcInfReserchSummary";
    }

	/**
	  * @Method Name : saveClcInfReserch01
	  * @작성일 : 2023. 4. 18.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 1단계 저장
	  *  </p>
	  * @param : MultipartHttpServletRequest multiRequest
	  * 		ClcInfReserchVo clcInfReserchVo
	  * @return : String returnURL
	  */
	@RequestMapping(value = "/saveClcInfReserch01.do")
	public String saveClcInfReserch01(final MultipartHttpServletRequest multiRequest,@ModelAttribute("clcInfReserchVo") ClcInfReserchVo clcInfReserchVo, HttpServletRequest request, ModelMap model) throws Exception {

		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		clcInfReserchVo.setUserId(sessionVo.getId());
		clcInfReserchVo.setPrtiId(sessionVo.getPrtiId());	//참여기관ID

		clcInfReserchService.updateClcInfReserch01(clcInfReserchVo);

		//성공시
		model.addAttribute("dataAplcNo", clcInfReserchVo.getDataAplcNo());
		if("01".equals(clcInfReserchVo.getSaveGb())) {
			model.addAttribute("resultMessage", "임시저장 되었습니다.");
			model.addAttribute("targetStepUrl", CommonEnum.DataServiceStep.STEP01.stepUrl());		//해당페이지로
			//model.addAttribute("targetStepUrl", "/portal/myp/rsc/inf/viewMypRscInfApl.do");		//마이페이지로
		}else {
			model.addAttribute("targetStepUrl", CommonEnum.DataServiceStep.STEP02.stepUrl());	//분석환경선택화면으로 이동
		}
		return "kcure/portal/dac/clc/inf/ViewClcInfStepResult";
	}
}
