package kcure.portal.sys.rsr.ext.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.com.service.ComService;
import kcure.portal.sys.com.service.impl.ComVO;
import kcure.portal.sys.rsr.ext.web.service.RsrDataExtService;
import kcure.portal.sys.rsr.ext.web.service.impl.RsrDataExtSearchVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.rsr.ext.web
 * @FileName : RsrDataExtController.java
 * @since : 2023.05.10
 * @version 1.0
 * @author : pgj
 * @프로그램 설명 : 데이터 연장 / 보관 관리
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
@RequestMapping("/portal/sys/rsr/ext")
public class RsrDataExtController {

	@Resource(name = "rsrDataExtService")
	private RsrDataExtService rsrDataExtService;
	
	@Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
	
	@Resource(name = "comService")
    private ComService comService;
	
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    // 진생항태 리스트
    @ResponseBody
    @RequestMapping(value="/getExtGridCombo.do")
    public List<?> getGridCombo(@RequestParam("gbCd") String gbCd, ModelMap model) throws Exception {
    	ComVO searchVO = new ComVO();
		searchVO.setGrpCd(gbCd); // 진행상태
    	List<?> comboList = rsrDataExtService.selectExtComCodeList(searchVO);
    	return comboList;
    }
    
    // 리스트 화면
	@RequestMapping(value="/viewDataExtAplc.do")
    public String viewDataExtAplc(ModelMap model) throws Exception {
		
		ComVO searchVO = new ComVO();
		searchVO.setGrpCd("EXTD"); // 진행상태
		model.addAttribute("extdProgStcd", rsrDataExtService.selectExtComCodeList(searchVO));
		
		searchVO.setGrpCd("EXTD_STCD"); // 연장구분
		model.addAttribute("extdStcdList", comService.selectComList(searchVO));
		
        return "kcure/portal/sys/rsr/ext/ViewDataExtAplc";
    }
	
	// 그리드 리스트
	@RequestMapping(value="/selectDataExtAplcList.do")
    public ModelAndView selectDataExtAplcList(@ModelAttribute("searchVO") RsrDataExtSearchVO searchVO, ModelMap model) throws Exception {
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
        
        model.addAttribute(GridVar.gridView, rsrDataExtService.selectDataExtAplcList(searchVO));

        int totCnt = rsrDataExtService.selectDataExtAplcTotCnt(searchVO);
        paginationInfo.setTotalRecordCount(totCnt);

        model.addAttribute(GridVar.gridPage, paginationInfo);
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        return modelAndView;
    }
	
	// 상세화면
	@RequestMapping(value="/detailDataExtAplc.do")
    public String detailDataExtAplc(@ModelAttribute("searchVO") RsrDataExtSearchVO searchVO, ModelMap model) throws Exception {
		
		Map<String, Object> detail = rsrDataExtService.detailDataExtAplc(searchVO);
		model.addAttribute("detail", detail);
		
        return "kcure/portal/sys/rsr/ext/DetailDataExtAplc";
    }
	
