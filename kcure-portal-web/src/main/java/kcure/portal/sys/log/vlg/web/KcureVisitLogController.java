package kcure.portal.sys.log.vlg.web;

import java.util.HashMap;
import java.util.Map;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.log.vlg.service.VisitLog;
import kcure.portal.sys.log.vlg.service.KcureVisitLogService;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/portal/sys/log/vlg/")
public class KcureVisitLogController {

	@Resource(name="KcureVisitLogService")
	private KcureVisitLogService kcureVisitLogService;

	@Resource(name="propertiesService")
	protected EgovPropertyService propertyService;
	
	/**
	  * @Method Name : veiwVisitLog
	  * @date : 2023. 4. 3.
	  * @Method 설명 :
	  *  <p>	
	  *     사용자 방문기록 뷰 페이지 
	  *  </p>
	  * @param : 
	  * @return :
	  */
	@RequestMapping(value="/viewVisitLog.do")
	public String veiwVisitLog(@ModelAttribute("searchVO") VisitLog visitLog,
			ModelMap model) throws Exception{
		return "kcure/portal/sys/log/vlg/ViewVisitLog";
		
	}
	
	/**
	  * @Method Name : selectVisitLogInf
	  * @date : 2023. 4. 3.
	  * @Method 설명 :
	  *  <p>	
	  *     사용자 방문기록 리스트
	  *  </p>
	  * @param : 
	  * @return :
	  */
	@RequestMapping(value="/selectVisitLogList.do")
	public ModelAndView selectVisitLogInf(@ModelAttribute("searchVO") VisitLog visitLog, ModelMap model) throws Exception{

		visitLog.setPageUnit(propertyService.getInt("pageUnit"));
		visitLog.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(visitLog.getPageIndex());
		paginationInfo.setRecordCountPerPage(visitLog.getPageUnit());
		paginationInfo.setPageSize(visitLog.getPageSize());

		visitLog.setFirstIndex(paginationInfo.getFirstRecordIndex());
		visitLog.setLastIndex(paginationInfo.getLastRecordIndex());
		visitLog.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		HashMap<?, ?> _map = (HashMap<?, ?>)kcureVisitLogService.selectVisitLogInf(visitLog);
		
		int totCnt = Integer.parseInt((String)_map.get("resultCnt"));
		model.addAttribute(GridVar.gridView, _map.get("resultList"));

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute(GridVar.gridPage, paginationInfo);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
		
	}
}
