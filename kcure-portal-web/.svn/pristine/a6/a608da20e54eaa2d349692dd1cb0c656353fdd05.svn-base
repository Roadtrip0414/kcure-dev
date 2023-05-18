package kcure.portal.sys.bbs.kcn.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.cmn.service.CommonFileService;
import kcure.portal.cmn.service.CommonServiceFileMngUtil;
import kcure.portal.cmn.service.impl.CommonFileVO;
import kcure.portal.sys.bbs.ntc.service.BbsNtcService;
import kcure.portal.sys.bbs.ntc.service.impl.BbsVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.kcn.web
  * @FileName : BbsKcnController.java
  * @since : 2023. 3. 7.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	KCURE 소식 Controller
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
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/sys/bbs/kcn")
public class BbsKcnController {
	public static String BBS_ID03 = "BBSMSTR_000000000003";

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	/* 게시판관리 service */
    @Resource(name = "bbsNtcService")
    private  BbsNtcService bbsNtcService;

	@Resource(name="CommonServiceFileMngUtil")
	private CommonServiceFileMngUtil fileUtil;

	@Resource(name="commonFileService")
	private CommonFileService fileService;

    /**
      * @Method Name : viewBbsManage
      * @작성일 : 2023. 2. 8.
      * @작성자 : hjjeon
      * @Method 설명 : 게시판 관리 화면 조회
      *  <p>
      *  </p>
      * @param : bbsVO BbsVO
      * 		 viewPageNm String
      * @return : String
      */
    @RequestMapping(value="/{viewPageNm}.do")
    public String viewBbsManage(@PathVariable String viewPageNm, @ModelAttribute("searchVO") BbsVO bbsVO, ModelMap model) throws Exception {
    	String viewNm = viewPageNm.substring(0, 1).toUpperCase() + viewPageNm.substring(1);

    	model.addAttribute("searchVO", bbsVO);

    	if(bbsVO.getNttId() > 0) {
    		model.addAttribute("bbsVO", bbsNtcService.selectBbsDetail(bbsVO));
    	}
        return "kcure/portal/sys/bbs/"+viewNm;
    }

    /**
      * @Method Name : selectBbsList
      * @작성일 : 2023. 2. 8.
      * @작성자 : hjjeon
      * @Method 설명 : 게시판 목록 조회
      *  <p>
      *  </p>
      * @param : bbsVO BbsVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectBbsList.do")
    public ModelAndView selectBbsList(@ModelAttribute("searchVO") BbsVO bbsVO, ModelMap model) throws Exception {
    	List<String> bbsIdList = new ArrayList<String>();
    	bbsIdList.add(BBS_ID03);
    	bbsVO.setBbsIdList(bbsIdList);

    	/** EgovPropertyService.sample */
    	bbsVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	bbsVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(bbsVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(bbsVO.getPageUnit());
		paginationInfo.setPageSize(bbsVO.getPageSize());

		bbsVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		bbsVO.setLastIndex(paginationInfo.getLastRecordIndex());
		bbsVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute(GridVar.gridView, bbsNtcService.selectBbsList(bbsVO));

        int totCnt = bbsNtcService.selectBbsListTotCnt(bbsVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", bbsVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
      * @Method Name : saveBbs
      * @작성일 : 2023. 2. 8.
      * @작성자 : hjjeon
      * @Method 설명 : 게시판 글 저장
      *  <p>
      *  </p>
      * @param : bbsVO BbsVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveBbs.do")
    public ModelAndView saveBbs(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BbsVO bbsVO, ModelMap model) throws Exception {
       	//첨부파일 등록
    	String _atchFileId = bbsVO.getAtchFileId();

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if(!files.isEmpty()){
			List<CommonFileVO> result = fileUtil.parseFileInf(files);
			_atchFileId = fileService.insertCommonFileInfo(result, _atchFileId);  //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.

		}

		bbsVO.setAtchFileId(_atchFileId);
    	bbsNtcService.saveBbs(bbsVO);
    	model.addAttribute("searchVO", bbsVO);
    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
//    	return "redirect:/portal/sys/bbs/kcn/viewKcnManage.do";
    }

    /**
      * @Method Name : deleteBbs
      * @작성일 : 2023. 2. 8.
      * @작성자 : hjjeon
      * @Method 설명 : 게시판 글 삭제
      *  <p>
      *  </p>
      * @param : bbsVO BbsVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/deleteBbs.do")
    public ModelAndView deleteBbs(@ModelAttribute("searchVO") BbsVO bbsVO, ModelMap model) throws Exception {
    	bbsNtcService.deleteBbs(bbsVO);
    	model.addAttribute("searchVO", bbsVO);
    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }
}
