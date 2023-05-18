package kcure.portal.sys.etc.alm.web;

import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.etc.alm.service.EtcAlmService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.etc.alm.web
  * @FileName : EtcAlmController.java
  * @since : 2023. 3. 31.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	알림 관리 Controller
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
@RequestMapping("/portal/sys/etc/alm")
public class EtcAlmController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
     * 알림관리 Service
     */
    @Resource(name = "EtcAlmService")
    private EtcAlmService etcAlmService;

    /**
      * @Method Name : viewAlmManage
      * @작성일 : 2023. 3. 31.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	알림관리 화면 조회
      *  </p>
      * @param :
      * @return :
      */
    @RequestMapping(value="/viewAlmManage.do")
    public String viewAlmManage(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {
    	model.addAttribute("searchVO", comDefaultVO);
        return "kcure/portal/sys/etc/alm/ViewAlmManage";
    }

    /**
      * @Method Name : selectNtceMsgList
      * @작성일 : 2023. 3. 31.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	알림관리 목록 조회
      *  </p>
      * @param : ComDefaultVO comDefaultVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectNtceMsgList.do")
    public ModelAndView selectNtceMsgList(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {

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

        model.addAttribute(GridVar.gridView, etcAlmService.selectNtceMsgList(comDefaultVO));

        int totCnt = etcAlmService.selectNtceMsgListTotCnt(comDefaultVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);

        model.addAttribute("searchVO", comDefaultVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    @RequestMapping(value="/detailViewAlmManage.do")
    public String detailViewAlmManage(@RequestParam Map<String,Object> map, ModelMap model) throws Exception {
    	model.addAttribute("detailVO", etcAlmService.selectNtceMsgDetail(map));
    	model.addAttribute("searchVO", map);
        return "kcure/portal/sys/etc/alm/DetailViewAlmManage";
    }

    /**
      * @Method Name : updateNtceMsg
      * @작성일 : 2023. 3. 31.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	알림관리 수정
      *  </p>
      * @param : Map<String,Object> map
      * @return : ModelAndView
      */
    @RequestMapping(value="/updateNtceMsg.do")
    public ModelAndView updateNtceMsg(@RequestParam Map<String, Object> map, ModelMap model) throws Exception {
    	etcAlmService.updateNtceMsg(map);

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }
}
