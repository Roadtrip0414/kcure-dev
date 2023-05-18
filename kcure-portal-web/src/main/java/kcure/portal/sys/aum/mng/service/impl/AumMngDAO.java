package kcure.portal.sys.aum.mng.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.springframework.stereotype.Repository;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.aum.service.impl
  * @FileName : AumDAO.java
  * @since : 2023. 1. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	권한관리에 대한 DAO 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("aumMngDAO")
public class AumMngDAO extends EgovComAbstractDAO {

    /**
      * @Method Name : selectAuthorList
      * @작성일 : 2023. 1. 4.
      * @작성자 : hjjeon
      * @Method 설명 : 권한목록을 조회한다.
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : List<Map<String,Object>>
      */
	public List<Map<String,Object>> selectAuthorList(ComDefaultVO comDefaultVO) throws Exception {
        return selectList("Aum.selectAuthorList", comDefaultVO);
    }

    /**
      * @Method Name : selectAuthorListTotCnt
      * @작성일 : 2023. 1. 4.
      * @작성자 : hjjeon
      * @Method 설명 : 권한목록 총 갯수를 조회한다.
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : int
      */
    public int selectAuthorListTotCnt(ComDefaultVO comDefaultVO)  throws Exception {
        return (Integer)selectOne("Aum.selectAuthorListTotCnt", comDefaultVO);
    }

	/**
	 * 권한을 등록한다.
	 * @param map Map<String,Object>
	 * @exception Exception
	 */
    public void insertAuthor(Map<String,Object> map) throws Exception {
        insert("Aum.insertAuthor", map);
    }

    /**
	 * 권한을 수정한다.
	 * @param map Map<String,Object>
	 * @exception Exception
	 */
    public void updateAuthor(Map<String,Object> map) throws Exception {
        update("Aum.updateAuthor", map);
    }

    /**
	 * 권한을 삭제한다.
	 * @param map Map<String,Object>
	 * @exception Exception
	 */
    public void deleteAuthor(Map<String,Object> map) throws Exception {
        delete("Aum.deleteAuthor", map);
    }

	/**
	  * @Method Name : viewAllAuth
	  * @작성일 : 2023. 1. 26.
	  * @작성자 : hjjeon
	  * @Method 설명 : 모든 권한 조회(사용여부:Y)
	  *  <p>
	  *  </p>
	  * @param :
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectAuthAllList() throws Exception {
		return selectList("Aum.selectAuthAllList");
	}

	/**
	  * @Method Name : viewAllAuthTotCnt
	  * @작성일 : 2023. 1. 26.
	  * @작성자 : hjjeon
	  * @Method 설명 : 모든권한 목록 총 갯수(사용여부:Y)
	  *  <p>
	  *  </p>
	  * @param :
	  * @return : int
	  */
	public int selectAuthAllListTotCnt() throws Exception {
		return selectOne("Aum.selectAuthAllListTotCnt");
	}
}
