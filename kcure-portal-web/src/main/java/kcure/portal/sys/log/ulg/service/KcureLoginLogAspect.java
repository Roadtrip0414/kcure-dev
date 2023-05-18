package kcure.portal.sys.log.ulg.service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
  * @Project : kcure-portal-web
  * @package_name : kcure.portal.sys.log.clg.service
  * @FileName : KcureLoginLogAspect.java
  * @since : 2023. 2. 14. 
  * @version 1.0
  * @author : shpark
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
public class KcureLoginLogAspect {
	
	@Resource(name="KcureUserActionLogService")
	private KcureUserActionLogService sysLogService;

	/**
	 * 로그인 로그정보를 생성한다.
	 * EgovLoginController.actionMain Method
	 * 
	 * @param 
	 * @return void
	 * @throws Exception 
	 */
	public void logLogin() throws Throwable {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		UserActionLog sysLog = getSysLog("I",request.getRemoteAddr());
		//로그인 증가 
		sysLogService.addLoginCnt();
		
		sysLogService.logAddSysLog(sysLog);

	}
	
	/**
	 * 로그아웃 로그정보를 생성한다.
	 * EgovLoginController.actionLogout Method
	 * 
	 * @param 
	 * @return void
	 * @throws Exception 
	 */
	public void logLogout() throws Throwable {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        UserActionLog sysLog = getSysLog("O",request.getRemoteAddr());
		sysLogService.logAddSysLog(sysLog);
	}
	
	private UserActionLog getSysLog(String processSeCode,String rqesterIp) {
		UserActionLog sysLog = new UserActionLog();
		//String className = joinPoint.getTarget().getClass().getName();
		//String methodName = joinPoint.getSignature().getName();
		//String processTime = Long.toString(stopWatch.getTotalTimeMillis());
		String rqesterId = "";
		String ip = "";

    	// Authenticated 
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(isAuthenticated.booleanValue()) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			rqesterId = (user == null || user.getId() == null) ? "" : user.getId();
			ip = (user == null || user.getIp() == null) ? "" : user.getIp();
    	}else {
    		ip = rqesterIp;
    	}
		sysLog.setProcessSeCode(processSeCode);
		sysLog.setRqesterId(rqesterId);
		sysLog.setRqesterIp(ip);
		return sysLog;
	}
	
}
