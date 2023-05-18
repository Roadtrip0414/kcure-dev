package kcure.portal.cmn.interceptor.service;

import kcure.portal.cmn.interceptor.service.impl.KcureInterceptorVO;

/**
  * @Project : kcure-portal-web
  * @package_name : kcure.portal.cmn.interceptor.service
  * @FileName : KcureInterceptorService.java
  * @since : 2023. 2. 15. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 인터셉서 서비스
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface KcureInterceptorService {

	/**
	  * @Method Name : checkUriMenuId
	  * @date : 2023. 2. 15.
	  * @Method 설명 :
	  *  <p>	
	  *     인터셉터 uri 권한 확인
	  *  </p>
	  * @param : KcureInterceptorVO
	  * @return : String 메뉴아이디
	  */
	public String checkUriMenuId(KcureInterceptorVO interceptorVo);

	public void insertTargetUri(String targetUri);

	/**
	  * @Method Name : addVstrCnt
	  * @date : 2023. 3. 29.
	  * @Method 설명 :
	  *  <p>	
	  *     방문자수 증가 
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public void addVstrCnt();
	
}
