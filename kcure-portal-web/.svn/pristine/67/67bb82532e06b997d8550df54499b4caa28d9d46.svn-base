package kcure.portal.myp.svc.alm.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.myp.svc.alm.service.MypSvcAlmService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.svc.alm.web
 * @FileName : MypSvcAlmController.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	마이페이지 알림에 대한 controller 클래스를 정의한다.
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
@RequestMapping("/portal/myp/svc/alm/")
public class MypSvcAlmController {
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "mypSvcAlmService")
	private MypSvcAlmService mypSvcAlmService;
	
	/**
	 * @Method Name : viewMypSvcAlm
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	알림 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewMypSvcAlm.do")
    public String viewMypSvcAlm(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	return "kcure/portal/myp/svc/ViewMypSvcAlm";
    }
	
	/**
	 * @Method Name : selectMypSvcAlmList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	알림 목록 조회
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectMypSvcAlmList.do")
    public HashMap<String, Object> selectMypSvcAlmList(@RequestParam HashMap<String, Object> commandMap, ModelMap model) throws Exception {
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
		
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		commandMap.put("userId", sessionVo.getId());
		commandMap.put("frstRegpId", sessionVo.getId());
		
		int totCnt = mypSvcAlmService.selectMypSvcAlmListTotCnt(commandMap);
		paginationInfo.setTotalRecordCount(totCnt);
    	
    	HashMap<String, Object> resultMap = new HashMap<>();
    	resultMap.put("result", "success");
    	resultMap.put("almList", mypSvcAlmService.selectMypSvcAlmList(commandMap));	//알림 목록
    	resultMap.put("searchVO", paginationInfo);	//페이징정보
    	
    	mypSvcAlmService.updateMypSvcAlmAllCnfrYn(commandMap);	//확인여부 전체수정
    	
    	return resultMap;
    }
	
	/**
	 * @Method Name : selectMypSvcAlm
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	알림 상세정보 조회
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectMypSvcAlm.do")
    public HashMap<String, Object> selectMypSvcAlm(@RequestParam HashMap<String, Object> commandMap, ModelMap model) throws Exception {
		LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		commandMap.put("frstRegpId", sessionVo.getId());
    	
    	HashMap<String, Object> resultMap = new HashMap<>();
    	resultMap.put("result", "success");
    	resultMap.put("almDtl", mypSvcAlmService.selectMypSvcAlm(commandMap));	//알림상세정보조회
    	
    	mypSvcAlmService.updateMypSvcAlmClckYn(commandMap);	//클릭여부 수정
    	
    	return resultMap;
    }
}
