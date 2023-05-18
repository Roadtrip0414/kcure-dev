package kcure.portal.cmn.api.cry.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.api.cry.service.impl
  * @FileName : CryDAO.java
  * @since : 2023. 3. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : VDI 반출신청 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("cryDAO")
public class CryDAO extends EgovComAbstractDAO {

	/**
	  * @Method Name : updateDttoAplcYn
	  * @작성일 : 2023. 3. 3.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	반출여부 업데이트
	  *  </p>
	  * @param : map Map<String, Object>
	  * @return :
	  */
	public void updateDttoAplcYn(Map<String, Object> map) throws Exception {
		update("Api.updateDttoAplcYn", map);
	}
}
