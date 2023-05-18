package kcure.portal.sys.log.ulg.web;

import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.log.ulg.service.KcureUserActionLogService;
import kcure.portal.sys.log.ulg.service.UserActionLog;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.log.ulg.web
  * @FileName : KcureUserActionLogController.java
  * @since : 2023. 2. 8. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 사용자 Action 로그 
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
@RequestMapping("/portal/sys/log/ulg")
public class KcureUserActionLogController {
	
	
	@Resource(name="KcureUserActionLogService")
	private KcureUserActionLogService userActionLogService;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	/**
	 * 시스템 로그 목록 조회
	 *
	 * @param sysLog
	 * @return sym/log/lgm/EgovSysLogList
	 * @throws Exception
	 */
	@RequestMapping(value="/ViewUserActionLog.do")
	public String veiwUserActionLog(@ModelAttribute("searchVO") UserActionLog userActionLog,
			ModelMap model) throws Exception{
		return "kcure/portal/sys/log/ulg/ViewUserActionLog";
		
	}
	
	@RequestMapping(value="/SelectUserActionLogList.do")
	public ModelAndView selectUserActionLogInf(@ModelAttribute("searchVO") UserActionLog userActionLog,
			ModelMap model) throws Exception{
    	/** EgovPropertyService.sample */
		userActionLog.setPageUnit(propertiesService.getInt("pageUnit"));
		userActionLog.setPageSize(propertiesService.getInt("pageSize"));

    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userActionLog.getPageIndex());
		paginationInfo.setRecordCountPerPage(userActionLog.getPageUnit());
		paginationInfo.setPageSize(userActionLog.getPageSize());

		userActionLog.setFirstIndex(paginationInfo.getFirstRecordIndex());
		userActionLog.setLastIndex(paginationInfo.getLastRecordIndex());
		userActionLog.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		HashMap<?, ?> _map = (HashMap<?, ?>)userActionLogService.selectUserActionLogInf(userActionLog);
		
		int totCnt = Integer.parseInt((String)_map.get("resultCnt"));
		model.addAttribute(GridVar.gridView, _map.get("resultList"));
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute(GridVar.gridPage, paginationInfo);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
		
	}
	

}
