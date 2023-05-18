package kcure.portal.sys.log.flm.web;

import java.util.Map;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.log.flm.service.FileLog;
import kcure.portal.sys.log.flm.service.KcureFileLogService;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/portal/sys/log/flg/")
public class KcureFileLogController {

	@Resource(name="KcureFileLogService")
	private KcureFileLogService kcureFileLogService;

	@Resource(name="propertiesService")
	protected EgovPropertyService propertyService;
	
	/**
	  * @Method Name : veiwSysLog
	  * @date : 2023. 1. 26.
	  * @Method 설명 :
	  *  <p>	
	  *     파일로그 뷰 페이지 
	  *  </p>
	  * @param : 
	  * @return :
	  */
	@RequestMapping(value="/ViewFileLog.do")
	public String veiwSysLog(@ModelAttribute("searchVO") FileLog fileLog,
			ModelMap model) throws Exception{
		return "kcure/portal/sys/log/flg/ViewFileLog";
		
	}
	
	/**
	  * @Method Name : selectWebLogInf
	  * @date : 2023. 1. 26.
	  * @Method 설명 :
	  *  <p>	
	  *     파일로그 리스트
	  *  </p>
	  * @param : 
	  * @return :
	  */
	@RequestMapping(value="/SelectFileLogList.do")
	public ModelAndView selectWebLogInf(@ModelAttribute("searchVO") FileLog fileLog,
			ModelMap model) throws Exception{

		fileLog.setPageUnit(propertyService.getInt("pageUnit"));
		fileLog.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(fileLog.getPageIndex());
		paginationInfo.setRecordCountPerPage(fileLog.getPageUnit());
		paginationInfo.setPageSize(fileLog.getPageSize());

		fileLog.setFirstIndex(paginationInfo.getFirstRecordIndex());
		fileLog.setLastIndex(paginationInfo.getLastRecordIndex());
		fileLog.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<?, ?> _map = kcureFileLogService.selectFileLogInf(fileLog);
		int totCnt = Integer.parseInt((String)_map.get("resultCnt"));

		model.addAttribute(GridVar.gridView, _map.get("resultList"));
		model.addAttribute("resultCnt", _map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute(GridVar.gridPage, paginationInfo);
		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;

		
	}
}
