package kcure.portal.sys.log.ulg.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import kcure.portal.sys.log.ulg.service.KcureUserActionLogService;
import kcure.portal.sys.log.ulg.service.UserActionLog;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.log.lgm.service.impl
  * @FileName : KcureSysLogServiceImpl.java
  * @since : 2023. 1. 18. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 :	로그관리(시스템)를 위한 서비스 구현 클래스
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("KcureUserActionLogService")
public class KcureUserActionLogServiceImpl extends EgovAbstractServiceImpl implements KcureUserActionLogService{
	@Resource(name="KcureUserActionLogDAO")
	private KcureUserActionLogDAO kcureUserActionLogDAO;

    /** ID Generation */
	@Resource(name="egovSysLogIdGnrService")
	private EgovIdGnrService egovSysLogIdGnrService;

	/**
	 * 시스템 로그정보를 생성한다.
	 *
	 * @param SysLog
	 */
	@Override
	public void logAddSysLog(UserActionLog userActionLog) throws Exception {
		String requstId = egovSysLogIdGnrService.getNextStringId();
		userActionLog.setRequstId(requstId);
		kcureUserActionLogDAO.logAddSysLog(userActionLog);
		
	}
	
	/**
	 * 시스템 로그정보 목록을 조회한다.
	 *
	 * @param SysLog
	 */
	@Override
	public Map<?, ?> selectUserActionLogInf(UserActionLog userActionLog) throws Exception {

		List<?> _result = kcureUserActionLogDAO.selectUserActionLogInf(userActionLog);
		int _cnt = kcureUserActionLogDAO.selectUserActionLogInfCnt(userActionLog);

		Map<String, Object> _map = new HashMap<String, Object>();
		_map.put("resultList", _result);
		_map.put("resultCnt", Integer.toString(_cnt));

		return _map;
	}

	/**
	 * 로그인 현황 증가.
	 */
	@Override
	public void addLoginCnt() {
		kcureUserActionLogDAO.addLoginCnt();
	}

	

}
