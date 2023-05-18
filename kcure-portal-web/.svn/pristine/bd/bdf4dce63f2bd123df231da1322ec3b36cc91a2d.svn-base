package kcure.portal.sys.etc.srv.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.springframework.stereotype.Repository;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.etc.service.impl
  * @FileName : EtcDAO.java
  * @since : 2023. 3. 29.
  * @version 1.0
  * @author : kyj
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
@Repository("EtcSrvDAO")
public class EtcSrvDAO extends EgovComAbstractDAO {

    /**
      * @Method Name : selectSrvyList
      * @작성일 : 2023. 3. 29.
      * @작성자 : kyj
      * @Method 설명 : 설문조사 목록을 조회한다.
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : List<Map<String,Object>>
      */
	public List<Map<String,Object>> selectSrvyList(ComDefaultVO comDefaultVO) throws Exception {
        return selectList("Etc.selectSrvyList", comDefaultVO);
    }

    /**
      * @Method Name : selectSrvyListTotCnt
      * @작성일 : 2023. 3. 29.
      * @작성자 : kyj
      * @Method 설명 : 설문조사 목록 개수를 조회한다.
      *  <p>
      *  </p>
      * @param : comDefaultVO ComDefaultVO
      * @return : int
      */
    public int selectSrvyListTotCnt(ComDefaultVO comDefaultVO)  throws Exception {
        return (Integer)selectOne("Etc.selectSrvyListTotCnt", comDefaultVO);
    }

	/**
	 * 새로운 설문조사 목록을 등록한다.
	 * @param map Map<String,Object>
	 * @exception Exception
	 */
    public void insertSrvy(Map<String,Object> map) throws Exception {
        insert("Etc.insertSrvy", map);
    }

    /**
	 * 설문조사 목록을 수정한다.
	 * @param map Map<String,Object>
	 * @exception Exception
	 */
    public void updateSrvy(Map<String,Object> map) throws Exception {
        update("Etc.updateSrvy", map);
    }

    /**
	 * 설문조사 목록을 삭제한다.
	 * @param map Map<String,Object>
	 * @exception Exception
	 */
    public void deleteSrvy(Map<String,Object> map) throws Exception {
        delete("Etc.deleteSrvy", map);
    }

  }