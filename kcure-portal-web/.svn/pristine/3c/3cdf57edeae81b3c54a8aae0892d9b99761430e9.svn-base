package kcure.portal.cmn.interceptor.service.impl;


import javax.annotation.Resource;

import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("KcureInterceptorDAO")
public class KcureInterceptorDAO extends EgovComAbstractDAO {
	
	/** ID Generation */
	@Resource(name="egovLoginLogIdGnrService")
	private EgovIdGnrService egovLoginLogIdGnrService;

	public String checkUriMenuId(KcureInterceptorVO interceptorVo) {
		return (String)selectOne("KcureInterceptor.checkUriMenuId", interceptorVo);
	}

	public void insertTargetUri(String targetUri) {
		insert("KcureInterceptor.insertTargetUri", targetUri);
	}

	public void addVstrCnt() {
		update("KcureInterceptor.addVstrCnt");
	}
	
}
