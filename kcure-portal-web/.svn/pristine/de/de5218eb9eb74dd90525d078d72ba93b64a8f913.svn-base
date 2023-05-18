package kcure.portal.sys.log.flm.service.impl;


import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.log.flm.service.FileLog;

/**
  * @Project : kcure-portal-web
  * @package_name  : kcure.portal.sys.log.flm.service.impl
  * @FileName : KcureFileLogDAO.java
  * @since : 2023. 2. 14. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 파일로그 관리 DAO	
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */

@Repository("KcureFileLogDAO")
public class KcureFileLogDAO extends EgovComAbstractDAO{

	public List<?> selectFileLogInf(FileLog fileLog) {
		return list("KcureFileLog.selectFileLogInf", fileLog);
	}

	public int selectFileLogInfCnt(FileLog fileLog) {
		return (Integer)selectOne("KcureFileLog.selectFileLogInfCnt", fileLog);
	}

}
