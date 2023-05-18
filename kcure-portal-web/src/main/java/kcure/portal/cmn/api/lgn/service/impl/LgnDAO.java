package kcure.portal.cmn.api.lgn.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.api.export.service.impl
  * @FileName : ExportDAO.java
  * @since : 2023. 2. 27.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : VDI 로그인 검증 API DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("lgnDAO")
public class LgnDAO extends EgovComAbstractDAO{
	/**
	  * @Method Name : selectSvcDataAplcList
	  * @작성일 : 2023. 2. 27.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	연구자ID로 연구 정보 조회
	  *  </p>
	  * @param : userId String
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectSvcDataAplcList(String userId) throws Exception {
		return selectList("Api.selectSvcDataAplcList", userId);
	}

	/**
	  * @Method Name : selectSvcDataAplcRvwList
	  * @작성일 : 2023. 2. 27.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	심의자ID로 심의 정보 조회
	  *  </p>
	  * @param : userId String
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectSvcDataAplcRvwList(String userId) throws Exception {
		return selectList("Api.selectSvcDataAplcRvwList", userId);
	}

	/**
	  * @Method Name : selectSvcAttfList
	  * @작성일 : 2023. 2. 28.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	연구 첨부파일 조회
	  *  </p>
	  * @param : dataAplcNo String
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectSvcAttfList(String dataAplcNo) throws Exception {
		return selectList("Api.selectSvcAttfList", dataAplcNo);
	}
}
