package kcure.portal.sys.log.ulg.service;

import java.util.Map;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.log.ulg.service
  * @FileName : KcureUserActionLogService.java
  * @since : 2023. 2. 8. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 사용자 Action 로그	를 위한 서비스 인터페이스
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface KcureUserActionLogService {
	
	/**
	 * 시스템 로그정보를 생성한다.
	 *
	 * @param SysLog
	 */
	public void logAddSysLog(UserActionLog userActionLog) throws Exception;

	
	/**
	 * 시스템 로그정보 목록을 조회한다.
	 *
	 * @param SysLog
	 */
	public Map<?, ?> selectUserActionLogInf(UserActionLog userActionLog) throws Exception;


	/**
	  * @Method Name : addLoginCnt
	  * @date : 2023. 3. 29.
	  * @Method 설명 :
	  *  <p>	
	  *     로그인 현황 증가 
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public void addLoginCnt();

}
