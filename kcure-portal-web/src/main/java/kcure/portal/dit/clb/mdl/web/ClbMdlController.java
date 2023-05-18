package kcure.portal.dit.clb.mdl.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kcure.portal.dit.clb.mdl.service.ClbMdlService;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.dit.clb.mdl.web
  * @FileName : ClbMdlController.java
  * @since : 2023. 3. 21.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	암 임상라이브러리 데이터모델 Controller
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
@RequestMapping("/portal/dit/clb/mdl")
public class ClbMdlController {

    @Resource(name = "ClbMdlService")
    private  ClbMdlService clbMdlService;

	/**
	  * @Method Name : viewClbDataModel
	  * @작성일 : 2023. 3. 22.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	임상라이브러리 데이터모델 화면 조회
	  *  </p>
	  * @param :
	  * @return :
	  */
	@RequestMapping(value ="/viewClbDataModel.do")
	public String viewClbDataModel(ModelMap model) throws Exception {
		Map<String, Object> requestMap = new HashMap<String, Object>();
		//임상라이브러리 데이터모델 1단계 조회 -> 위암, 유방암
		model.addAttribute("crcnNmList", clbMdlService.selectCrcnNmList(null));

		//baseline 2단계 조회
		requestMap.put("dtsLclsCd", "03");	//baseline
		List<Map<String,Object>> lclsNmList03 =  clbMdlService.selectLclsNmList(requestMap);
		model.addAttribute("lclsNmList03", lclsNmList03);

		return "kcure/portal/dit/clb/ViewClbDataModel";
	}

	/**
	  * @Method Name : selectCrcnNmList
	  * @작성일 : 2023. 3. 22.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	임상라이브러리 데이터모델 1단계 조회
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : ResponseEntity
	  */
	@RequestMapping(value ="/selectCrcnNmList.do")
	public ResponseEntity<Map<String,Object>> selectCrcnNmList(@RequestBody Map<String, Object> requestMap) throws Exception {
		Map<String,Object> retrunMap = new HashMap<String, Object>();
		List<Map<String,Object>> resultList = clbMdlService.selectCrcnNmList(requestMap);
		retrunMap.put("crcnNmList", resultList);
		return ResponseEntity.ok(retrunMap);
	}

	/**
	  * @Method Name : selectLclsNmList
	  * @작성일 : 2023. 3. 22.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	임상라이브러리 데이터모델 2단계 조회
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : ResponseEntity
	  */
	@RequestMapping(value ="/selectLclsNmList.do")
	public ResponseEntity<Map<String,Object>> selectLclsNmList(@RequestBody Map<String, Object> requestMap) throws Exception {
		Map<String,Object> retrunMap = new HashMap<String, Object>();
		List<Map<String,Object>> resultList = clbMdlService.selectLclsNmList(requestMap);
		retrunMap.put("lclsNmList", resultList);
		return ResponseEntity.ok(retrunMap);
	}

	/**
	  * @Method Name : selectMclsNmList
	  * @작성일 : 2023. 3. 22.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	임상라이브러리 데이터모델 3단계 조회
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : ResponseEntity
	  */
	@RequestMapping(value ="/selectMclsNmList.do")
	public ResponseEntity<Map<String,Object>> selectMclsNmList(@RequestBody Map<String, Object> requestMap) throws Exception {
		Map<String,Object> retrunMap = new HashMap<String, Object>();
		List<Map<String,Object>> resultList = clbMdlService.selectMclsNmList(requestMap);
		retrunMap.put("mclsNmList", resultList);
		return ResponseEntity.ok(retrunMap);
	}

	/**
	  * @Method Name : selectColKnmList
	  * @작성일 : 2023. 3. 22.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	임상라이브러리 데이터모델 테이블 컬럼명 조회
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : ResponseEntity
	  */
	@RequestMapping(value ="/selectColKnmList.do")
	public ResponseEntity<Map<String,Object>> selectColKnmList(@RequestBody Map<String, Object> requestMap) throws Exception {
		Map<String,Object> retrunMap = new HashMap<String, Object>();
		List<Map<String,Object>> resultList = clbMdlService.selectColKnmList(requestMap);
		retrunMap.put("colKnmList", resultList);
		return ResponseEntity.ok(retrunMap);
	}
}
