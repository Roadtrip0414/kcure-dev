package kcure.portal.sys.log.vlg.service.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.log.vlg.service.VisitLog;

/**
  * @Project : kcure-portal-web
  * @package_name  : kcure.portal.sys.log.vlg.service.impl
  * @FileName : KcureVisitLogDAO.java
  * @since : 2023. 4. 3. 
  * @version 1.0
  * @author : kyj
  * @프로그램 설명 : 사용자 방문기록 관리 DAO	
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */

@Repository("KcureVisitLogDAO")
public class KcureVisitLogDAO extends EgovComAbstractDAO{

	public List<?> selectVisitLogInf(VisitLog visitLog) {
		return selectList("KcureVisitLog.selectVisitLogInf", visitLog);
	}

	public int selectVisitLogInfCnt(VisitLog visitLog) {
		return (Integer)selectOne("KcureVisitLog.selectVisitLogInfCnt", visitLog);
	}

}

