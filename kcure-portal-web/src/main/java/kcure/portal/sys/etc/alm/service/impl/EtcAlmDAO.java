package kcure.portal.sys.etc.alm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.etc.alm.service.impl
  * @FileName : EtcAlmDAO.java
  * @since : 2023. 3. 31.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	 알림관리 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("EtcAlmDAO")
public class EtcAlmDAO extends EgovComAbstractDAO {

	/**
	  * @Method Name : selectNtceMsgList
	  * @작성일 : 2023. 3. 31.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	알림 관리 목록 조회
	  *  </p>
	  * @param : ComDefaultVO comDefaultVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectNtceMsgList(ComDefaultVO comDefaultVO) throws Exception {
        return selectList("EtcAlm.selectNtceMsgList", comDefaultVO);
    }

	/**
	  * @Method Name : selectNtceMsgListTotCnt
	  * @작성일 : 2023. 3. 31.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	알림 관리 목록 총 갯수
	  *  </p>
	  * @param : ComDefaultVO comDefaultVO
	  * @return : int
	  */
	public int selectNtceMsgListTotCnt(ComDefaultVO comDefaultVO) throws Exception {
        return selectOne("EtcAlm.selectNtceMsgListTotCnt", comDefaultVO);
    }

	/**
	  * @Method Name : selectNtceMsgDetail
	  * @작성일 : 2023. 3. 31.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	알림 관리 상세 조회
	  *  </p>
	  * @param : Map<String, Object> map
	  * @return : Map<String, Object>
	  */
	public Map<String,Object> selectNtceMsgDetail(Map<String, Object> map) throws Exception {
		return selectOne("EtcAlm.selectNtceMsgDetail", map);
	}

	/**
	  * @Method Name : updateNtceMsg
	  * @작성일 : 2023. 3. 31.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	알림 관리 수정
	  *  </p>
	  * @param : Map<String, Object> map
	  * @return :
	  */
	public void updateNtceMsg(Map<String, Object> map) throws Exception {
		update("EtcAlm.updateNtceMsg", map);
	}
}
