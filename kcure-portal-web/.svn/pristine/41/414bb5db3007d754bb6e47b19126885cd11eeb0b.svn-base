package kcure.portal.sys.log.ulg.service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import kcure.portal.cmn.util.CommonUtils;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StopWatch;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.log.ulg.service
  * @FileName : KcureUserActionLogAspect.java
  * @since : 2023. 2. 8. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 :	K-CURE 사용자 action로그 관리
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public class KcureUserActionLogAspect {

	@Resource(name="KcureUserActionLogService")
	private KcureUserActionLogService sysLogService;
	
	@Resource(name = "commonUtils")
	private CommonUtils commonUtils;
	
	
	public Object logSave(ProceedingJoinPoint joinPoint) throws Throwable {
		StopWatch stopWatch = new StopWatch();

		try {
			stopWatch.start();

			Object retValue = joinPoint.proceed();
			return retValue;
		} catch (Throwable e) {
			throw e;
		} finally {
			stopWatch.stop();
			UserActionLog sysLog = getSysLog(joinPoint,stopWatch,"PR");
			sysLogService.logAddSysLog(sysLog);

		}

	}
	
	/**
	 * 시스템 로그정보를 생성한다.
	 * sevice Class의 insert로 시작되는 Method
	 *
	 * @param ProceedingJoinPoint
	 * @return Object
	 * @throws Exception
	 */
	public Object logInsert(ProceedingJoinPoint joinPoint) throws Throwable {
		StopWatch stopWatch = new StopWatch();

		try {
			stopWatch.start();

			Object retValue = joinPoint.proceed();
			return retValue;
		} catch (Throwable e) {
			throw e;
		} finally {
			stopWatch.stop();
			UserActionLog sysLog = getSysLog(joinPoint,stopWatch,"C");
			sysLogService.logAddSysLog(sysLog);

		}

	}

	/**
	 * 시스템 로그정보를 생성한다.
	 * sevice Class의 update로 시작되는 Method
	 *
	 * @param ProceedingJoinPoint
	 * @return Object
	 * @throws Exception
	 */
	public Object logUpdate(ProceedingJoinPoint joinPoint) throws Throwable {

		StopWatch stopWatch = new StopWatch();

		try {
			stopWatch.start();

			Object retValue = joinPoint.proceed();
			return retValue;
		} catch (Throwable e) {
			throw e;
		} finally {
			stopWatch.stop();
			UserActionLog sysLog = getSysLog(joinPoint,stopWatch,"U"); 
			sysLogService.logAddSysLog(sysLog);

		}

	}

	/**
	 * 시스템 로그정보를 생성한다.
	 * sevice Class의 delete로 시작되는 Method
	 *
	 * @param ProceedingJoinPoint
	 * @return Object
	 * @throws Exception
	 */
	public Object logDelete(ProceedingJoinPoint joinPoint) throws Throwable {

		StopWatch stopWatch = new StopWatch();

		try {
			stopWatch.start();

			Object retValue = joinPoint.proceed();
			return retValue;
		} catch (Throwable e) {
			throw e;
		} finally {
			stopWatch.stop();
			UserActionLog sysLog = getSysLog(joinPoint,stopWatch,"D");
			sysLogService.logAddSysLog(sysLog);
		}
	}

	/**
	 * 시스템 로그정보를 생성한다.
	 * sevice Class의 select로 시작되는 Method
	 *
	 * @param ProceedingJoinPoint
	 * @return Object
	 * @throws Exception
	 */
	public Object logSelect(ProceedingJoinPoint joinPoint) throws Throwable {
		StopWatch stopWatch = new StopWatch();
		for(Object o : joinPoint.getArgs()) {
			if(o instanceof HttpServletRequest) {
				System.out.println(((ServletRequest) o).getRemoteAddr());
			}
		}
			
		try {
			stopWatch.start();

			Object retValue = joinPoint.proceed();
			return retValue;
		} catch (Throwable e) {
			throw e;
		} finally {
			stopWatch.stop();
			UserActionLog sysLog = getSysLog(joinPoint,stopWatch,"R");
			sysLogService.logAddSysLog(sysLog);

		}

	}

	private UserActionLog getSysLog(ProceedingJoinPoint joinPoint,StopWatch stopWatch,String processSeCode) {
		UserActionLog sysLog = new UserActionLog();
		String className = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		String processTime = Long.toString(stopWatch.getTotalTimeMillis());
		String rqesterId = "";
		String ip = "";
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String uri = request.getRequestURI();
		
    	// Authenticated 
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(isAuthenticated.booleanValue()) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			rqesterId = (user == null || user.getId() == null) ? "" : user.getId();
			ip = (user == null || user.getIp() == null) ? "" : user.getIp();
    	}else {
    		ip = commonUtils.getIPFromRequest(request);
    	}
    	System.out.println("-----------------ip-----------------------------");
    	System.out.println("-----------------ip-----------------------------");
    	System.out.println(ip);
    	System.out.println("-----------------ip-----------------------------");
    	System.out.println("-----------------ip-----------------------------");
    	if(ip.indexOf(",")>-1) {
    		ip = ip.split(",")[0];
    	}
    	
    	//uri 로 할지 여부 확인 필요    	
    	String targetMenuNm = request.getParameter("current_menu_name_info");
		sysLog.setSrvcNm(className);
		sysLog.setMethodNm(methodName);
		sysLog.setProcessSeCode(processSeCode);
		sysLog.setProcessTime(processTime);
		sysLog.setRqesterId(rqesterId);
		sysLog.setRqesterIp(ip);
		sysLog.setMenuUriAddr(uri);
		sysLog.setTrgetMenuNm(targetMenuNm);
		return sysLog;
	}

}
