package kcure.portal.cmn.api.cry.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kcure.portal.cmn.api.cmm.Constants;
import kcure.portal.cmn.api.cmm.ResultAuthVo;
import kcure.portal.cmn.api.cry.service.CryService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.api.cry.web
 * @FileName : CryController.java
 * @since : 2023. 2. 20.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 : VDI 반출신청 API Controller
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
@RequestMapping({Constants.API.API_PREFIX + Constants.API.API_CRY})
public class CryController {

	/**
	 * 반출신청 API Service
	 */
	@Autowired
	private CryService cryService;

	/**
     * @Method Name : cryAply
     * @작성일 : 2023. 2. 13.
     * @작성자 : bhs
     * @Method 설명 : VDI 반출신청 처리
     *  <p>
     *  </p>
     * @param : Map<String, Object>
     * @return : ResultVo
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@PostMapping(value = {"/cryAply"}, produces = Constants.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<ResultAuthVo> cryAply(@RequestBody Map<String, Object> requestMap) throws Exception {
		Map<String, Object> rMap = new HashMap<String, Object>();
		try {
			rMap = cryService.updateDttoAplc(requestMap);
		}catch(Exception e) {
			return ResponseEntity.ok(new ResultAuthVo(Constants.API.API_FAIL, e));
		}
		return ResponseEntity.ok(new ResultAuthVo(rMap, Constants.API.API_SUCCESS));
    }


}
