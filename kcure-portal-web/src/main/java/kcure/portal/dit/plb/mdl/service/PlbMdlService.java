package kcure.portal.dit.plb.mdl.service;

import java.util.List;
import java.util.Map;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.dit.plb.mdl.service
  * @FileName : PlbMdlService.java
  * @since : 2023. 3. 21.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	공공 라이브러리 데이터모델 Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface PlbMdlService {

	/**
	  * @Method Name : selectLclsNmList
	  * @작성일 : 2023. 3. 21.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	 공공라이브러리 기관명 조회
	  *  </p>
	  * @param : Map<String,Object>
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectLclsNmList(Map<String,Object> map) throws Exception;
	/**
	 * @Method Name : selectMclsNmList
	 * @작성일 : 2023. 3. 21.
	 * @작성자 : hjjeon
	 * @Method 설명 :
	 *  <p>
	 *  	공공라이브러리 테이블명 조회
	 *  </p>
	 * @param : Map<String,Object>
	 * @return : List<Map<String, Object>>
	 */
	public List<Map<String, Object>> selectTblEnmList(Map<String,Object> map) throws Exception;
	/**
	  * @Method Name : selectColKnmList
	  * @작성일 : 2023. 3. 21.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공공라이브러리 컬럼명 조회
	  *  </p>
	  * @param : Map<String,Object>
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectColKnmList(Map<String,Object> map) throws Exception;
}
