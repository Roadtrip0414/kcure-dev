package kcure.portal.bbs.kcn.web;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import kcure.portal.bbs.kcn.service.KcnService;
import kcure.portal.bbs.ntc.service.impl.NtcVO;
import kcure.portal.cmn.grid.GridVar;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.kcn.ntc.web
  * @FileName : KcnNtcController.java
  * @since : 2023. 3. 13.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	K-CURE 소식 Controller
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
@RequestMapping("/portal/bbs/kcn")
public class KcnController {
	//게시판Id
	public static String BBS_ID = "BBSMSTR_000000000003";

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "KcnService")
    private KcnService kcnService;

    /**
      * @Method Name : viewKcn
      * @작성일 : 2023. 3. 13.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	K-CURE 소식 목록 조회
      *  </p>
      * @param : ntcVO NtcVO
      * @return : String
      */
    @RequestMapping(value="/viewKcn.do")
    public String viewKcn(@ModelAttribute("searchVO") NtcVO ntcVO, ModelMap model) throws Exception {
    	ntcVO.setBbsId(BBS_ID);
    	ntcVO.setPageUnit(24);
    	ntcVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(ntcVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(ntcVO.getPageUnit());
		paginationInfo.setPageSize(ntcVO.getPageSize());

		ntcVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ntcVO.setLastIndex(paginationInfo.getLastRecordIndex());
		ntcVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		int totCnt =  kcnService.selectKcnListTotCnt(ntcVO);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", kcnService.selectKcnList(ntcVO));
		model.addAttribute("resultCnt", totCnt);
		model.addAttribute("searchVO", ntcVO);
		model.addAttribute(GridVar.gridPage, paginationInfo);

        return "kcure/portal/bbs/kcn/ViewKcn";
    }

    /**
      * @Method Name : detailViewKcn
      * @작성일 : 2023. 3. 13.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	K-CURE 소식 상세 조회
      *  </p>
      * @param : ntcVO NtcVO
      * @return : String
      */
    @RequestMapping("/detailViewKcn.do")
    public String detailViewKcn(@ModelAttribute("searchVO") NtcVO ntcVO, ModelMap model) throws Exception {
    	model.addAttribute("kcnVO", ntcVO);
    	model.addAttribute("result", kcnService.selectKcnDetail(ntcVO));
    	return "kcure/portal/bbs/kcn/DetailViewKcn";
    }
}
