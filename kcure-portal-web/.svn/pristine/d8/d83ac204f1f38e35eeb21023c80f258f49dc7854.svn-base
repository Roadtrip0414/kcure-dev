package kcure.portal.cmn.api.prt.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kcure.portal.cmn.api.cmm.Constants;
import kcure.portal.cmn.api.cmm.ResultAuthVo;
import kcure.portal.cmn.api.prt.service.ApiPrtService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.api.prt.web
  * @FileName : ApiPrtController.java
  * @since : 2023. 3. 2.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	참여기관 API
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@RestController
@RequestMapping({Constants.API.API_PREFIX + Constants.API.API_PRT})
public class ApiPrtController {

	@Resource(name = "apiPrtService")
    private ApiPrtService apiPrtService;

	/**
	  * @Method Name : prtiFileDir
	  * @작성일 : 2023. 2. 28.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	참여기관에서 요청한 파일경로 조회
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : ResultAuthVo
	  */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@PostMapping(value = {"/prtiFileDir"}, produces = Constants.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ResultAuthVo> prtiFileDir(@RequestBody Map<String, Object> requestMap) throws Exception {

		String prtiId = String.valueOf(requestMap.get("prtiId"));
		String dataAplyNo = String.valueOf(requestMap.get("dataAplyNo"));

		Map<String, Object> rMap = new HashMap<String, Object>();

		try {
			rMap = apiPrtService.dataAplyExist(prtiId, dataAplyNo);
		}catch(Exception e) {
			return ResponseEntity.ok(new ResultAuthVo(Constants.API.API_FAIL, e));
		}

		return ResponseEntity.ok(new ResultAuthVo(rMap, Constants.API.API_SUCCESS));
	}

	/**
	  * @Method Name : prtiFileUpload
	  * @작성일 : 2023. 3. 3.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *		참여기관에서 요청한 파일 정보 업로드
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : ResultAuthVo
	  */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@PostMapping(value = {"/prtiFileUpload"}, produces = Constants.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ResultAuthVo> prtiFileUpload(@RequestBody Map<String, Object> requestMap) throws Exception {

		Map<String, Object> rMap = new HashMap<String, Object>();

		try {
			rMap = apiPrtService.insertAplyFile(requestMap);
		}catch(Exception e) {
			return ResponseEntity.ok(new ResultAuthVo(Constants.API.API_FAIL, e));
		}

		return ResponseEntity.ok(new ResultAuthVo(rMap, Constants.API.API_SUCCESS));
	}

}
