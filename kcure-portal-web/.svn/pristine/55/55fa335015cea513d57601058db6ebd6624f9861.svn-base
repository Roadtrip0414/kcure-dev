package kcure.portal.dit.plb.mdl.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kcure.portal.dit.plb.mdl.service.PlbMdlService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.dit.plb.mdl.web
  * @FileName : PlbMdlController.java
  * @since : 2023. 3. 22.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	공공 임상라이브러리 데이터모델 Controller
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
@RequestMapping("/portal/dit/plb/mdl")
public class PlbMdlController {

    @Resource(name = "PlbMdlService")
    private  PlbMdlService plbMdlService;

	/**
	  * @Method Name : viewPlbDataModel
	  * @작성일 : 2023. 3. 22.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공공 임상라이브러리 데이터모델 화면 조회
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value ="/viewPlbDataModel.do")
	public String viewPlbDataModel(ModelMap model) throws Exception {
		Map<String, Object> requestMap = new HashMap<String, Object>();
		requestMap.put("dtsLclsCd", "04");	//공공
		List<Map<String,Object>> resultList =  plbMdlService.selectLclsNmList(requestMap);
		model.addAttribute("lclsNmList", resultList);
		return "kcure/portal/dit/plb/ViewPlbDataModel";
	}

	/**
	  * @Method Name : selectTblEnmList
	  * @작성일 : 2023. 3. 22.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공공라이브러리 데이터모델 3단계 조회
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : ResponseEntity
	  */
	@RequestMapping(value ="/selectTblEnmList.do")
	public ResponseEntity<Map<String,Object>> selectMclsNmList(@RequestBody Map<String, Object> requestMap) throws Exception {
		Map<String,Object> retrunMap = new HashMap<String, Object>();
		List<Map<String,Object>> resultList = plbMdlService.selectTblEnmList(requestMap);
		retrunMap.put("tblEnmList", resultList);
		return ResponseEntity.ok(retrunMap);
	}

	/**
	  * @Method Name : selectColKnmList
	  * @작성일 : 2023. 3. 22.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공공라이브러리 데이터모델 테이블 컬럼명 조회
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : ResponseEntity
	  */
	@RequestMapping(value ="/selectColKnmList.do")
	public ResponseEntity<Map<String,Object>> selectColKnmList(@RequestBody Map<String, Object> requestMap) throws Exception {
		Map<String,Object> retrunMap = new HashMap<String, Object>();
		List<Map<String,Object>> resultList = plbMdlService.selectColKnmList(requestMap);
		retrunMap.put("colKnmList", resultList);
		return ResponseEntity.ok(retrunMap);
	}
}
