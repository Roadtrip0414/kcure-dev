package kcure.portal.cmn.alm.service;

import kcure.portal.cmn.alm.service.impl.AlmVO;
import kcure.portal.cmn.alm.service.impl.MsgVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.api.dsz.service
 * @FileName : DszService.java
 * @since : 2023. 2. 13.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	사용자 알림  service
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  </pre>
 */
public interface AlmService {

	/**
	  * @Method Name : insertReserve
	  * @작성일 : 2023. 3. 23.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자 알람등록
	  *  <p>
	  *  </p>
	  * @param : AlmVO almVO
	  * @return : 
	  */
	public int insertSvcNtce(AlmVO almVO) throws Exception;
	
	/**
	  * @Method Name : selectMessage
	  * @작성일 : 2023. 3. 31.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자 알람메세지 조회
	  *  <p>
	  *  </p>
	  * @param : MsgVO msgVO
	  * @return : 
	  */
	public MsgVO selectNtceMessage(AlmVO almVO) throws Exception;

	/**
	  * @Method Name : registAlrm
	  * @작성일 : 2023. 3. 23.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자 알람생성
	  *  <p>
	  *  </p>
	  * @param : String
	  * @return : 
	  */
	public void registAlrm(String param1, String param2, String param3) throws Exception;
}
