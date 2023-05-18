package kcure.portal.sys.bbs.qna.web;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.bbs.qna.service.BbsQnaService;
import kcure.portal.sys.bbs.qna.service.impl.QnaAnsVO;
import kcure.portal.sys.bbs.qna.service.impl.QnaQstnVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.bbs.qna.web
  * @FileName : BbsQnaController.java
  * @since : 2023. 3. 7.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	Qna 관리 화면 Controller
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
@RequestMapping("/portal/sys/bbs/qna")
public class BbsQnaController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "bbsQnaService")
    private  BbsQnaService bbsQnaService;

    /**
      * @Method Name : viewQnaManage
      * @작성일 : 2023. 3. 7.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	qna 화면 조회
      *  </p>
      * @param : String viewPageNm, QnaQstnVO qnaQstnVO
      * @return : String url
      */
    @RequestMapping(value="/{viewPageNm}.do")
    public String viewQnaManage(@PathVariable String viewPageNm, @ModelAttribute("searchVO") QnaQstnVO qnaQstnVO, ModelMap model) throws Exception {
    	String viewNm = viewPageNm.substring(0, 1).toUpperCase() + viewPageNm.substring(1);
    	model.addAttribute("searchVO", qnaQstnVO);

    	if(!qnaQstnVO.getQstnId().isEmpty()) {
    		model.addAttribute("qnaQstnVO", bbsQnaService.selectQnaDetail(qnaQstnVO));
    	}
        return "kcure/portal/sys/bbs/"+viewNm;
    }

    /**
      * @Method Name : selectQnaList
      * @작성일 : 2023. 3. 7.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	Qna 목록 조회
      *  </p>
      * @param : QnaQstnVO qnaQstnVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectQnaList.do")
    public ModelAndView selectQnaList(@ModelAttribute("searchVO") QnaQstnVO qnaQstnVO, ModelMap model) throws Exception {

    	/** EgovPropertyService.sample */
    	qnaQstnVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	qnaQstnVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(qnaQstnVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(qnaQstnVO.getPageUnit());
		paginationInfo.setPageSize(qnaQstnVO.getPageSize());

		qnaQstnVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		qnaQstnVO.setLastIndex(paginationInfo.getLastRecordIndex());
		qnaQstnVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute(GridVar.gridView, bbsQnaService.selectQnaList(qnaQstnVO));

        int totCnt = bbsQnaService.selectQnaListTotCnt(qnaQstnVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", qnaQstnVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
      * @Method Name : saveQnaAns
      * @작성일 : 2023. 3. 7.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	QNa 답변 저장
      *  </p>
      * @param : QnaAnsVO qnaAnsVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveQnaAns.do")
    public ModelAndView saveQnaAns(@ModelAttribute("searchVO") QnaAnsVO qnaAnsVO, ModelMap model) throws Exception {

    	bbsQnaService.saveQnaAns(qnaAnsVO);
    	model.addAttribute("searchVO", qnaAnsVO);

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
      * @Method Name : deleteQna
      * @작성일 : 2023. 3. 7.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	Qna 삭제
      *  </p>
      * @param : QnaQstnVO qnaQstnVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/deleteQna.do")
    public ModelAndView deleteQna(@ModelAttribute("searchVO") QnaQstnVO qnaQstnVO, ModelMap model) throws Exception {

    	bbsQnaService.deleteQna(qnaQstnVO);
    	model.addAttribute("searchVO", qnaQstnVO);

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

}


