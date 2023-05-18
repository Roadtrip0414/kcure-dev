package kcure.portal.bbs.kcn.service;

import java.util.List;
import java.util.Map;

import kcure.portal.bbs.ntc.service.impl.NtcVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.kcn.ntc.service
  * @FileName : KcnNtcService.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	kcure 소식 Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface KcnService {
	/**
	  * @Method Name : selectKcnList
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	kcure 소식 목록 조회
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectKcnList(NtcVO ntcVO) throws Exception;
	/**
	  * @Method Name : selectKcnListTotCnt
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	KCURE소식 목록 Total Count
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return : int
	  */
	public int selectKcnListTotCnt(NtcVO ntcVO) throws Exception;

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
	public Map<String, Object> selectKcnDetail(NtcVO ntcVO) throws Exception;
}
