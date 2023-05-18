package kcure.portal.bbs.kcn.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.bbs.ntc.service.impl.NtcVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.kcn.ntc.service.impl
  * @FileName : KcnNtcDAO.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	KCURE 소식 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("KcnDAO")
public class KcnDAO extends EgovComAbstractDAO {

	/**
	  * @Method Name : selectKcnList
	  * @작성일 : 2023. 3. 13.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	게시판(KCURE소식) 목록
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectKcnList(NtcVO ntcVO) throws Exception {
		return selectList("Kcn.selectKcnList", ntcVO);
	}
	/**
	  * @Method Name : selectKcnListTotCnt
	  * @작성일 : 2023. 3. 13.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	KCURE소식 목록 Total Count
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return : int
	  */
	public int selectKcnListTotCnt(NtcVO ntcVO) throws Exception {
		return selectOne("Kcn.selectKcnListTotCnt", ntcVO);
	}

	/**
	  * @Method Name : selectKcnDetail
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	KCURE 소식 상세 조회
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectKcnDetail(NtcVO ntcVO) throws Exception {
		return selectOne("Kcn.selectKcnDetail", ntcVO);
	}


}
