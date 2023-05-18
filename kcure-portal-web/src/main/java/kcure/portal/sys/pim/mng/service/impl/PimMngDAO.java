package kcure.portal.sys.pim.mng.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kcure.portal.sys.cmm.ComDefaultVO;
import kcure.portal.sys.cmm.service.impl.ComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.pim.mng.service.impl
  * @FileName : PimDAO.java
  * @since : 2023. 2. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	참여기관관리 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("pimMngDAO")
public class PimMngDAO extends ComAbstractDAO {

	/**
	  * @Method Name : selectPrtiList
	  * @작성일 : 2023. 2. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 : 참여기관 관리 목록
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String,Object>> selectPrtiList(ComDefaultVO comDefaultVO) throws Exception {
        return selectList("Pim.selectPrtiList", comDefaultVO);
    }

	/**
	  * @Method Name : selectPrtiListTotCnt
	  * @작성일 : 2023. 2. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 : 참여기관 관리 목록 총 갯수
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : int
	  */
	public int selectPrtiListTotCnt(ComDefaultVO comDefaultVO) throws Exception {
		return selectOne("Pim.selectPrtiListTotCnt", comDefaultVO);
	}

	/**
	  * @Method Name : insertPrti
	  * @작성일 : 2023. 2. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 : 참여기관 관리 저장
	  *  <p>
	  *  </p>
	  * @param : Map<String, Object>
	  * @return :
	  */
	public void insertPrti(Map<String, Object> map) throws Exception {
		insert("Pim.insertPrti", map);
	}

	/**
	  * @Method Name : updatePrti
	  * @작성일 : 2023. 2. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 : 참여기관 관리 수정
	  *  <p>
	  *  </p>
	  * @param : Map<String, Object>
	  * @return :
	  */
	public void updatePrti(Map<String, Object> map) throws Exception {
		insert("Pim.updatePrti", map);
	}

	/**
	  * @Method Name : deletePrti
	  * @작성일 : 2023. 2. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 : 참여기관 관리 삭제
	  *  <p>
	  *  </p>
	  * @param : Map<String, Object>
	  * @return :
	  */
	public void deletePrti(Map<String, Object> map) throws Exception {
		insert("Pim.deletePrti", map);
	}

	/**
	  * @Method Name : selectPrtiList
	  * @작성일 : 2023. 2. 1.
	  * @작성자 : hjjeon
	  * @Method 설명 : 기관코드 콤보 조회
	  *  <p>
	  *  </p>
	  * @param : String
	  * @return : List
	  */
	public List<?> selectPrtiAllList(String param) throws Exception {
		return selectList("Pim.selectPrtiAllList", param);
	}

	/**
	  * @Method Name : selectPrtiNm
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	기관명 조회
	  *  </p>
	  * @param : 기관ID String
	  * @return : 기관명 String
	  */
	public String selectPrtiNm(String param) throws Exception {
		return selectOne("Pim.selectPrtiNm", param);
	}
}
