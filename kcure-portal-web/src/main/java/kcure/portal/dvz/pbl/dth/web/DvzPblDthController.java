package kcure.portal.dvz.pbl.dth.web;

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

import kcure.portal.dvz.pbl.dth.service.DvzPblDthService;
import kcure.portal.dvz.pbl.ocr.service.DvzPblOcrService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.dvz.pbl.dth.web
 * @FileName : DvzPblDthController.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	데이터시각화 공공라이브러리 암사망자에 대한 controller 클래스를 정의한다.
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
@RequestMapping("/portal/dvz/pbl/dth/")
public class DvzPblDthController {
	
	@Resource(name = "dvzPblOcrService")
	private DvzPblOcrService dvzPblOcrService;
	
	@Resource(name = "dvzPblDthService")
	private DvzPblDthService dvzPblDthService;
	
	/**
	 * @Method Name : viewDvzPblDth
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	암사망자 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
    @RequestMapping(value="viewDvzPblDth.do")
    public String viewDvzPblDth(@RequestParam HashMap<String, Object> commandMap, ModelMap model) throws Exception {
    	String statsPbiCncrKncd = (commandMap.get("statsPbiCncrKncd") != null) ? (String)commandMap.get("statsPbiCncrKncd") : "";
    	String vslzDataStatTpcd = (commandMap.get("vslzDataStatTpcd") != null) ? (String)commandMap.get("vslzDataStatTpcd") : "00";
    	String viewTitle = "모든 암";
    	
    	/* 레프트 메뉴 조회 S */
    	List<Map<String, Object>> dvzPblLeftMnuList = dvzPblOcrService.selectDvzPblLeftMnuList(commandMap);
    	
    	//선택된 메뉴가 없다면 최상위 메뉴를 셋팅
    	if ("".equals(statsPbiCncrKncd)) {
    		commandMap.put("statsPbiCncrKncd", statsPbiCncrKncd);
    		commandMap.put("vslzDataStatTpcd", vslzDataStatTpcd);
    	} else {
    		for (int i=0; i < dvzPblLeftMnuList.size(); i++) {
    			Map<String, Object> infoMap = dvzPblLeftMnuList.get(i);
    			
    			if (statsPbiCncrKncd.equals((String)infoMap.get("statCncrPblCd"))) {
    				viewTitle = (String)infoMap.get("statCncrPblCdNm");
    				
    				break;
    			}
    		}
    	}
    	/* 레프트 메뉴 조회 E */
    	
    	model.addAttribute("searchVO", commandMap);
    	model.addAttribute("viewTitle", viewTitle);
    	model.addAttribute("dvzPblLeftMnuList", dvzPblLeftMnuList);
    	
    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("statCdClsId", "1008");
    	model.addAttribute("deadCausSpcdList", dvzPblDthService.selectStsPblCdList(paramMap));	// 사망원인
    	
    	return "kcure/portal/dvz/pbl/ViewDvzPblDth";
    }
	
	/**
	 * @Method Name : selectDvzPblDthStatList
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  	통계결과 조회
	 * @param : model
	 * @return :
	 */
    @ResponseBody
    @RequestMapping(value="selectDvzPblDthStatList.do")
    public HashMap<String, Object> selectDvzPblDthStatList(@RequestParam HashMap<String, Object> commandMap, HttpServletRequest request) throws Exception {
    	String[] deadCausSpcd = (String[])request.getParameterValues("deadCausSpcd");
    	commandMap.put("deadCausSpcd", deadCausSpcd);
    	
    	List<Map<String, Object>> statList = dvzPblDthService.selectDvzPblDthStatList(commandMap);
    	
    	HashMap<String, Object> resultMap = new HashMap<>();
    	resultMap.put("result", "success");
    	resultMap.put("statList", statList);
    	
    	if ("00".equals((String)commandMap.get("vslzDataStatTpcd"))) {	//요약 그래프 : 도넛 데이터를 별도로 조회
        	List<Map<String, Object>> genderList = dvzPblDthService.selectDvzPblDthGenderStatList(commandMap);
        	resultMap.put("genderList", genderList);
		}
    	
    	return resultMap;
    }
}
