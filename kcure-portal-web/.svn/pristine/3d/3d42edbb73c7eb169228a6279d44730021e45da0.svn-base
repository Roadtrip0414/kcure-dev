package kcure.portal.sys.etc.alm.service;

import java.util.List;
import java.util.Map;

import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.etc.alm.service
  * @FileName : EtcAlmService.java
  * @since : 2023. 3. 31.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	알림관리 Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface EtcAlmService {
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
	public List<Map<String,Object>> selectNtceMsgList(ComDefaultVO comDefaultVO) throws Exception;
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
	public int selectNtceMsgListTotCnt(ComDefaultVO comDefaultVO) throws Exception;
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
	public Map<String,Object> selectNtceMsgDetail(Map<String, Object> map) throws Exception;
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
	public void updateNtceMsg(Map<String, Object> map) throws Exception;
}
