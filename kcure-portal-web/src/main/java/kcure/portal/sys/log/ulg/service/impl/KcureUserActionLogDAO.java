package kcure.portal.sys.log.ulg.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.log.ulg.service.UserActionLog;



/**
  * @Project : kcure-portal-web
	* @package_name        : kcure.portal.sys.log.lgm.service.impl
  * @FileName : SysLogDAO.java
  * @since : 2023. 1. 17. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 :	로그관리(시스템)를 위한 데이터 접근 클래스
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("KcureUserActionLogDAO")
public class KcureUserActionLogDAO extends EgovComAbstractDAO{

	/**
	 * 시스템 로그정보를 생성한다.
	 *
	 * @param SysLog
	 * @return
	 * @throws Exception
	 */
	public void logAddSysLog(UserActionLog userActionLog) {
		insert("KcureUserActionLog.logInsertSysLog", userActionLog);
		
	}

	/**
	 * 시스템 로그정보를 요약한다.
	 *
	 * @param
	 * @return
	 * @throws Exception
	 */
	public void logAddSysLogSummary() {
		insert("KcureUserActionLog.logInsertSysLogSummary", null);
		delete("KcureUserActionLog.logDeleteSysLogSummary", null);
		
	}

	/**
	 * 시스템 로그목록을 조회한다.
	 *
	 * @param sysLog
	 * @return sysLog
	 * @throws Exception
	 */
	public List<?> selectUserActionLogInf(UserActionLog userActionLog) {
		return list("KcureUserActionLog.selectUserActionLogInf", userActionLog);
	}

	/**
	 * 시스템 로그정보 목록의 숫자를 조회한다.
	 * @param sysLog
	 * @return
	 * @throws Exception
	 */
	public int selectUserActionLogInfCnt(UserActionLog userActionLog) {
		return (Integer)selectOne("KcureUserActionLog.selectUserActionLogInfCnt", userActionLog);
	}

	/**
	  * @Method Name : addLoginCnt
	  * @date : 2023. 3. 29.
	  * @Method 설명 :
	  *  <p>	
	  *     로그인 현황 증가. 
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public void addLoginCnt() {
		update("KcureInterceptor.addLoginCnt");
		
	}
}
