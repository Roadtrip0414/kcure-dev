package kcure.portal.bbs.faq.service;

import java.util.List;
import java.util.Map;

import kcure.portal.bbs.ntc.service.impl.NtcVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.bbs.faq.service
  * @FileName : FaqService.java
  * @since : 2023. 3. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	FAQ Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface FaqService {
	/**
	  * @Method Name : selectFaqList
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	FAQ 목록 조회
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectFaqList(NtcVO ntcVO) throws Exception;

	/**
	  * @Method Name : selectFaqListTotCnt
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	FAQ 목록 총 갯수
	  *  </p>
	  * @param : ntcVO parameter값
	  * @return : int
	  */
	public int selectFaqListTotCnt(NtcVO ntcVO) throws Exception;
}
