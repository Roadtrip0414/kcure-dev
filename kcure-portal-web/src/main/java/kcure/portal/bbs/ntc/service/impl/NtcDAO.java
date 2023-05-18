package kcure.portal.bbs.ntc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.ntc.service.impl
  * @FileName : NtcDAO.java
  * @since : 2023. 3. 13.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	공지사항DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("NtcDAO")
public class NtcDAO extends EgovComAbstractDAO {

	/**
	  * @Method Name : selectNtcList
	  * @작성일 : 2023. 3. 13.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공지사항 목록
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectNtcList(NtcVO ntcVO){
		return selectList("Ntc.selectNtcList", ntcVO);
	}

	/**
	  * @Method Name : selectNtcListTotCnt
	  * @작성일 : 2023. 3. 13.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공지사항 목록 Total Count
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return : int
	  */
	public int selectNtcListTotCnt(NtcVO ntcVO){
		return selectOne("Ntc.selectNtcListTotCnt", ntcVO);
	}

	/**
	  * @Method Name : selectNtcDetail
	  * @작성일 : 2023. 3. 13.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	공지사항 상세보기
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectNtcDetail(NtcVO ntcVO) throws Exception {
		return selectOne("Ntc.selectNtcDetail", ntcVO);
	}

	/**
	  * @Method Name : updateRdcnt
	  * @작성일 : 2023. 2. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : 조회수 업데이트
	  *  <p>
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return :
	  */
	public void updateRdcnt(NtcVO ntcVO) throws Exception {
		insert("Ntc.updateRdcnt", ntcVO);
	}

	/**
	  * @Method Name : selectMaxRdcnt
	  * @작성일 : 2023. 2. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : 조회수 조회
	  *  <p>
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return : int
	  */
	public int selectMaxRdcnt(NtcVO ntcVO) throws Exception {
		return selectOne("Ntc.selectMaxRdcnt", ntcVO);
	}
}
