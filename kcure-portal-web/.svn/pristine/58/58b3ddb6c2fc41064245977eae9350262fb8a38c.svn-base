package kcure.portal.sys.bbs.dur.web;

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
import kcure.portal.sys.bbs.dur.service.BbsDurService;
import kcure.portal.sys.bbs.dur.service.impl.DataUtlcVO;
import kcure.portal.sys.pim.mng.service.PimMngService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.dur.web
  * @FileName : BbsDurController.java
  * @since : 2023. 2. 8.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : 게시판 관리 Controller
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
@RequestMapping("/portal/sys/bbs/dur")
public class BbsDurController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	/* 게시판관리 service */
    @Resource(name = "bbsDurService")
    private  BbsDurService bbsDurService;

    @Resource(name = "pimMngService")
    private PimMngService pimMngService;

	@Resource(name="CommonServiceFileMngUtil")
	private CommonServiceFileMngUtil fileUtil;

	@Resource(name="commonFileService")
	private CommonFileService fileService;

    /**
      * @Method Name : viewDataUtlc
      * @작성일 : 2023. 3. 15.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	데이터 활용 사례 목록 화면 조회
      *  </p>
      * @param : viewPageNm String
      * 		dataUtlcVO DataUtlcVO
      * @return : String
      */
    @RequestMapping(value="/{viewPageNm}.do")
    public String viewDataUtlc(@PathVariable String viewPageNm, @ModelAttribute("searchVO") DataUtlcVO dataUtlcVO, ModelMap model) throws Exception {
    	String viewNm = viewPageNm.substring(0, 1).toUpperCase() + viewPageNm.substring(1);

    	model.addAttribute("rsrInstcdList", pimMngService.selectPrtiAllList("03")); 	//연구기관 코드
    	model.addAttribute("searchVO", dataUtlcVO);

    	if(dataUtlcVO.getUtlcRgstSeq() > 0) {
    		model.addAttribute("dataUtlcVO", bbsDurService.selectDataUtlcDetail(dataUtlcVO));
    		model.addAttribute("instVO", bbsDurService.selectDataUtlcRsrInstDetail(dataUtlcVO));
    	}
        return "kcure/portal/sys/bbs/"+viewNm;
    }

    /**
      * @Method Name : selectDataUtlcList
      * @작성일 : 2023. 2. 9.
      * @작성자 : hjjeon
      * @Method 설명 : 데이터 활용사례 목록 조회
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectDataUtlcList.do")
    public ModelAndView selectDataUtlcList(@ModelAttribute("searchVO") DataUtlcVO dataUtlcVO, ModelMap model) throws Exception {

    	/** EgovPropertyService.sample */
    	dataUtlcVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	dataUtlcVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(dataUtlcVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(dataUtlcVO.getPageUnit());
		paginationInfo.setPageSize(dataUtlcVO.getPageSize());

		dataUtlcVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		dataUtlcVO.setLastIndex(paginationInfo.getLastRecordIndex());
		dataUtlcVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute(GridVar.gridView, bbsDurService.selectDataUtlcList(dataUtlcVO));

        int totCnt = bbsDurService.selectDataUtlcListTotCnt(dataUtlcVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", dataUtlcVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
      * @Method Name : saveDataUtlc
      * @작성일 : 2023. 2. 9.
      * @작성자 : hjjeon
      * @Method 설명 : 데이터 활용 사례 저장
      *  <p>
      *  </p>
      * @param : dataUtlcVO DataUtlcVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveDataUtlc.do")
    public ModelAndView saveDataUtlc(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") DataUtlcVO dataUtlcVO, ModelMap model) throws Exception {
    	//첨부파일 등록
		String _atchFileId = dataUtlcVO.getRsdAttfId();

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if(!files.isEmpty()){
			List<CommonFileVO> result = fileUtil.parseFileInf(files);
			_atchFileId = fileService.insertCommonFileInfo(result, _atchFileId);  //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
		}

		dataUtlcVO.setRsdAttfId(_atchFileId);
    	bbsDurService.saveDataUtlc(dataUtlcVO);
    	model.addAttribute("searchVO", dataUtlcVO);

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
		return modelAndView;
    }

    /**
      * @Method Name : deleteDataUtlc
      * @작성일 : 2023. 2. 9.
      * @작성자 : hjjeon
      * @Method 설명 : 데이터 활용 사례 삭제
      *  <p>
      *  </p>
      * @param : dataUtlcVO DataUtlcVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/deleteDataUtlc.do")
    public ModelAndView deleteDataUtlc(@ModelAttribute("searchVO") DataUtlcVO dataUtlcVO, ModelMap model) throws Exception {
    	bbsDurService.deleteDataUtlc(dataUtlcVO);
    	model.addAttribute("searchVO", dataUtlcVO);
    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }
}
