package kcure.portal.sys.log.flm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import kcure.portal.sys.log.flm.service.FileLog;
import kcure.portal.sys.log.flm.service.KcureFileLogService;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

/**
  * @Project : kcure-portal-web
  * @package_name : kcure.portal.sys.log.flm.service.impl
  * @FileName : KcureFileLogServiceImpl.java
  * @since : 2023. 2. 14. 
  * @version 1.0
  * @author : 개발자 명
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
@Service("KcureFileLogService")
public class KcureFileLogServiceImpl extends EgovAbstractServiceImpl implements KcureFileLogService{
	@Resource(name="KcureFileLogDAO")
	private KcureFileLogDAO fileLogDAO;

    /** ID Generation */
	@Resource(name="egovSysLogIdGnrService")
	private EgovIdGnrService egovSysLogIdGnrService;

	@Override
	public Map<?, ?> selectFileLogInf(FileLog fileLog) {
		List<?> _result = fileLogDAO.selectFileLogInf(fileLog);
		int _cnt = fileLogDAO.selectFileLogInfCnt(fileLog);

		Map<String, Object> _map = new HashMap<String, Object>();
		_map.put("resultList", _result);
		_map.put("resultCnt", Integer.toString(_cnt));

		return _map;
	}
	

}
