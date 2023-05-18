package kcure.portal.dit.clb.mdl.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.dit.clb.mdl.service.impl
  * @FileName : ClbMdlDAO.java
  * @since : 2023. 3. 21.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	암 임상라이브러리 데이터모델 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("ClbMdlDAO")
public class ClbMdlDAO extends EgovComAbstractDAO{
	private static final String sqlNameSpace = "ditClb.";

	/**
	  * @Method Name : selectCrcnNmList
	  * @작성일 : 2023. 3. 21.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	임상라이브러리 암좀 목록 조회 (1단계)
	  *  </p>
	  * @param : Map<String,Object>
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectCrcnNmList(Map<String,Object> map) throws Exception {
		return selectList(sqlNameSpace+"selectCrcnNmList", map);
	}

	/**
	  * @Method Name : selectLclsNmList
	  * @작성일 : 2023. 3. 21.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	임상라이브러리 암종 테이블명 조회 (2단계)
	  *  </p>
	  * @param : Map<String,Object>
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectLclsNmList(Map<String,Object> map) throws Exception {
		return selectList(sqlNameSpace+"selectLclsNmList", map);
	}

	/**
	 * @Method Name : selectMclsNmList
	 * @작성일 : 2023. 3. 21.
	 * @작성자 : hjjeon
	 * @Method 설명 :
	 *  <p>
	 *  	임상라이브러리 암종 테이블명 조회 (3단계)
	 *  </p>
	 * @param : Map<String,Object>
	 * @return : List<Map<String, Object>>
	 */
	public List<Map<String, Object>> selectMclsNmList(Map<String,Object> map) throws Exception {
		return selectList(sqlNameSpace+"selectMclsNmList", map);
	}

	/**
	  * @Method Name : selectColKnmList
	  * @작성일 : 2023. 3. 21.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	임상라이브러리 암종 컬럼명 조회
	  *  </p>
	  * @param : Map<String,Object>
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectColKnmList(Map<String,Object> map) throws Exception {
		return selectList(sqlNameSpace+"selectColKnmList", map);
	}
}
