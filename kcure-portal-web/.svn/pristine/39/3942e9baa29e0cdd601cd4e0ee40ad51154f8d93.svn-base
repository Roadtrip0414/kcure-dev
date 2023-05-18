package kcure.portal.dvz.clc.brs.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.tags.service.TagsService;
import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;
import kcure.portal.dvz.clc.brs.service.DvzClcBrsService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.dvz.clc.brs.web
 * @FileName : DvzClcBrsController.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터시각화 임상라이브러리 유방암에 대한 controller 클래스를 정의한다.
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
@RequestMapping("/portal/dvz/clc/brs/")
public class DvzClcBrsController {
	
	@Resource(name = "dvzClcBrsService")
	private DvzClcBrsService dvzClcBrsService;
	
	@Resource(name = "TagsService")
	private TagsService tagsService;
	
	/**
	 * @Method Name : viewDvzClcBrs
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	유방암 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewDvzClcBrs.do")
    public String viewDvzClcBrs(@RequestParam HashMap<String, Object> commandMap, ModelMap model) throws Exception {
    	LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	if (sessionVo != null && "03".equals(sessionVo.getUserStcd())) {
    		commandMap.put("menuAuthYn", "Y");
    	} else {
    		commandMap.put("menuAuthYn", "N");
    	}
    	
    	String topVslzMenuId = (commandMap.get("topVslzMenuId") != null) ? (String)commandMap.get("topVslzMenuId") : "";
    	String subVslzMenuId = (commandMap.get("subVslzMenuId") != null) ? (String)commandMap.get("subVslzMenuId") : "";
    	String frtVslzMenuId = (commandMap.get("frtVslzMenuId") != null) ? (String)commandMap.get("frtVslzMenuId") : "";
    	String srchVslzMenuId = (commandMap.get("srchVslzMenuId") != null) ? (String)commandMap.get("srchVslzMenuId") : "";
    	String smryStatsNo = (commandMap.get("smryStatsNo") != null) ? (String)commandMap.get("smryStatsNo") : "";
    	String viewTitle = "";
    	
    	if ("".equals(topVslzMenuId)) commandMap.put("topVslzMenuId", "BRS");		//유방암
    	
    	/* 화면 상단 정보 조회 S */
    	List<Map<String, Object>> dvzClcTopMnuList = dvzClcBrsService.selectDvzClcTopMnuList(commandMap);	//최상위 메뉴 조회
    	
    	for (int i=0; i < dvzClcTopMnuList.size(); i++) {
    		Map<String, Object> infoMap = dvzClcTopMnuList.get(i);
    		viewTitle = (String)infoMap.get("hghrVslzMenuNm") + " " + (String)infoMap.get("vslzMenuNm");
    		
    		if ("".equals(subVslzMenuId)) {
    			commandMap.put("subVslzMenuId", (String)infoMap.get("vslzMenuId"));
    			
    			break;
    		} else {
    			if (subVslzMenuId.equals((String)infoMap.get("vslzMenuId"))) break;
    		}
    	}
    	/* 화면 상단 정보 조회 E */
    	
    	/* 레프트 메뉴 조회 S */
    	List<Map<String, Object>> dvzClcLeftMnuList = dvzClcBrsService.selectDvzClcLeftMnuList(commandMap);
    	
    	//선택된 메뉴가 없다면 최상위 메뉴를 셋팅
    	if ("".equals(srchVslzMenuId)) {
    		for (int i=0; i < dvzClcLeftMnuList.size(); i++) {
    			Map<String, Object> infoMap = dvzClcLeftMnuList.get(i);
    			
    			if (infoMap.get("smryStatsNo") != null && !"".equals((String)infoMap.get("smryStatsNo"))) {
    				srchVslzMenuId = (String)infoMap.get("vslzMenuId");
    				smryStatsNo = (String)infoMap.get("smryStatsNo");
    				
    				//하위 메뉴일 경우 상위 메뉴값 셋팅
    				if (Integer.parseInt(infoMap.get("depLv")+"") > 1) frtVslzMenuId = (String)infoMap.get("hghrVslzMenuId");
    				
    				break;
    			}
    		}
    		
    		commandMap.put("frtVslzMenuId", frtVslzMenuId);
    		commandMap.put("srchVslzMenuId", srchVslzMenuId);
    		commandMap.put("smryStatsNo", smryStatsNo);
    	}
    	/* 레프트 메뉴 조회 E */
    	
    	model.addAttribute("dvzClcTopMnuList", dvzClcTopMnuList);
    	model.addAttribute("viewTitle", viewTitle);
    	model.addAttribute("searchVO", commandMap);
    	model.addAttribute("dvzClcLeftMnuList", dvzClcLeftMnuList);
    	model.addAttribute("mnuDtlInfo", dvzClcBrsService.selectDvzClcMnuDtl(commandMap));	//메뉴 상세 정보 조회
    	
    	/* 검색조건 셋팅 S */
    	ComCdDetailVo comCd = new ComCdDetailVo();
    	
    	comCd.setGrpCd("VSLZ_CHART_TPCD");
    	model.addAttribute("chartTpcdList", tagsService.searchCommonCodeDetailList(comCd));	// 그래프 출력 유형
    	
    	comCd.setGrpCd("VSLZ_DATA_EXPR_TPCD");
    	model.addAttribute("dataExprTpcdList", tagsService.searchCommonCodeDetailList(comCd));	// 데이터 수치 표현
    	
    	HashMap<String, Object> paramMap = new HashMap<>();
    	
    	paramMap.put("statCdClsId", "9011");
    	model.addAttribute("gndrCdList", dvzClcBrsService.selectStsClncCdList(paramMap));	// 성별
    	
    	paramMap.put("statCdClsId", "9000");
    	model.addAttribute("prtiCdList", dvzClcBrsService.selectStsClncCdList(paramMap));	// 기관
    	
    	paramMap.put("statCdClsId", "9012");
    	model.addAttribute("ageCdList", dvzClcBrsService.selectStsClncCdList(paramMap));	// 연령
    	
    	model.addAttribute("yrList", dvzClcBrsService.selectStsClncYrList(paramMap));	// 연도
    	/* 검색조건 셋팅 E */
    	
    	return "kcure/portal/dvz/clc/ViewDvzClcBrs";
    }
	
	/**
	 * @Method Name : selectDvzClcStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	통계결과 조회
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectDvzClcStatList.do")
    public HashMap<String, Object> selectDvzClcStatList(@RequestParam HashMap<String, Object> commandMap, HttpServletRequest request) throws Exception {
    	String[] gndrCd = (String[])request.getParameterValues("gndrCd");
    	String[] ageCd = (String[])request.getParameterValues("ageCd");
    	String[] critYr = (String[])request.getParameterValues("critYr");
    	String[] prtiCd = (String[])request.getParameterValues("prtiCd");
    	commandMap.put("gndrCd", gndrCd);
    	commandMap.put("ageCd", ageCd);
    	commandMap.put("critYr", critYr);
    	commandMap.put("prtiCd", prtiCd);
    	
    	List<Map<String, Object>> statList = dvzClcBrsService.selectDvzClcStatList(commandMap);
    	
    	HashMap<String, Object> resultMap = new HashMap<>();
    	resultMap.put("result", "success");
    	resultMap.put("statList", statList);
    	
    	return resultMap;
    }
}
