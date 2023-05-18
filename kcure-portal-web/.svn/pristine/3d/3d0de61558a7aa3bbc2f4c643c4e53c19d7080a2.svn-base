package kcure.portal.sys.clb.col.web;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.cmn.tags.service.TagsService;
import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;
import kcure.portal.sys.clb.col.service.ClbColService;
import kcure.portal.sys.clb.tbl.service.ClbTblService;
import kcure.portal.sys.clb.tbl.service.impl.ClbTblVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.clb.col.web
 * @FileName : ClbColController.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	표준테이블관리에 대한 controller 클래스를 정의한다.
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
@RequestMapping("/portal/sys/clb/col/")
public class ClbColController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "sysClbColService")
    private ClbColService clbColService;

    @Resource(name = "sysClbTblService")
    private ClbTblService clbTblService;
	
	@Resource(name = "TagsService")
	private TagsService tagsService;
    
    /**
	 * @Method Name : viewClsColManage
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewClsColManage.do")
    public String viewClsColManage(ModelMap model) throws Exception {

    	//model.addAttribute("crcnNmList", clbTblService.selectSrchCrcnNmList());	//검색조건 : 암종
    	ComCdDetailVo comCd = new ComCdDetailVo();
    	comCd.setGrpCd("DTS_LCLS_CD");
    	model.addAttribute("crcnNmList", tagsService.searchCommonCodeDetailList(comCd));	//검색조건 : 암종
    	
        return "kcure/portal/sys/clb/ViewClsColManage";
    }

    /**
	 * @Method Name : selectClsTblColTreeList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 트리 목록 조회
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="selectClsTblColTreeList.do")
    public ModelAndView selectClsTblColTreeList(@ModelAttribute("searchVO") ClbTblVO clbTblVO, ModelMap model) throws Exception {
    	
    	model.addAttribute(GridVar.gridView, clbColService.selectClsTblColTreeList(clbTblVO));
    	model.addAttribute("clbTblVO", clbTblVO);
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
	 * @Method Name : selectClsColList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 목록 조회
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="selectClsColList.do")
    public ModelAndView selectClsColList(@ModelAttribute("searchVO") ClbTblVO clbTblVO, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
    	clbTblVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	clbTblVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(clbTblVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(clbTblVO.getPageUnit());
		paginationInfo.setPageSize(clbTblVO.getPageSize());
		
		clbTblVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		clbTblVO.setLastIndex(paginationInfo.getLastRecordIndex());
		clbTblVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		//clbTblVO.setRecordCountPerPage(20000);
		
		int totCnt = clbColService.selectClsColListTotCnt(clbTblVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute(GridVar.gridPage, paginationInfo);		
		model.addAttribute(GridVar.gridView, clbColService.selectClsColList(clbTblVO));
    	model.addAttribute("clbTblVO", clbTblVO);
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
	 * @Method Name : saveClsCol
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  항목관리 C/U/D
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="saveClsCol.do")
    public ModelAndView saveClsCol(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
    	
    	clbColService.saveClsCol(gridParameterMap);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }

    /**
	 * @Method Name : tblXlsUploadPopup
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  엑셀업로드팝업 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="tblXlsUploadPopup.do")
    public String tblXlsUploadPopup(ModelMap model,@RequestParam("xlsGbn") String xlsGbn) throws Exception {

    	model.addAttribute("xlsGbn", xlsGbn);
    	
        return "kcure/portal/sys/clb/tblXlsUploadPopup";
    }
}
