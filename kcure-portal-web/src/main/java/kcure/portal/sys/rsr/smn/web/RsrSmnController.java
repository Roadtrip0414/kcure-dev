package kcure.portal.sys.rsr.smn.web;

import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.rsr.smn.service.RsrSmnService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.rsr.smn.web
  * @FileName : RsrSmnController.java
  * @since : 2023. 3. 30.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	과제별 관리 메모 Controller
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
@RequestMapping("/portal/sys/rsr/smn")
public class RsrSmnController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "RsrSmnService")
    private RsrSmnService rsrSmnService;

    /**
      * @Method Name : viewSbjMemo
      * @작성일 : 2023. 3. 30.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  </p>
      * @param : ComDefaultVO searchVO
      * @return : String
      */
    @RequestMapping(value="/viewSbjMemo.do")
    public String viewSbjMemo(@ModelAttribute("searchVO") ComDefaultVO searchVO, ModelMap model) throws Exception {
    	model.addAttribute("searchVO", searchVO);
        return "kcure/portal/sys/rsr/smn/ViewSbjMemo";
    }

    /**
      * @Method Name : selectSbjMemoList
      * @작성일 : 2023. 3. 30.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	과제별 관리 메모 목록 조회
      *  </p>
      * @param : ComDefaultVO searchVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectSbjMemoList.do")
    public ModelAndView selectSbjMemoList(@ModelAttribute("searchVO") ComDefaultVO searchVO, ModelMap model) throws Exception {

    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute(GridVar.gridView, rsrSmnService.selectSbjMemoList(searchVO));

        int totCnt = rsrSmnService.selectSbjMemoListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
      * @Method Name : detailViewSbjMemo
      * @작성일 : 2023. 3. 30.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	과제별 관리 메모 상세 조회
      *  </p>
      * @param : Map<String,Object> map
      * @return : String
      */
    @RequestMapping(value="/{viewPageNm}.do")
    public String detailViewSbjMemo(@PathVariable String viewPageNm, @RequestParam Map<String,Object> map, ModelMap model) throws Exception {
    	String viewNm = viewPageNm.substring(0, 1).toUpperCase() + viewPageNm.substring(1);

    	model.addAttribute("detailVO", rsrSmnService.selectSbjMemoDetail(map));
    	model.addAttribute("searchVO", map);

    	return "kcure/portal/sys/rsr/smn/"+viewNm;
    }

    /**
      * @Method Name : saveSbjMeno
      * @작성일 : 2023. 3. 30.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	과제별 관리 메모 저장
      *  </p>
      * @param : Map<String,Object> map
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveSbjMeno.do")
    public ModelAndView saveSbjMeno(@RequestParam Map<String,Object> map, ModelMap model) throws Exception {
    	rsrSmnService.saveSbjMeno(map);
    	model.addAttribute("searchVO", map);

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }
}
