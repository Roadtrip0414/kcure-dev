/*
 * Copyright 2008-2019 MOIS(Ministry of the Interior and Safety).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.egovframe.rte.fdl.access.interceptor;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.access.bean.AuthorityResourceMetadata;
import org.egovframe.rte.fdl.access.config.EgovAccessConfigShare;
import org.egovframe.rte.fdl.access.service.EgovUserDetailsHelper;
import org.egovframe.rte.fdl.string.EgovStringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.com.cmm.LoginVO;
import kcure.portal.cmn.interceptor.service.KcureInterceptorService;
import kcure.portal.cmn.interceptor.service.impl.KcureInterceptorVO;

/**
  * @Project : kcure-portal-web
  * @package_name : org.egovframe.rte.fdl.access.interceptor
  * @FileName : EgovAccessInterceptor.java
  * @since : 2023. 2. 14. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 인증 및 접근제한 인터셉터
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public class EgovAccessInterceptor extends HandlerInterceptorAdapter implements ApplicationContextAware {

    private static final Logger LOGGER = LoggerFactory.getLogger(EgovAccessInterceptor.class);
    private ApplicationContext context;
    

    /** EgovLoginService */
	@Resource(name = "KcureInterceptorService")
	private KcureInterceptorService kcureInterceptorService;
	
    @Override
    public void setApplicationContext(ApplicationContext context) throws BeansException {
        this.context = context;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	LOGGER.debug("##### Interceptor Start #####");
    	 // 인증 체크
        boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();        
        String targetUri = request.getRequestURI().replace(request.getContextPath(),"");
        //메인 화겸 호출일 경우
        if( targetUri.equals("/index.do") ) {
        	//로그인이 아닐경우 방문자 수 증가 실행. 
            if(!isAuthenticated ) {
            	kcureInterceptorService.addVstrCnt();
            }
            //메인화면은 권한 없이 들어갈수 있음.
            return true;
        }
        
        
        KcureInterceptorVO interceptorVo = new KcureInterceptorVO();
        //로그인이된 상태
        if(isAuthenticated ) {
        	//로그인 세션
            LoginVO sessionVo = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        	interceptorVo.setLoginId(sessionVo.getId());
        }
        interceptorVo.setTargetUri(targetUri);
        
        /* */
        
        //패턴 체크
        String meunId = kcureInterceptorService.checkUriMenuId(interceptorVo);
        //menuId 가 retun 되지 않았을경우.( 권한이 없는경우 )
        if( EgovStringUtil.isEmpty(meunId)) {
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	LOGGER.debug("===========check uri false  ===================="+targetUri);
        	//kcureInterceptorService.insertTargetUri(targetUri);
        	String returnUrl = "";
        	//로그인이 아닌경우
        	if (!isAuthenticated) {
        		returnUrl = EgovAccessConfigShare.DEF_LOGIN_URL;
        	//로그인인 경우
            }else{
            	returnUrl = EgovAccessConfigShare.DEF_ACCESS_DENIED_URL;
            }
        	
        	// AJAX 호출이 아닌경우
    		if (!(request.getHeader("AJAX") != null && request.getHeader("AJAX").equals("true"))) {
    			// 허용 가능 url ( defualt 권한 )
                response.sendRedirect(request.getContextPath() + returnUrl);
                return false;
             // AJAX 호출인 경우
    		}else {
    			RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath() + "/portal/uat/uia/ajaxError.do");
    			request.setAttribute("err_return", returnUrl);
    			dispatcher.forward(request, response);
    			return false;
    		}
    		
        // 권한이 있는경우.
        }else {
        	LOGGER.debug("===========check uri ok ===================="+targetUri);
        }
        
        
        //로그인 상태.
        LOGGER.debug("##### EgovAccessInterceptor interceptor isAuthenticated >>> {}", isAuthenticated);
    	LOGGER.debug("##### Interceptor End #####");
        
        return true;
    }
    
    public boolean preHandleBackup(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        LOGGER.debug("##### EgovAccessInterceptor Start #####");
        // 인증 체크
        boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        
        System.out.println("=======================================================");
        LOGGER.debug("##### EgovAccessInterceptor interceptor isAuthenticated >>> {}", isAuthenticated);
        
        if (!isAuthenticated) {
        	// 허용 가능 url ( defualt 권한 )
            response.sendRedirect(request.getContextPath() + EgovAccessConfigShare.DEF_LOGIN_URL);
            return false;
        }
        
        String requestMatchType = EgovAccessConfigShare.DEF_REQUEST_MATCH_TYPE;
        String url = request.getRequestURI().replace(request.getContextPath(),"");
        boolean matchStatus = false;

        // 권한 체크
        List<String> authorityList = EgovUserDetailsHelper.getAuthorities();
        LOGGER.debug("##### EgovAccessInterceptor authorityList : {} #####", authorityList);
        String authority = "";
        for (String str : authorityList) {
            authority = str;
        }

        // 권한별 접근 제한
        AuthorityResourceMetadata authorityResourceMetadata = context.getBean(AuthorityResourceMetadata.class);
        List<Map<String, Object>> list = authorityResourceMetadata.getResourceMap();
        Iterator<Map<String, Object>> iterator = list.iterator();
        Map<String, Object> tempMap;
        while (iterator.hasNext()) {
            tempMap = iterator.next();
            if (authority.equals(tempMap.get("authority"))) {
                // Ant Style Path Check
                if ("ant".equals(requestMatchType)) {
                    LOGGER.debug("##### EgovAccessInterceptor ant pattern #####");
                    matchStatus = EgovAccessUtil.antMatcher((String) tempMap.get("url"), url);
                    LOGGER.debug("##### EgovAccessInterceptor ant pattern : {} , url : {}, match : {} #####", tempMap.get("url"), url, matchStatus);
                }
                // Regular Expression Style Path Check
                else {
                    LOGGER.debug("##### EgovAccessInterceptor regex pattern #####");
                    matchStatus = EgovAccessUtil.regexMatcher((String) tempMap.get("url"), url);
                    LOGGER.debug("##### EgovAccessConfigTest regex pattern : {} , url : {}, match : {} #####", tempMap.get("url"), url, matchStatus);
                }
                if (matchStatus) {
                    return true;
                }
            }
        }

        // 허가되지 않은 경우 접근 제한
        if (!matchStatus) {
            response.sendRedirect(request.getContextPath() + EgovAccessConfigShare.DEF_ACCESS_DENIED_URL);
            return false;
        }
        System.out.println("=======================================================");
        return true;
    }

}
