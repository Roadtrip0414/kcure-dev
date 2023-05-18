package kcure.portal.dit.plb.mdl.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.dit.plb.mdl.service.impl
  * @FileName : PlbMdlDAO.java
  * @since : 2023. 3. 21.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	공공라이브러리 데이터모델 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("PlbMdlDAO")
public class PlbMdlDAO extends EgovComAbstractDAO{
	private static final String sqlNameSpace = "ditPlb.";

	/**
	  * @Method Name : selectLclsNmList
	  * @작성일 : 2023. 3. 21.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공공라이브러리 기관명 조회
	  *  </p>
	  * @param : Map<String,Object>
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectLclsNmList(Map<String,Object> map) throws Exception {
		return selectList(sqlNameSpace+"selectLclsNmList", map);
	}

	/**
	 * @Method Name : selectTblEnmList
	 * @작성일 : 2023. 3. 21.
	 * @작성자 : hjjeon
	 * @Method 설명 :
	 *  <p>
	 *  	공공라이브러리 테이블명 조회
	 *  </p>
	 * @param : Map<String,Object>
	 * @return : List<Map<String, Object>>
	 */
	public List<Map<String, Object>> selectTblEnmList(Map<String,Object> map) throws Exception {
		return selectList(sqlNameSpace+"selectTblEnmList", map);
	}

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
	public List<Map<String, Object>> selectColKnmList(Map<String,Object> map) throws Exception {
		return selectList(sqlNameSpace+"selectColKnmList", map);
	}
}
