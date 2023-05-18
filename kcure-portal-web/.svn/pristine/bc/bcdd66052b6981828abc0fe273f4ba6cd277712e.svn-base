package kcure.portal.sys.clb.tbl.web;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
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
import kcure.portal.sys.clb.tbl.service.ClbTblService;
import kcure.portal.sys.clb.tbl.service.impl.ClbTblVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.clb.tbl.web
 * @FileName : ClbTblController.java
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
@RequestMapping("/portal/sys/clb/tbl/")
public class ClbTblController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "sysClbTblService")
    private ClbTblService clbTblService;
	
	@Resource(name = "TagsService")
	private TagsService tagsService;

    /**
	 * @Method Name : viewClsTblManage
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  분류및테이블관리 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewClsTblManage.do")
    public String viewClsTblManage(ModelMap model) throws Exception {

    	//model.addAttribute("crcnNmList", clbTblService.selectSrchCrcnNmList());	//검색조건 : 암종
    	ComCdDetailVo comCd = new ComCdDetailVo();
    	comCd.setGrpCd("DTS_LCLS_CD");
    	model.addAttribute("crcnNmList", tagsService.searchCommonCodeDetailList(comCd));	//검색조건 : 암종
    	model.addAttribute("dtsMclsList", clbTblService.selectDtsMclsCdList());	//dropdown : 대분류
    	
        return "kcure/portal/sys/clb/ViewClsTblManage";
    }

    /**
	 * @Method Name : selectClsTblList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  분류및테이블관리 목록 조회
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="selectClsTblList.do")
    public ModelAndView selectClsTblList(@ModelAttribute("searchVO") ClbTblVO clbTblVO, ModelMap model) throws Exception {
    	
		model.addAttribute(GridVar.gridView, clbTblService.selectClsTblList(clbTblVO));
    	model.addAttribute("clbTblVO", clbTblVO);
    	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
	 * @Method Name : saveClsTbl
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  분류및테이블관리 C/U/D
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="saveClsTbl.do")
    public ModelAndView saveClsTbl(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
    	
    	clbTblService.saveClsTbl(gridParameterMap);

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
    	
    	ComCdDetailVo comCd = new ComCdDetailVo();
    	comCd.setGrpCd("DTS_LCLS_CD");
    	model.addAttribute("dtsLclsCdList", tagsService.searchCommonCodeDetailList(comCd));	//업로드조건 : 암종

    	model.addAttribute("xlsGbn", xlsGbn);
    	
        return "kcure/portal/sys/clb/tblXlsUploadPopup";
    }

}
