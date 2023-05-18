package kcure.portal.cmn.api.lgn.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kcure.portal.cmn.api.cmm.Constants;
import kcure.portal.cmn.api.cmm.ResultAuthVo;
import kcure.portal.cmn.api.lgn.service.impl.LgnPrtiVO;
import kcure.portal.cmn.api.lgn.service.impl.LgnVdiVO;
import kcure.portal.sys.aum.usr.service.AumUsrService;
import kcure.portal.uat.uia.service.KcureLoginService;


/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.api.lgn.web
 * @FileName : LgnController.java
 * @since : 2023. 2. 15.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 : 로그인인증 API Controller
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
@RequestMapping({Constants.API.API_PREFIX + Constants.API.API_LGN})
public class LgnController {


	@Autowired
	private KcureLoginService kcureLoginService;

    /**
     * 사용자 권한 Service
     */
    @Resource(name = "aumUsrService")
    private AumUsrService aumUsrService;



	/**
     * @Method Name : vdiLogin
     * @작성일 : 2023. 2. 15.
     * @작성자 : bhs
     * @Method 설명 : VDI 로그인 인증 처리
     *  <p>
     *  </p>
     * @param : Map<String, Object>
     * @return : ResultAuthVo
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@PostMapping(value = {"/vdi/login"}, produces = Constants.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<ResultAuthVo> vdiLogin(@RequestBody Map<String, Object> requestMap) throws Exception {
		LgnVdiVO lgnVdiVO = new LgnVdiVO();

		try {
			String loginId = String.valueOf(requestMap.get("userId"));
			String password = String.valueOf(requestMap.get("loginPswd"));

			lgnVdiVO = kcureLoginService.apiVdiLoginCheck(loginId, password);

		}catch(Exception e) {
			return ResponseEntity.ok(new ResultAuthVo(Constants.API.API_FAIL, e));
		}

		return ResponseEntity.ok(new ResultAuthVo(lgnVdiVO, Constants.API.API_SUCCESS));
    }


	/**
     * @Method Name : prtiLogin
     * @작성일 : 2023. 2. 15.
     * @작성자 : bhs
     * @Method 설명 : 참여기관 로그인 인증 처리
     *  <p>
     *  </p>
     * @param : Map<String, Object>
     * @return : ResultAuthVo
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@PostMapping(value = {"/prti/login"}, produces = Constants.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<ResultAuthVo> prtiLogin(@RequestBody Map<String, Object> requestMap) throws Exception {
		LgnPrtiVO lgnPrtiVO = new LgnPrtiVO();

		try {
			String prtiId = String.valueOf(requestMap.get("prtiId"));
			String loginId = String.valueOf(requestMap.get("userId"));
			String password = String.valueOf(requestMap.get("loginPswd"));

			lgnPrtiVO = kcureLoginService.apiPrtiLoginCheck(prtiId, loginId, password);

		}catch(Exception e) {
			return ResponseEntity.ok(new ResultAuthVo(Constants.API.API_FAIL, e));
		}

		return ResponseEntity.ok(new ResultAuthVo(lgnPrtiVO, Constants.API.API_SUCCESS));
    }

	/**
	  * @Method Name : prtiAdminExist
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	참여기관 기관관리자 존재여부
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : Map<String, Object>
	  */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@PostMapping(value = {"/prti/adminExist"}, produces = Constants.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ResultAuthVo> prtiAdminExist(@RequestBody Map<String, Object> requestMap) throws Exception {

		Map<String, Object> rMap = new HashMap<String, Object>();
		try {
			rMap = aumUsrService.selectPrtiAdmin(String.valueOf(requestMap.get("prtiId")));
		}catch(Exception e) {
			return ResponseEntity.ok(new ResultAuthVo(Constants.API.API_FAIL, e));
		}

		return ResponseEntity.ok(new ResultAuthVo(rMap, Constants.API.API_SUCCESS));
	}


}