	// 승인 반려
	@RequestMapping(value="/updateDataExtAplc.do")
    public String updateDataExtAplc(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {

    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        param.put("userId", user.getId());
        
        RsrDataExtSearchVO searchVO = new RsrDataExtSearchVO();
		searchVO.setRsrAsmtNo((String)param.get("rsrAsmtNo"));
		searchVO.setExtdAplcNo((String)param.get("extdAplcNo"));
		searchVO.setDataAplcNo((String)param.get("dataAplcNo"));
		Map<String, Object> detail = rsrDataExtService.detailDataExtAplc(searchVO);
		
		if(!"U01".equals(detail.get("extdProgStcd"))) {
			throw new Exception("신청 상태가 아님");
		}
		
		if("03".equals(detail.get("dataTpcd"))) { // 유형이 결합이면 대상아님
			throw new Exception("유형 오류");
		}
		
		if(param.get("extdProgStcd") == null || "".equals(param.get("extdProgStcd"))) {
			throw new Exception("승인여부 값이 없음");
		}
		
		boolean extdProgStBool = "Y".equals(param.get("extdProgStcd")) ? true : false;
		
		String extdProgStcd = extdProgStBool ? "U02" : "U03"; // U02: 승인, U03: 반려
		param.put("extdProgStcd", extdProgStcd);
		String rjcRsnCont = !extdProgStBool ? (String)param.get("rjcRsnCont") : ""; //반려사유
		
		if("U03".equals(extdProgStcd) && (rjcRsnCont == null || rjcRsnCont.trim().length() == 0)) { // 반려시에는 반류사유 필요
			throw new Exception("반려사유 오류");
		}
		
		param.put("rjcRsnCont", rjcRsnCont); // 반려사유
		
		if("04".equals(detail.get("extdStcd"))) { // IRB연구기간 연장 심의
			String rsrEdt = extdProgStBool ? (String)param.get("rsrEdt") : ""; // 연장일자
			if(extdProgStBool) {
				if(rsrEdt == null || rsrEdt.length() != 10) {
					throw new Exception("연장날짜 오류");
				}
				rsrEdt = rsrEdt.replaceAll("-", "");
			}
			param.put("rsrEdt", rsrEdt); // 연장날짜
			
		} else { // 가상화사용연장 / 보관연장 / 재사용
			String clncPblInpAmtStr = extdProgStBool ? (String)param.get("clncPblInpAmt") : ""; // 임상공공입력금액
			long clncPblInpAmt = 0; // 임상공공입력금액
			long clncPblStlmAmt = 0; // 임상공공결제금액
			if(extdProgStBool) {
				if(clncPblInpAmtStr == null || clncPblInpAmtStr.length() == 0) {
					throw new Exception("임상공공입력금액 오류");
				}
				clncPblInpAmtStr = clncPblInpAmtStr.replace(",", "");
				try {
					clncPblInpAmt = Long.parseLong(clncPblInpAmtStr); 
					param.put("clncPblInpAmt", clncPblInpAmt);  // 심상공공입력금액
					
					if(!"02".equals(detail.get("extdStcd"))) { // 보관이 아닌경우 감면율 적용
						if(detail.get("rdcRt") != null && !"0".equals(detail.get("rdcRt")) && clncPblInpAmt > 0) { // 입력금액이 0보다 크고 감면비율값이 있는 경우 
							int rdcRt = Integer.parseInt(detail.get("rdcRt")+"");
							clncPblStlmAmt = clncPblInpAmt - (long)(clncPblInpAmt * (float) rdcRt / 100);
							param.put("clncPblStlmAmt", clncPblStlmAmt); // 임상공공결제금액(감면율 적용)
						} else {
							clncPblStlmAmt = clncPblInpAmt;
							param.put("clncPblStlmAmt", clncPblInpAmt); // 임상공공결제금액(감면율 없어 입력값과 동일)
						}
						
						if(clncPblStlmAmt == 0) { // 임상공공결제금액이 0이면 결제완료 처리
							param.put("extdProgStcd", "U05"); // 결제 완료
						}
					} else { // 보관인 경우
						param.put("clncPblStlmAmt", clncPblInpAmt); // 임상공공결제금액(감면율 없어 입력값과 동일)
					}
				} catch(NumberFormatException e) {
					throw new Exception("임상공공입력금액 오류");
				}
			}
		}

		param.put("extdStcd", detail.get("extdStcd")); // 구분(종류)
		
		// 결제완료 처리시 필요한 정보 시작
		param.put("rsrSdt", detail.get("rsrSdt")); // 연구시작일자
		param.put("rsrEdt", detail.get("rsrEdt")); // 연구종료일자
		param.put("dtuSdt", detail.get("dtuSdt")); // 데이터활용시작일자
		param.put("dtuEdt", detail.get("dtuEdt")); // 데이터활용종료일자
		param.put("dataKepSdt", detail.get("dataKepSdt")); // 데이터보관시작일자
		param.put("dataKepEdt", detail.get("dataKepEdt")); // 데이터보관종료일자
		param.put("dataRndmKepSdt", detail.get("dataRndmKepSdt")); // 데이터임의보관시작일자
		param.put("dataRndmKepEdt", detail.get("dataRndmKepEdt")); // 데이터임의보관종료일자
		// 결제완료 처리시 필요한 정보 종료
		
		param.put("bfrExtdProgStcd", "U01"); // 업데이트를 위한 이전 상태값(신청)

        rsrDataExtService.updateDataExtAplc(param);

        return "redirect:/portal/sys/rsr/ext/viewDataExtAplc.do";
    }
	
	// 결제 완료 처리
	@RequestMapping(value="/updateDataExtAplcCpl.do")
    public String updateDataExtAplcCpl(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        param.put("userId", user.getId());
        
        RsrDataExtSearchVO searchVO = new RsrDataExtSearchVO();
		searchVO.setRsrAsmtNo((String)param.get("rsrAsmtNo"));
		searchVO.setExtdAplcNo((String)param.get("extdAplcNo"));
		searchVO.setDataAplcNo((String)param.get("dataAplcNo"));
		Map<String, Object> detail = rsrDataExtService.detailDataExtAplc(searchVO);
		
		if(!"U02".equals(detail.get("extdProgStcd"))) { // 승인이 아니면 결제 처리를 진행 할 수 없다.
			throw new Exception("승인 상태가 아님");
		}
		
		if("03".equals(detail.get("dataTpcd"))) { // 유형이 결합이면 대상아님
			throw new Exception("유형 오류");
		}
		
		if("04".equals(detail.get("extdStcd"))) { // IRB연장은 결제 대상이 아님
			throw new Exception("연장 구분 오류");
		}
 		
		// 결제완료 처리시 필요한 정보 시작
		param.put("extdStcd", detail.get("extdStcd")); // 연장구분코드
		param.put("extdProgStcd", "U05"); // 결제완료상태 값
		
		param.put("rsrSdt", detail.get("rsrSdt")); // 연구시작일자
		param.put("rsrEdt", detail.get("rsrEdt")); // 연구종료일자
		param.put("dtuSdt", detail.get("dtuSdt")); // 데이터활용시작일자
		param.put("dtuEdt", detail.get("dtuEdt")); // 데이터활용종료일자
		param.put("dataKepSdt", detail.get("dataKepSdt")); // 데이터보관시작일자
		param.put("dataKepEdt", detail.get("dataKepEdt")); // 데이터보관종료일자
		param.put("dataRndmKepSdt", detail.get("dataRndmKepSdt")); // 데이터임의보관시작일자
		param.put("dataRndmKepEdt", detail.get("dataRndmKepEdt")); // 데이터임의보관종료일자
		// 결제완료 처리시 필요한 정보 종료
		
		param.put("bfrExtdProgStcd", "U02"); // 업데이트를 위한 이전 상태값(승인)
		
		rsrDataExtService.updateDataExtAplcCpl(param, true);
		return "redirect:/portal/sys/rsr/ext/viewDataExtAplc.do";
	}
}
