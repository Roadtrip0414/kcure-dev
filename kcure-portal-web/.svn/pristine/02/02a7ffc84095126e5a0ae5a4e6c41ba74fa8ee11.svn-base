package kcure.portal.dac.clc.inf.web;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.access.service.EgovUserDetailsHelper;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.CommonEnum;
import kcure.portal.cmn.CommonEnum.DataServiceStep;
import kcure.portal.cmn.CommonEnum.RsrpSpcd;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.cmn.service.KcureDadaServiceFileMngUtil;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.dac.clc.inf.service.ClcInfReserchService;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchVo;
import kcure.portal.dac.clc.inf.service.impl.ClcInfRspVo;

@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/dac/clc/inf")
public class ClcInfReserchController {

	@Resource(name = "ClcInfReserchService")
    private ClcInfReserchService clcInfReserchService;

	@Resource(name = "KcureDadaServiceFileMngUtil")
    private KcureDadaServiceFileMngUtil fileMngUtil;


	/**
	  * @Method Name : viewClcInfSummary
	  * @작성일 : 2023. 2. 21.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *   연구정보
	  *  </p>
	  * @param :
	  * @return : 연구정보 페이지
	  *  /portal/dac/clc/inf/viewClcInfReserch.do
	  */
	@RequestMapping(value="/viewClcInfReserch.do")
    public String viewClcInfReserch(@ModelAttribute("clcInfReserchVo") ClcInfReserchVo clcInfReserchVo, ModelMap model) throws Exception {
		if(!CommonUtils.empty(clcInfReserchVo.getDataAplcNo())) {
			clcInfReserchVo = clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo);
		}
		model.addAttribute("clcInfReserchVo", clcInfReserchVo);

		model.addAttribute("naviDataAplcNo", clcInfReserchVo.dataAplcNo);
		model.addAttribute("naviStepCd", clcInfReserchVo.aplcStpSpcd);
	    model.addAttribute("naviUrlsByStepCd", DataServiceStep.getUrlsByStepCd());

