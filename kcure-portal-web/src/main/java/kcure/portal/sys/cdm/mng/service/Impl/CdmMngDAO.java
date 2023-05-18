package kcure.portal.sys.cdm.mng.service.Impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;


/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.cdm.mng.service.Impl
  * @FileName : CdmMngDAO.java
  * @since : 2023. 3. 8.
  * @version 1.0
  * @author : jyk
  * @프로그램 설명 :	공통 코드 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("cdmManageDAO")
public class CdmMngDAO extends EgovComAbstractDAO{

	private static final String sqlNameSpace = "cdmManageDAO.";

	/**
	  * @Method Name : selectGrpCdList
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	마스터코드목록,검색목록을 조회
	  *  </p>
	  * @param : CdmMngGrpVO
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String , Object>>selectGrpCdList(CdmMngGrpVO vo)throws Exception{
		return selectList(sqlNameSpace + "selectGrpCdList", vo);
	}

	/**
	  * @Method Name : selectGrpCdListTotCnt
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	마스터코드목록,검색목록 총건수를 조회한다.
	  *  </p>
	  * @param : CdmMngGrpVO
	  * @return : int
	  */
	public int selectGrpCdListTotCnt(CdmMngGrpVO vo) {
		return (Integer)selectOne(sqlNameSpace + "selectGrpCdListTotCnt", vo);
	}

	/**
	  * @Method Name : insertGrpCd
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	마스터코드  등록
	  *  </p>
	  * @param : CdmMngGrpVO
	  * @return :
	  */
	public void insertGrpCd(CdmMngGrpVO vo){
		insert(sqlNameSpace + "insertGrpCd", vo);
	}

	/**
	  * @Method Name : updateGrpCd
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	마스터코드  수정
	  *  </p>
	  * @param : CdmMngGrpVO
	  * @return :
	  */
	public void updateGrpCd(CdmMngGrpVO vo){
		update(sqlNameSpace + "updateGrpCd", vo);
	}

	/**
	  * @Method Name : deleteGrpCd
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	마스터코드 기본정보 및 URL을 삭제
	  *  </p>
	  * @param : CdmMngGrpVO
	  * @return :
	  */
	public void deleteGrpCd(CdmMngGrpVO vo){
		delete(sqlNameSpace + "deleteGrpCd", vo);
	}

	/**
	  * @Method Name : selectDetailCdList
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	상세코드 목록을 조회
	  *  </p>
	  * @param : CdmMngDetailVO
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectDetailCdList(CdmMngDetailVO vo) throws Exception{
		return selectList(sqlNameSpace + "selectDetailCdList", vo);
	}

	/**
	  * @Method Name : selectDetailCdListTotCnt
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	상세코드 총건수를 조회한다.
	  *  </p>
	  * @param : CdmMngDetailVO
	  * @return : int
	  */
	public int selectDetailCdListTotCnt(CdmMngDetailVO vo) {
		return (Integer)selectOne(sqlNameSpace + "selectDetailCdListTotCnt", vo);
	}

	/**
	  * @Method Name : insertDetailCd
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	상세코드  등록
	  *  </p>
	  * @param : CdmMngDetailVO
	  * @return :
	  */
	public void insertDetailCd(CdmMngDetailVO vo){
		insert(sqlNameSpace + "insertDetailCd", vo);
	}

	/**
	  * @Method Name : updateDetailCd
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	상세코드  수정
	  *  </p>
	  * @param : Map<String,Object>
	  * @return :
	  */
	public void updateDetailCd(Map<String,Object> vo){
		update(sqlNameSpace + "updateDetailCd", vo);
	}

	/**
	  * @Method Name : deleteDetailCd
	  * @작성일 : 2023. 3. 8.
	  * @작성자 : jyk
	  * @Method 설명 :
	  *  <p>
	  *  	상세코드 기본정보 삭제
	  *  </p>
	  * @param : Map<String,Object>
	  * @return :
	  */
	public void deleteDetailCd(Map<String,Object> vo){
		delete(sqlNameSpace + "deleteDetailCd", vo);
	}
}
