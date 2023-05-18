package kcure.portal.cmn;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kcure.portal.cmn.service.KcureIndexService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn
 * @FileName : KcureIndexController.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	kcure 메인화면을 관리한다.
 * @see
 *
 *<pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023.02.01   kyh           최초생성
 *  </pre>
 */
@Controller
public class KcureIndexController {
	
	@Resource(name = "kcureIndexService")
	private KcureIndexService kcureIndexService;

	/**
	 * @Method Name : index
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  메인 화면을 호출한다.
	 * @param : model
	 * @return :
	 */
	@RequestMapping("/index.do")
	public String index(@RequestParam HashMap<String, Object> commandMap, ModelMap model) throws Exception {		
		
		List<Map<String, Object>> bbsNtcListAll = kcureIndexService.selectBbsNtcListForMain(commandMap);
		List<Map<String, Object>> bbsNtcList = new ArrayList<Map<String,Object>>();
		
		if(bbsNtcListAll.size() > 4) {
			bbsNtcList.add(bbsNtcListAll.get(0));
			bbsNtcList.add(bbsNtcListAll.get(1));
			bbsNtcList.add(bbsNtcListAll.get(2));
			bbsNtcList.add(bbsNtcListAll.get(3));
		} else {
			bbsNtcList.addAll(bbsNtcListAll);
		}
		
		model.addAttribute("bbsNtcList", bbsNtcList); //공지사항 리스트(메인화면용)
		//model.addAttribute("bbsFaqList", kcureIndexService.selectBbsFaqListForMain(commandMap)); //FAQ 리스트(메인화면용)
		
		return "kcure/portal/main";
	}
}