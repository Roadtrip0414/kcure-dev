package kcure.portal.sys.dac.prc.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.dac.prc.service.DacPrcService;
import kcure.portal.sys.dac.prc.service.impl.DacPrcSearchVO;
import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.ctg.cds.service.impl.CtgCdsVO;
import kcure.portal.sys.ctg.dts.service.impl.CtgDtsVO;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.dac.prc.web
  * @FileName : DacPrcController.java
  * @since : 2023. 3. 10.
  * @version 1.0
  * @author : parkgu
  * @프로그램 설명 : 기관 심의자 관리
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
@RequestMapping("/portal/sys/dac/prc")
public class DacPrcController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "dacPrcService")
    private DacPrcService dacPrcService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
      * @Method Name : viewAuthorManage
      * @작성일 : 2023. 3. 10.
      * @작성자 : parkgu
      * @Method 설명 : 기관 심의자 목록
      *  <p>
      *  </p>
      * @param :
      * @return : String
      */
    @RequestMapping(value="/viewSvcPrtiSpCdIs01.do")
    public String viewSvcPrtiSpCdIs01() throws Exception {
        return "kcure/portal/sys/dac/prc/ViewSvcPrtiSpCdIs01";
    }

    /**
      * @Method Name : selectSvcPrtiSpCdIs01
      * @작성일 : 2023. 3. 10.
      * @작성자 : parkgu
      * @Method 설명 : 기관 심의자 목록 조회
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : ModelAndView
      */
    @RequestMapping(value="/selectSvcPrtiSpCdIs01.do")
    public ModelAndView selectSvcPrtiSpCdIs01(@ModelAttribute("searchVO") ComDefaultVO comDefaultVO, ModelMap model) throws Exception {

        /** EgovPropertyService.sample */
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

        model.addAttribute(GridVar.gridView, dacPrcService.selectSvcPrtiSpCdIs01(comDefaultVO));

        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", comDefaultVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }

    /**
     * @Method Name : selectUserList
     * @작성일 : 2023. 3. 13.
     * @작성자 : parkgu
     * @Method 설명 : 심의 담당자 선택용 목록 조회
     *  <p>
     *  </p>
     * @return : ModelAndView
     */
    @RequestMapping("/selectUserList.do")
    public ModelAndView selectUserList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
        Map<String, String> param2 = new HashMap<String, String>();
        param2.put("prtiId", param.get("prtiId") + "");
        param2.put("userNm", param.get("userNm") + "");

        List<Map<String, Object>> userList = dacPrcService.selectUserList(param2);
        ModelAndView mav = new ModelAndView("jsonView");
        mav.addObject("userList", userList);
        return mav;
    }

    /**
      * @Method Name : saveUserRvwPrncYn
      * @작성일 : 2023. 3. 10.
      * @작성자 : parkgu
      * @Method 설명 : 기관 심의자 여부 저장
      *  <p>
      *  </p>
      * @param : gridParameterMap
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveUserRvwPrncYn.do")
    public ModelAndView saveUserRvwPrncYn(GridParameterMap gridParameterMap, ModelMap model) throws Exception {

        dacPrcService.saveUserRvwPrncYn(gridParameterMap);

        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }
}
