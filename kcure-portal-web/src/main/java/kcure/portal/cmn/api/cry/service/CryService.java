package kcure.portal.cmn.api.cry.service;

import java.util.Map;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.api.cry.service
  * @FileName : CryService.java
  * @since : 2023. 3. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	VDI 반출 신청 Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface CryService {
	/**
	  * @Method Name : updateDttoAplc
	  * @작성일 : 2023. 3. 3.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	반출신청 update
	  *  </p>
	  * @param : Map<String, Object>
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> updateDttoAplc(Map<String, Object> requestMap) throws Exception;
}
