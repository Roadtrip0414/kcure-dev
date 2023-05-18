package kcure.portal.sys.dac.rvw.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import kcure.portal.bbs.ntc.service.impl.NtcVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.cmn.tags.service.TagsService;
import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;
import kcure.portal.cmn.util.CommonUtils;
import kcure.portal.dac.clc.inf.service.ClcInfReserchService;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchVo;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.dac.rvw.service.DacRvwAplcDtsService;
import kcure.portal.sys.dac.rvw.service.DacRvwDataPrvdService;
import kcure.portal.sys.dac.rvw.service.impl.DacRvwDataPrvdVo;
import kcure.portal.sys.dac.rvw.service.impl.DacRvwVo;
import kcure.portal.sys.log.ulg.service.UserActionLog;

import org.egovframe.rte.fdl.access.service.EgovUserDetailsHelper;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;



 /**
  * @Project : kcure-portal-web
  * @package_name  : kcure.portal.sys.dac.rvw.web
  * @FileName : DacRvwDataPrvdController.java
  * @since : 2023. 3. 15. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 데이터신청 심의 데이터 제공 	
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  2023. 3. 15.       shpark        최초 생성
  *  </pre>
  */
@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/sys/dac/rvw")
public class DacRvwDataPrvdController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    @Resource(name="DacRvwDataPrvdService")
    DacRvwDataPrvdService dacRvwDataPrvdService;
    
    @Resource(name="TagsService")
    TagsService tagsService;
    
    @Resource(name = "ClcInfReserchService")
    private ClcInfReserchService clcInfReserchService;
    

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Resource(name = "dacRvwAplcDtsService")
    private DacRvwAplcDtsService dacRvwAplcDtsService;

    /**
      * @Method Name : viewAuthorManage
      * @작성일 : 2023. 3. 10.
      * @작성자 : parkgu
      * @Method 설명 : 기관 심의자 목록
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewDataPrvd.do")
    public String viewDataPrvd(@ModelAttribute("dacRvwDataPrvdVo") DacRvwDataPrvdVo dacRvwDataPrvdVo, ModelMap model) throws Exception {
       	
    	if(CommonUtils.empty(dacRvwDataPrvdVo.getDataAplcNo())) {
    		dacRvwDataPrvdVo.setDataAplcNo("M0000-APLC-20230209-001");
    	}
    	
    	//신청정보 검색
    	ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();   
    	clcInfReserchVo.setDataAplcNo(dacRvwDataPrvdVo.getDataAplcNo());
    	clcInfReserchVo = clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo);
    	DacRvwVo dacRvwVo = new DacRvwVo();
    	dacRvwVo.setDataAplcNo(dacRvwDataPrvdVo.getDataAplcNo());
    	
    	
    	//심의 진행정보 조회
    	DacRvwVo basicInfoVo = dacRvwAplcDtsService.selectDetailDataAplcRvw(dacRvwVo);
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		//참여기관 정보
		dacRvwVo.setPrtiId(sessionVo.getPrtiId());
		dacRvwVo.setUserId(sessionVo.getId());
		//현재 진행 단계정보
		dacRvwVo.setRvwStpSpcd(basicInfoVo.getRvwStpSpcd());
    	
    	
    	System.out.println("-------------------------------===============-----------------------------------");
    	System.out.println("-------------------------------===============-----------------------------------");
    	System.out.println("-------------------------------===============-----------------------------------");
    	System.out.println("-------------------------------===============-----------------------------------");
    	System.out.println(basicInfoVo.toString());
    	System.out.println("-------------------------------===============-----------------------------------");
    	System.out.println("-------------------------------===============-----------------------------------");
    	System.out.println("-------------------------------===============-----------------------------------");
    	 //심의 진행정보 조회
	    List<DacRvwVo> basicInfoList = dacRvwAplcDtsService.selectDetailDataAplcRvwList(dacRvwVo);
	    
    	model.addAttribute("clcInfReserchVo", clcInfReserchVo);
    	model.addAttribute("dacRvwDataPrvdVo", dacRvwDataPrvdVo);
    	model.addAttribute("data", basicInfoVo);
    	model.addAttribute("list", basicInfoList);
        return "kcure/portal/sys/dac/rvw/ViewDataPrvd";
    }
    
    
    /**
      * @Method Name : selectDataPrvd
      * @작성일 : 2023. 3. 15.
      * @작성자 : shpark
      * @Method 설명 :
      *  <p>	
      *  </p>
      * @param : 
      * @return :
      */
    @RequestMapping(value="/selectDataPrvd.do")
    public ModelAndView selectDataPrvd(@ModelAttribute("dacRvwDataPrvdVo") DacRvwDataPrvdVo dacRvwDataPrvdVo,ModelMap model) throws Exception {    	
		//LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser(); DacRvwDataPrvdVo
    	System.out.println(dacRvwDataPrvdVo.toString());
    	model.addAttribute(GridVar.gridView, dacRvwDataPrvdService.selectDataPrvd(dacRvwDataPrvdVo));
    	
    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }
    
    
    
    /**
      * @Method Name : getComboStepCd
      * @작성일 : 2023. 3. 16.
      * @작성자 : shpark
      * @Method 설명 :
      *  <p>	
      *  	심의 공통 코드 검색
      *  </p>
      * @param : 
      * @return :
      */
    @ResponseBody
	@RequestMapping(value = "/getComboStepCd.do")
	public List<ComCdDetailVo>   getComboStepCd( @ModelAttribute("comCdDetailVo") ComCdDetailVo comCdDetailVo,ModelMap model) throws Exception {
		return tagsService.searchCommonCodeDetailList(comCdDetailVo);
	}
    
    
     // 
    /**
      * @Method Name : saveDataPrvd
      * @date : 2023. 4. 28.
      * @Method 설명 :
      *  <p>	
      *     데이터 제공 상태저장
      *  </p>
      * @param : 
      * @return :
      */
    @RequestMapping(value = "/saveDataPrvd.do")
	public ModelAndView saveDataPrvd(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
    	//targetRvwStpStcd
		DacRvwDataPrvdVo[] insertDataList = gridParameterMap.getUpdate(DacRvwDataPrvdVo.class);
		dacRvwDataPrvdService.saveDataPrvd(insertDataList);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}
    
	/**
	 * @Method Name : viewAuthorManage
	 * @작성일 : 2023. 3. 10.
	 * @작성자 : parkgu
	 * @Method 설명 : 기관 심의자 목록
	 *  <p>
	 *  </p>
	 * @param :
	 * @return : String
	 */
	@RequestMapping(value="/viewDataPrvdCmbn.do")
	public String viewDataPrvdCmbn(@ModelAttribute("dacRvwDataPrvdVo") DacRvwDataPrvdVo dacRvwDataPrvdVo, ModelMap model) throws Exception {
		
		
		//신청정보 검색
		ClcInfReserchVo clcInfReserchVo = new ClcInfReserchVo();	
		clcInfReserchVo.setDataAplcNo(dacRvwDataPrvdVo.getDataAplcNo());
		clcInfReserchVo = clcInfReserchService.selectDetailClcInfReserch(clcInfReserchVo);
		DacRvwVo dacRvwVo = new DacRvwVo();
		dacRvwVo.setDataAplcNo(dacRvwDataPrvdVo.getDataAplcNo());		
		//심의 진행정보 조회
		DacRvwVo basicInfoVo = dacRvwAplcDtsService.selectDetailDataAplcRvw(dacRvwVo);
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		//참여기관 정보
		dacRvwVo.setPrtiId(sessionVo.getPrtiId());
		dacRvwVo.setUserId(sessionVo.getId());
		//현재 진행 단계정보
		dacRvwVo.setRvwStpSpcd(basicInfoVo.getRvwStpSpcd());
		//심의 진행정보 조회
		List<DacRvwVo> basicInfoList = dacRvwAplcDtsService.selectDetailDataAplcRvwList(dacRvwVo);
		
		model.addAttribute("clcInfReserchVo", clcInfReserchVo);
		model.addAttribute("dacRvwDataPrvdVo", dacRvwDataPrvdVo);
		model.addAttribute("data", basicInfoVo);
		model.addAttribute("list", basicInfoList);
		return "kcure/portal/sys/dac/rvw/ViewDataPrvdCmbn";
	}
	
	
	/**
	  * @Method Name : saveDataPrvdCmbn
	  * @date : 2023. 5. 1.
	  * @Method 설명 :
	  *  <p>	
	  *     결합  제공기관결합진행 상태저장
	  *  </p>
	  * @param : 
	  * @return :
	  */
	@RequestMapping(value = "/saveDataPrvdCmbn.do")
	public ModelAndView saveDataPrvdCmbn(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
    	//targetRvwStpStcd
		DacRvwDataPrvdVo[] insertDataList = gridParameterMap.getUpdate(DacRvwDataPrvdVo.class);
		dacRvwDataPrvdService.saveDataPrvdCmbn(insertDataList);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
	}
}
