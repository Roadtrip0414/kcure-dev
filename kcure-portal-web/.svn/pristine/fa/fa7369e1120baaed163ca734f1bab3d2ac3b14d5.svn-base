package kcure.portal.sys.rsr.dau.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.rsr.dau.service.RsrDauService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.rsr.dau.web
 * @FileName : RsrDauController.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터 활용관리에 대한 controller 클래스를 정의한다.
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
@RequestMapping("/portal/sys/rsr/dau/")
public class RsrDauController {
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "sysRsrDauService")
	private RsrDauService sysRsrDauService;
	
	/**
	 * @Method Name : setUsrAuthParam
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  사용자권한에 따른 파라미터 설정
	 * @param : model
	 * @return :
	 */
    private HashMap<String, Object> setAuthParam(HashMap<String, Object> commandMap) throws Exception {
    	HashMap<String, Object> paramMap = new HashMap<>();
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	paramMap.put("userId", user.getId());
    	
    	int chkAdmAuthCnt = sysRsrDauService.selectRsrDauAdmAuthCnt(paramMap);	//사무국권한을 가지고 있는지 확인
    	
    	if (chkAdmAuthCnt < 1) {	//사무국 권한이 없으면 해당 기관으로 조회 범위 축소
    		commandMap.put("limitPrtiId", user.getPrtiId());
    	}
    	
    	return commandMap;
    }
	
	/**
	 * @Method Name : viewRsrDauManage
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  데이터 활용관리 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewRsrDauManage.do")
    public String viewRsrDauManage(@RequestParam HashMap<String, Object> commandMap, ModelMap model) throws Exception {
    	this.setAuthParam(commandMap);		//사용자권한에 따른 파라미터 설정
    	
    	model.addAttribute("searchVO", commandMap);	//검색조건
    	model.addAttribute("siDoCdList", sysRsrDauService.selectRsrDauSiDoList(commandMap));	//센터위치(안심활용센터가 있는 시도만)
    	
    	return "kcure/portal/sys/rsr/dau/ViewRsrDauManage";
    }
    
    /**
	 * @Method Name : selectRsrDauPrtiIdList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  안심활용센터 목록 조회
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectRsrDauPrtiIdList.do")
    public HashMap<String, Object> selectMypRscInfDszPrtiIdList(@RequestParam HashMap<String, Object> commandMap) throws Exception {
    	HashMap<String, Object> resultMap = new HashMap<>();
    	
    	List<Map<String, Object>> prtiIdList = sysRsrDauService.selectRsrDauPrtiIdList(commandMap);
    	
    	if (prtiIdList != null && prtiIdList.size() > 0) {
        	resultMap.put("result", "success");
        	resultMap.put("prtiIdList", prtiIdList);
    	} else {
        	resultMap.put("result", "nodata");
    	}
    	
    	return resultMap;
    }
	
	/**
	 * @Method Name : selectRsrDauList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  데이터 활용관리 목록조회
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="selectRsrDauList.do")
    public ModelAndView selectRsrDauList(@RequestParam HashMap<String, Object> commandMap, ModelMap model) throws Exception {
    	/** EgovPropertyService.sample */
    	commandMap.put("pageUnit", propertiesService.getInt("pageUnit"));
    	commandMap.put("pageSize", propertiesService.getInt("pageSize"));
    	
		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(commandMap.get("pageIndex")+""));
		paginationInfo.setRecordCountPerPage(Integer.parseInt(commandMap.get("pageUnit")+""));
		paginationInfo.setPageSize(Integer.parseInt(commandMap.get("pageSize")+""));
		
		commandMap.put("firstIndex", paginationInfo.getFirstRecordIndex());
		commandMap.put("lastIndex", paginationInfo.getLastRecordIndex());
		commandMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		
		int totCnt = sysRsrDauService.selectRsrDauListTotCnt(commandMap);
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute(GridVar.gridPage, paginationInfo);		
		model.addAttribute(GridVar.gridView, sysRsrDauService.selectRsrDauList(commandMap));
		model.addAttribute("searchVO", commandMap);
		
		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
		
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	
    	return modelAndView;
    }
	
	/**
	 * @Method Name : detailRsrDauManage
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  데이터 활용관리 상세보기 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="detailRsrDauManage.do")
    public String detailRsrDauManage(@RequestParam HashMap<String, Object> commandMap, ModelMap model) throws Exception {    	
    	
    	model.addAttribute("searchVO", commandMap);	//검색조건
    	
    	Map<String, Object> dtlInfo = sysRsrDauService.selectRsrDauDtu(commandMap);	//신청내역
    	model.addAttribute("dtlInfo", dtlInfo);
    	
    	model.addAttribute("acidList", sysRsrDauService.selectRsrDauAcidList(commandMap));	//분석자목록
    	
    	commandMap.put("dszInstId", (String)dtlInfo.get("dszInstId"));
    	model.addAttribute("dszRsvList", sysRsrDauService.selectRsrDauDszRsvList(commandMap));	//좌석목록
    	
    	return "kcure/portal/sys/rsr/dau/DetailRsrDauManage";
    }
	
	/**
	 * @Method Name : selectRsrDauPrtiSeatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  데이터 활용관리 센터별 선택용 좌석정보 조회
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectRsrDauPrtiSeatList.do")
    public HashMap<String, Object> selectRsrDauPrtiSeatList(@RequestParam HashMap<String, Object> commandMap) throws Exception {    	
    	HashMap<String, Object> resultMap = new HashMap<>();
    	resultMap.put("result", "success");
    	resultMap.put("dsgnYmdList", sysRsrDauService.selectRsrDauDsgnYmdList(commandMap));	//지정일자 목록
    	resultMap.put("prtiSeatList", sysRsrDauService.selectRsrDauPrtiSeatList(commandMap));	//센터 좌석 목록
    	
    	return resultMap;
    }
	
	/**
	 * @Method Name : saveRsrDauManage
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  데이터 활용관리 저장
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="saveRsrDauManage.do")
    public HashMap<String, Object> saveRsrDauManage(@RequestParam HashMap<String, Object> commandMap) throws Exception {    	
    	sysRsrDauService.saveRsrDauManage(commandMap);
    	
    	HashMap<String, Object> resultMap = new HashMap<>();
    	resultMap.put("result", "success");
    	resultMap.put("msg", egovMessageSource.getMessage("success.common.insert"));
    	
    	return resultMap;
    }
}
