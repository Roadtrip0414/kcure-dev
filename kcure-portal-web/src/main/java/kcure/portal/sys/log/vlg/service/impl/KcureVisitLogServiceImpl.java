package kcure.portal.sys.log.vlg.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import kcure.portal.sys.log.vlg.service.VisitLog;
import kcure.portal.sys.log.vlg.service.KcureVisitLogService;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

/**
  * @Project : kcure-portal-web
  * @package_name : kcure.portal.sys.log.vlg.service.impl
  * @FileName : KcureVisitLogServiceImpl.java
  * @since : 2023. 4. 3. 
  * @version 1.0
  * @author : kyj
  * @프로그램 설명 :	
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("KcureVisitLogService")
public class KcureVisitLogServiceImpl extends EgovAbstractServiceImpl implements KcureVisitLogService{
	@Resource(name="KcureVisitLogDAO")
	private KcureVisitLogDAO visitLogDAO;

    /** ID Generation */
	@Resource(name="egovSysLogIdGnrService")
	private EgovIdGnrService egovSysLogIdGnrService;

	@Override
	public Map<?, ?> selectVisitLogInf(VisitLog visitLog) {
		
		List<?> _result = visitLogDAO.selectVisitLogInf(visitLog);
		int _cnt = visitLogDAO.selectVisitLogInfCnt(visitLog);

		Map<String, Object> _map = new HashMap<String, Object>();
		_map.put("resultList", _result);
		_map.put("resultCnt", Integer.toString(_cnt));

		return _map;
	}
	

}
