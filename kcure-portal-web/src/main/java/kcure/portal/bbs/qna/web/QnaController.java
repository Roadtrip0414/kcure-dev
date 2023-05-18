package kcure.portal.bbs.qna.web;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.bbs.qna.service.QnaService;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.cmn.service.CommonFileService;
import kcure.portal.cmn.service.CommonServiceFileMngUtil;
import kcure.portal.cmn.service.impl.CommonFileVO;
import kcure.portal.sys.bbs.qna.service.impl.QnaQstnVO;
import kcure.portal.sys.usr.stt.service.UsrSttService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.qna.web
  * @FileName : QnaController.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	QNA Controller
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
@RequestMapping("/portal/bbs/qna")
public class QnaController {
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "QnaService")
    private  QnaService qnaService;

    @Resource(name = "usrSttService")
    private UsrSttService usrSttService;

	@Resource(name="CommonServiceFileMngUtil")
	private CommonServiceFileMngUtil fileUtil;

	@Resource(name="commonFileService")
	private CommonFileService fileService;

    /**
      * @Method Name : viewQna
      * @작성일 : 2023. 3. 14.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	qna 화면 조회
      *  </p>
      * @param : String viewPageNm, QnaQstnVO qnaQstnVO
      * @return : String url
      */
    @RequestMapping(value="/{viewPageNm}.do")
    public String viewQna(@PathVariable String viewPageNm, @ModelAttribute("searchVO") QnaQstnVO qnaQstnVO, ModelMap model) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	String viewNm = viewPageNm.substring(0, 1).toUpperCase() + viewPageNm.substring(1);
    	model.addAttribute("searchVO", qnaQstnVO);
    	model.addAttribute("qstnClsSpcdList", usrSttService.selectCdCbo("QSTN_CLS_SPCD"));
    	if(user != null) {
    		model.addAttribute("userNm", user.getName());
    	}

    	if(!qnaQstnVO.getQstnId().isEmpty()) {
    		model.addAttribute("qnaQstnVO", qnaService.selectQnaDetail(qnaQstnVO));
    	}

        return "kcure/portal/bbs/qna/"+viewNm;
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

    	qnaQstnVO.setInstGnrSpcd("01");	//01-일반
    	/** EgovPropertyService.sample */
    	qnaQstnVO.setPageUnit(propertyService.getInt("pageUnit"));
    	qnaQstnVO.setPageSize(propertyService.getInt("pageSize"));

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(qnaQstnVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(qnaQstnVO.getPageUnit());
		paginationInfo.setPageSize(qnaQstnVO.getPageSize());

		qnaQstnVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		qnaQstnVO.setLastIndex(paginationInfo.getLastRecordIndex());
		qnaQstnVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        model.addAttribute(GridVar.gridView, qnaService.selectQnaList(qnaQstnVO));

        int totCnt = qnaService.selectQnaListTotCnt(qnaQstnVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", qnaQstnVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
      * @Method Name : saveQna
      * @작성일 : 2023. 3. 15.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	문의 하기 저장
      *  </p>
      * @param :  QnaQstnVO qnaQstnVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveQna.do")
    public ModelAndView saveQna(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") QnaQstnVO qnaQstnVO, ModelMap model) throws Exception {
    	//첨부파일 등록
		String _atchFileId = qnaQstnVO.getAttfId();

		final Map<String, MultipartFile> files = multiRequest.getFileMap();

		if(!files.isEmpty()){
			List<CommonFileVO> result = fileUtil.parseFileInf(files);
			_atchFileId = fileService.insertCommonFileInfo(result, _atchFileId);  //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
		}

		qnaQstnVO.setAttfId(_atchFileId);
    	qnaService.insertQna(qnaQstnVO);
    	model.addAttribute("searchVO", qnaQstnVO);
    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }

    /**
      * @Method Name : qnaPwCheck
      * @작성일 : 2023. 3. 15.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	비밀번호 체크
      *  </p>
      * @param :  QnaQstnVO qnaQstnVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/qnaPwCheck.do")
    public ModelAndView qnaPwCheck(@ModelAttribute("searchVO") QnaQstnVO qnaQstnVO, ModelMap model) throws Exception {

    	//비밀 번호 조회
    	Map<String,Object> detailMap = qnaService.selectQnaDetail(qnaQstnVO);
    	String wtrPswd = (String) detailMap.get("wtrPswd");

		if(!qnaQstnVO.getWtrPswd().equals(wtrPswd)) {
			model.addAttribute("errMsg", "비밀번호가 맞지 않습니다.");
		}

    	ModelAndView modelAndView = new ModelAndView("jsonView", model);
    	return modelAndView;
    }
}