        return "kcure/portal/dac/clc/inf/ViewClcInfReserch";
    }



	/**
	  * @Method Name : saveClcInfReserch
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	연구정보 저장
	  *  </p>
	  * @param : ClcInfReserchVo 연구정보
	  * @param : 파일다수
	  * @return :
	  */
	@RequestMapping(value = "/saveClcInfReserch.do")
	public String saveClcInfReserch(final MultipartHttpServletRequest multiRequest,@ModelAttribute("clcInfReserchVo") ClcInfReserchVo clcInfReserchVo, HttpServletRequest request, ModelMap model) throws Exception {

		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		clcInfReserchVo.setUserId(sessionVo.getId());
		clcInfReserchVo.setPrtiId(sessionVo.getPrtiId());	//참여기관ID
		//null 이면 insert
		/*
		if(CommonUtils.empty(clcInfReserchVo.getDataAplcNo())) {
			String dataAplcNo = clcInfReserchService.insertClcInfReserch(clcInfReserchVo);
			clcInfReserchVo.setDataAplcNo(dataAplcNo);
		//id 가 존재하면 update
		}else {
			clcInfReserchService.updateClcInfReserch(clcInfReserchVo);
		}
		*/

		clcInfReserchService.updateClcInfReserch(clcInfReserchVo);

		//성공시
		model.addAttribute("dataAplcNo", clcInfReserchVo.getDataAplcNo());
		if ("01".equals(clcInfReserchVo.getSaveGb())) {
			model.addAttribute("resultMessage", "임시저장 되었습니다.");
			model.addAttribute("targetStepUrl", CommonEnum.DataServiceStep.STEP02.stepUrl());
			//model.addAttribute("targetStepUrl", "/portal/myp/rsc/inf/viewMypRscInfApl.do");		//마이페이지로
		} else {
			model.addAttribute("targetStepUrl", CommonEnum.DataServiceStep.STEP03.stepUrl());
		}
		return "kcure/portal/dac/clc/inf/ViewClcInfStepResult";
	}

	/**
	  * @Method Name : viewClcInfRsp
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	연구자 정보 등록
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value="/viewClcInfRsp.do")
    public String viewClcInfRsp(@ModelAttribute("clcInfRspVo") ClcInfRspVo clcInfRspVo, ModelMap model) throws Exception {
		ClcInfRspVo rspRequestVo = null;
		ClcInfRspVo rspResponseVo = null;
		List<ClcInfRspVo> rspVoList = new ArrayList<ClcInfRspVo>();

		List<ClcInfRspVo> rspVoListAll = clcInfReserchService.selectClcInfRsp(clcInfRspVo);
		for (ClcInfRspVo vo : rspVoListAll) {
			vo.setActionType("update");
			if (vo.rsrAplpYn.equals("Y")) {
				rspRequestVo = vo;
			} else {
				if (vo.rsrpSpcd.equals(RsrpSpcd.SPCD02.spcd())) {
					rspResponseVo = vo;
				} else {
					rspVoList.add(vo);
				}
			}
		}

		if (rspRequestVo == null) {
			 rspRequestVo  = new ClcInfRspVo();
			 LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			 rspRequestVo.setActionType("insert");
			 rspRequestVo.setRsrAplpYn("Y");
			 rspRequestVo.setRsrpSpcd(RsrpSpcd.SPCD01.spcd());
			 rspRequestVo.setAplcStpSpcd(DataServiceStep.STEP03.stepCd());
			 rspRequestVo.setRsrpId(sessionVo.getId());
			 rspRequestVo.setRsrpNm(sessionVo.getName());
			 String[] userMbphNo = CommonUtils.phone_format(sessionVo.getUserMbphNo()).split("-");
			 rspRequestVo.setUserMbphNo1(userMbphNo[0]);
			 rspRequestVo.setUserMbphNo2(userMbphNo[1]);
			 rspRequestVo.setUserMbphNo3(userMbphNo[2]);
			 rspRequestVo.setEmail(sessionVo.getId());
		}

		model.addAttribute("rspRequestVo", rspRequestVo);
		model.addAttribute("rspResponseVo", rspResponseVo);
		model.addAttribute("rspVoList", rspVoList);

		List<Map<String,String>> prtiList = clcInfReserchService.getPrtiList("");
		model.addAttribute("prtiList", prtiList);

		model.addAttribute("naviDataAplcNo", clcInfRspVo.dataAplcNo);
		model.addAttribute("naviStepCd", rspRequestVo.aplcStpSpcd);
	    model.addAttribute("naviUrlsByStepCd", DataServiceStep.getUrlsByStepCd());
	    
	    if(!CommonUtils.empty(clcInfRspVo.getDataAplcNo())) {
	    	ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();
	    	clcInfReserchVo.setDataAplcNo(clcInfRspVo.getDataAplcNo());
	    	model.addAttribute("clcInfReserchVo", clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo));
		}
		

        return "kcure/portal/dac/clc/inf/ViewClcInfRsp";
    }


	/**
	  * @Method Name : saveClcInfRsp
	  * @작성일 : 2023. 2. 27.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	연구자 정보 저장
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value="/saveClcInfRsp.do")
    public ResponseEntity<Map<String, String>> saveClcInfRsp(final MultipartHttpServletRequest multiRequest,@ModelAttribute ClcInfRspVo clcInfRspVo, ModelMap model) throws Exception {

		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		clcInfRspVo.setUserId(sessionVo.getId());
		clcInfReserchService.saveClcInfRsp(clcInfRspVo,multiRequest);
		//성공시
		Map<String, String> map = new HashMap<String, String>();
		map.put("dataAplcNo", clcInfRspVo.getDataAplcNo());

		if ("01".equals(clcInfRspVo.getSaveGb())) {
			//map.put("targetStepUrl", "/portal/myp/rsc/inf/viewMypRscInfApl.do");		//마이페이지로
			map.put("resultMessage", "임시저장 되었습니다.");
			map.put("targetStepUrl", CommonEnum.DataServiceStep.STEP03.stepUrl());
		} else {
			map.put("targetStepUrl", CommonEnum.DataServiceStep.STEP04.stepUrl());
		}

		return ResponseEntity.ok(map);
    }

	/**
	  * @Method Name : getPrtiList
	  * @작성일 : 2023. 2. 27.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	소속기관 리스트 검색
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping("/getPrtiList.do")
	public ModelAndView getPrtiList(@RequestParam("inst_cls_spcd") String instClsSpcd,HttpServletRequest request, ModelMap model) throws Exception {
		List<Map<String,String>> prtiList = clcInfReserchService.getPrtiList(instClsSpcd);
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("prtiList", prtiList);
		return mav;
    }


//
	/**
	  * @Method Name : selectUserPopUp
	  * @작성일 : 2023. 2. 27.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	사용자 검색 팝업창 ( 임시 ) : 디자인 퍼블 작업후 수정
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value="/selectUserPopUp.do")
    public String selectUserPopUp(@ModelAttribute("schLoginVO") LoginVO schLoginVO, ModelMap model) throws Exception {
		List<LoginVO> schUserList = clcInfReserchService.selectUserPopUp(schLoginVO);
		model.addAttribute("schUserList", schUserList);
        return "kcure/portal/dac/clc/inf/ViewSchUserPopup";
    }


	 @RequestMapping(value="/userPopup.do")
	    public String userPopup() throws Exception {
		 return "kcure/portal/dac/clc/inf/ViewSchUserPopup";
	    }

    @RequestMapping(value="/selectUserList.do")
    public ModelAndView selectUserList(@ModelAttribute("schLoginVO") LoginVO schLoginVO, ModelMap model) throws Exception {
        model.addAttribute(GridVar.gridView, clcInfReserchService.selectUserPopUp(schLoginVO));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

	@RequestMapping(value="/userSch.do")
    public ModelAndView userSch(@ModelAttribute("schLoginVO") LoginVO schLoginVO, ModelMap model) throws Exception {
		List<LoginVO> schUserList = clcInfReserchService.selectUserPopUp(schLoginVO);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		modelAndView.addObject("schUserList", schUserList);
		return modelAndView;
    }

}
