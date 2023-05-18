package kcure.portal.cmn.interceptor.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.config.EgovLoginConfig;
import egovframework.com.cop.ems.service.EgovSndngMailRegistService;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import kcure.portal.cmn.interceptor.service.KcureInterceptorService;
import kcure.portal.uat.uia.service.KcureLoginService;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
  * @Project : kcure-portal-web
  * @package_name : kcure.portal.cmn.interceptor.service.impl
  * @FileName : KcureInterceptorServiceImpl.java
  * @since : 2023. 2. 15. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 인터셉터 서비스
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Service("KcureInterceptorService")
public class KcureInterceptorServiceImpl extends EgovAbstractServiceImpl implements KcureInterceptorService {

    @Resource(name="KcureInterceptorDAO")
    private KcureInterceptorDAO kcureInterceptorDAO;
	
	@Resource(name = "egovLoginConfig")
	EgovLoginConfig egovLoginConfig;

	@Override
	public String checkUriMenuId(KcureInterceptorVO interceptorVo) {                      
		return kcureInterceptorDAO.checkUriMenuId(interceptorVo);
	}

	@Override
	public void insertTargetUri(String targetUri) {
		kcureInterceptorDAO.insertTargetUri(targetUri);
		
	}

	@Override
	public void addVstrCnt() {
		kcureInterceptorDAO.addVstrCnt();
		
	}

}
