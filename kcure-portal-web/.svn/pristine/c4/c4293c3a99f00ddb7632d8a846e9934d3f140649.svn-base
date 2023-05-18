package kcure.portal.sys.log.ifr.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.ObjectUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.util.HttpClientUtil;
import kcure.portal.sys.log.ifr.service.IfrService;
import okhttp3.HttpUrl;
import okhttp3.MediaType;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.sys.log.ifr.service.impl
 * @FileName : IfrServiceImpl.java
 * @since : 2023. 3. 28.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	인프라 모니터링 API serviceImpl
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일             수정자            수정내용
 *  ----------      --------   ---------------------------
 *  2023.03.30   bhs             파일생성
 *  </pre>
 */
@Service("ifrService")
public class IfrServiceImpl implements IfrService {

	/**
	  * @Method Name : getMetrixInfo
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 인프라 지표조회
	  * @param : ReqVO
	  * @return : MetrixVO
	  */
	@Override
	public List<MetrixVO> getMetrixInfo(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_METRICS ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getInstanceId(), reqVo.getMetricCode());
		
		HttpUrl.Builder urlBuilder = HttpUrl.parse(apiUrl).newBuilder()
				.addQueryParameter("start", reqVo.getStartTime())
				.addQueryParameter("end", reqVo.getEndTime());
		
		String result = HttpClientUtil.get(urlBuilder.toString());
		
		if(result != null && result != "") {
			MetrixVO[] response = new Gson().fromJson(result, MetrixVO[].class);
	        List<MetrixVO> list = Arrays.asList(response);
	        return list;
		}
		return null;
	}
	
	/**
	  * @Method Name : getMetrixInfo
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 감시설정 조회
	  * @param : ReqVO
	  * @return : AlarmConfigVO
	  */
	@Override
	public List<AlarmConfigVO> getAlarmConfigs(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_ALRMCONFIGS ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getAlarmGroupId());
		
		String result = HttpClientUtil.get(apiUrl);
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		AlarmConfigVO[] response = new Gson().fromJson(jsonObj.get("data").toString(), AlarmConfigVO[].class);
		
		if(header.getIsSuccessful() == "true") {
			List<AlarmConfigVO> list = Arrays.asList(response);
	        return list;
		}
        return null;
	}
	
	/**
	  * @Method Name : getAlamGroups
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 알람그룹 목록조회
	  * @param : ReqVO
	  * @return : AlarmGroupVO
	  */
	@Override
	public List<AlarmGroupVO> getAlamGroups(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_ALRMGROUPS_01;		
		apiUrl = setPathVariable(apiUrl, reqVo.getProjectId());
		
		String result = HttpClientUtil.get(apiUrl);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		AlarmGroupVO[] response = new Gson().fromJson(jsonObj.get("data").toString(), AlarmGroupVO[].class);

		if(header.getIsSuccessful() == "true") {
			List<AlarmGroupVO> list = Arrays.asList(response);  
	        return list;
		}
        return null;
	}

	/**
	  * @Method Name : registAlamGroups
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 알람그룹 추가
	  * @param : ReqVO
	  * @return : AlarmGroupVO
	  */
	@Override
	public AlarmGroupVO registAlamGroups(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_ALRMGROUPS_01 ;		
		apiUrl = setPathVariable(apiUrl, reqVo.getProjectId());
		
		MediaType mediaType = MediaType.parse(IfrApiConstants.IFR_API_MEDIA_TYPE);
		
		Map<String, Object> requestBody = new HashMap<String, Object>();
		requestBody.put("name", reqVo.getName());
		requestBody.put("alarmTypeEmail", reqVo.getAlarmTypeEmail());
		requestBody.put("alarmTypePhone", reqVo.getAlarmTypePhone());
		
		String result = HttpClientUtil.post(apiUrl, requestBody, mediaType);
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			AlarmGroupVO response = new Gson().fromJson(jsonObj.get("data").toString(), AlarmGroupVO.class);
			return response;
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : modiAlamGrpups
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 알람그룹 수정
	  * @param : ReqVO
	  * @return : AlarmGroupVO
	  */
	@Override
	public AlarmGroupVO modiAlamGrpups(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_ALRMGROUPS_02 ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getAlarmGroupId());
		
		MediaType mediaType = MediaType.parse(IfrApiConstants.IFR_API_MEDIA_TYPE);
		
		Map<String, String> requestBody = new HashMap<String, String>();
		requestBody.put("name", reqVo.getName());
		requestBody.put("alarmTypeEmail", reqVo.getAlarmTypeEmail());
		requestBody.put("alarmTypePhone", reqVo.getAlarmTypePhone());
		
		String result = HttpClientUtil.put(apiUrl, requestBody, mediaType);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			AlarmGroupVO response = new Gson().fromJson(jsonObj.get("data").toString(), AlarmGroupVO.class);
			return response;
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : deleteAlamGroups
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 알람그룹 삭제
	  * @param : ReqVO
	  * @return : String
	  */
	@Override
	public String deleteAlamGroups(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_ALRMGROUPS_02 ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getAlarmGroupId());			
		
		String result = HttpClientUtil.delete(apiUrl);
        
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			AlarmConfigVO response = new Gson().fromJson(jsonObj.get("data").toString(), AlarmConfigVO.class);
			 return "ok";
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : registAlamConfigs
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 감시설정 추가
	  * @param : ReqVO
	  * @return : AlarmConfigVO
	  */
	@Override
	public AlarmConfigVO registAlamConfigs(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_ALRMCONFIGS ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getAlarmGroupId());
		
		MediaType mediaType = MediaType.parse(IfrApiConstants.IFR_API_MEDIA_TYPE);

		Map<String, Object> requestBody = new HashMap<String, Object>();
		requestBody.put("observeItemCode", reqVo.getObserveItemCode());
		requestBody.put("compareTypeCode", reqVo.getCompareTypeCode());
		requestBody.put("continueTimeMinute", reqVo.getContinueTimeMinute());
		requestBody.put("eventGradeTypeCode", reqVo.getEventGradeTypeCode());
		requestBody.put("criticalValueContent", reqVo.getCriticalValueContent());
		requestBody.put("criticalValueUnit", reqVo.getCriticalValueUnit());
		requestBody.put("observeConfigDetailContent", reqVo.getObserveConfigDetailContent());
		
		String result = HttpClientUtil.post(apiUrl, requestBody, mediaType);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;

		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		
		
		if(! checkError(header.getResultCode())){
			AlarmConfigVO response = new Gson().fromJson(jsonObj.get("data").toString(), AlarmConfigVO.class);
			return response;
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : deleteAlarmConfigs
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 감시설정 삭제
	  * @param : ReqVO
	  * @return : String
	  */
	@Override
	public String deleteAlarmConfigs(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_ALRMCONFIGS ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getAlarmGroupId());		
		
		MediaType mediaType = MediaType.parse(IfrApiConstants.IFR_API_MEDIA_TYPE);
		
		Map<String, Object> requestBody = new HashMap<String, Object>();
		requestBody.put("observeItemCode", reqVo.getObserveItemCode());
		requestBody.put("compareTypeCode", reqVo.getCompareTypeCode());
		requestBody.put("continueTimeMinute", reqVo.getContinueTimeMinute());
		requestBody.put("eventGradeTypeCode", reqVo.getEventGradeTypeCode());
		requestBody.put("criticalValueContent", reqVo.getCriticalValueContent());
		requestBody.put("criticalValueUnit", reqVo.getCriticalValueUnit());
		requestBody.put("observeConfigDetailContent", reqVo.getObserveConfigDetailContent());
		
		String result = HttpClientUtil.delete(apiUrl, requestBody, mediaType);
        
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			return "ok";
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : registInstances
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 인스턴스 연동추가
	  * @param : ReqVO
	  * @return : String
	  */
	@Override
	public String registInstances(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_INSTANCES ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getAlarmGroupId());
		
		MediaType mediaType = MediaType.parse(IfrApiConstants.IFR_API_MEDIA_TYPE);
		
		Map<String, Object> requestBody = new HashMap<String, Object>();
		requestBody.put("instanceIds", reqVo.getInstanceIds());

		String result = HttpClientUtil.post(apiUrl, requestBody, mediaType);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			return "ok";
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : getInstances
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 인스턴스 연동조회
	  * @param : ReqVO
	  * @return : InstanceVO
	  */
	@Override
	public List<InstanceVO> getInstances(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_INSTANCES;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getAlarmGroupId());
		
		String result = HttpClientUtil.get(apiUrl);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			InstanceVO[] response = new Gson().fromJson(jsonObj.get("data").toString(), InstanceVO[].class);
			List<InstanceVO> list = Arrays.asList(response);
	        return list;
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : deleteInstances
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 인스턴스 연동삭제
	  * @param : ReqVO
	  * @return : String
	  */
	@Override
	public String deleteInstances(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_INSTANCES ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getAlarmGroupId());		
		
		MediaType mediaType = MediaType.parse(IfrApiConstants.IFR_API_MEDIA_TYPE);
		
		Map<String, Object> requestBody = new HashMap<String, Object>();
		requestBody.put("instanceIds", reqVo.getInstanceIds());
		
		String result = HttpClientUtil.delete(apiUrl, requestBody, mediaType);
        
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			return "ok";
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : registUserAlarmGroups
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자 알람그룹 추가
	  * @param : ReqVO
	  * @return : String
	  */
	@Override
	public String registUserAlarmGroups(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_ALRMUSERGRPS ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getAlarmGroupId());		
		
		MediaType mediaType = MediaType.parse(IfrApiConstants.IFR_API_MEDIA_TYPE);
		
		Map<String, Object> requestBody = new HashMap<String, Object>();
		requestBody.put("userGroupIds", reqVo.getUserGroupsIds());

		String result = HttpClientUtil.post(apiUrl, requestBody, mediaType);
        
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			return "ok";
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : getUserAlarmGroups
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자 알람그룹 조회
	  * @param : 
	  * @return :
	  */
	@Override
	public List<UserGroupVO> getUserAlarmGroups(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_ALRMUSERGRPS;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getAlarmGroupId());
		
		String result = HttpClientUtil.get(apiUrl);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			String[] response = new Gson().fromJson(jsonObj.get("data").toString(), String[].class);
			
			List<UserGroupVO> list = new ArrayList<UserGroupVO>();
			UserGroupVO userGroupVo = new UserGroupVO();
			if(response.length > 0) {
				for(int i=0;i<response.length;i++) {
					userGroupVo = new UserGroupVO();
					userGroupVo.setId(response[i]);
					userGroupVo.setUserGroupId(response[i]);
					list.add(userGroupVo);
				}
			}
			 return list;
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : deleteUserAlarmGroups
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자 알람그룹 삭제
	  * @param : ReqVO
	  * @return : String
	  */
	@Override
	public String deleteUserAlarmGroups(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_ALRMUSERGRPS ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getAlarmGroupId());		
		
		MediaType mediaType = MediaType.parse(IfrApiConstants.IFR_API_MEDIA_TYPE);

		Map<String, Object> requestBody = new HashMap<String, Object>();
		requestBody.put("userGroupIds", reqVo.getUserGroupsIds());
		
		String result = HttpClientUtil.delete(apiUrl, requestBody, mediaType);
        
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			return "ok";
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : registUserGroups
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자그룹 추가
	  * @param : ReqVO
	  * @return : UserGroupVO
	  */
	@Override
	public UserGroupVO registUserGroups(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_USERGRPS_01 ;		
		apiUrl = setPathVariable(apiUrl, reqVo.getProjectId());
		
		MediaType mediaType = MediaType.parse(IfrApiConstants.IFR_API_MEDIA_TYPE);
		
		Map<String, Object> requestBody = new HashMap<String, Object>();
		requestBody.put("name", reqVo.getName());
		
		String result = HttpClientUtil.post(apiUrl, requestBody, mediaType);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			UserGroupVO response = new Gson().fromJson(jsonObj.get("data").toString(), UserGroupVO.class);
			return response;
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : getUserGroups
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자그룹 조회
	  * @param : ReqVO
	  * @return : UserGroupVO
	  */
	@Override
	public List<UserGroupVO> getUserGroups(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_USERGRPS_01;		
		apiUrl = setPathVariable(apiUrl, reqVo.getProjectId());
		
		String result = HttpClientUtil.get(apiUrl);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			UserGroupVO[] response = new Gson().fromJson(jsonObj.get("data").toString(), UserGroupVO[].class);
			List<UserGroupVO> list = Arrays.asList(response);
			return list;
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : modiUserGrpups
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자그룹 수정
	  * @param : 
	  * @return :
	  */
	@Override
	public UserGroupVO modiUserGrpups(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_USERGRPS_02 ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getUserGroupId());
		
		MediaType mediaType = MediaType.parse(IfrApiConstants.IFR_API_MEDIA_TYPE);
		
		Map<String, String> requestBody = new HashMap<String, String>();
		requestBody.put("name", reqVo.getName());
		
		String result = HttpClientUtil.put(apiUrl, requestBody, mediaType);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			UserGroupVO response = new Gson().fromJson(jsonObj.get("data").toString(), UserGroupVO.class);
			return response;
		}else {
			throw new Exception(header.getResultMessage());
		}
	}

	/**
	  * @Method Name : deleteUserGroups
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자그룹 삭제
	  * @param : 
	  * @return :
	  */
	@Override
	public String deleteUserGroups(ReqVO reqVo) throws Exception {
		String apiUrl = IfrApiConstants.IFR_API_DOMAIN + IfrApiConstants.API.URI_USERGRPS_02 ;		
		apiUrl = setPathVariables(apiUrl, reqVo.getProjectId(), reqVo.getUserGroupId());		
		
		String result = HttpClientUtil.delete(apiUrl);
        
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;
		
		RspVO header = new Gson().fromJson(jsonObj.get("header").toString(), RspVO.class);
		
		if(! checkError(header.getResultCode())){
			 return "ok";
		}else {
			throw new Exception(header.getResultMessage());
		}
	}
	
	/**
	  * @Method Name : saveAlarmGroup
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 알림그룹 저장
	  * @param : 
	  * @return :
	  */
	@Override
	public void saveAlarmGroup(GridParameterMap gridParameterMap) throws Exception {
    	JSONArray createArr = gridParameterMap.getCreate();
    	JSONArray updateArr = gridParameterMap.getUpdate();
    	JSONArray deleteArr = gridParameterMap.getDelete();

    	if(createArr.size() > 0) {
    		for (Object obj : createArr) {
    			JSONObject childObj = (JSONObject) obj;

    			ReqVO reqVo = new ReqVO();
    			reqVo.setName(ObjectUtils.toString(childObj.get("name")));
    			reqVo.setAlarmTypeEmail(ObjectUtils.toString(childObj.get("alarmTypeEmail")));
    			reqVo.setAlarmTypePhone(ObjectUtils.toString(childObj.get("alarmTypePhone")));
    		
    			this.registAlamGroups(reqVo);
    		}
    	}

    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject childObj = (JSONObject) obj;

    			ReqVO reqVo = new ReqVO();
    			reqVo.setAlarmGroupId(ObjectUtils.toString(childObj.get("id")));
    			reqVo.setName(ObjectUtils.toString(childObj.get("name")));
    			reqVo.setAlarmTypeEmail(ObjectUtils.toString(childObj.get("alarmTypeEmail")));
    			reqVo.setAlarmTypePhone(ObjectUtils.toString(childObj.get("alarmTypePhone")));
    			
    			this.modiAlamGrpups(reqVo);
    		}
    	}

    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;

    			ReqVO reqVo = new ReqVO();
    			reqVo.setAlarmGroupId(ObjectUtils.toString(childObj.get("id")));

    			this.deleteAlamGroups(reqVo);
    		}
    	}
	}
	
	/**
	  * @Method Name : saveAlarmConfig
	  * @작성일 : 2023. 3. 30.
	  * @작성자 : bhs
	  * @Method 설명 : 감시설정 저장
	  * @param : 
	  * @return :
	  */
	@Override
	public void saveAlarmConfig(GridParameterMap gridParameterMap) throws Exception {
		JSONArray createArr = gridParameterMap.getCreate();
    	JSONArray deleteArr = gridParameterMap.getDelete();

    	if(createArr.size() > 0) {
    		for (Object obj : createArr) {
    			JSONObject childObj = (JSONObject) obj;

    			ReqVO reqVo = new ReqVO();
    			reqVo.setAlarmGroupId(ObjectUtils.toString(childObj.get("alarmGroupId")));
    			reqVo.setObserveItemCode(ObjectUtils.toString(childObj.get("observeItemCode")));
    			reqVo.setCompareTypeCode(ObjectUtils.toString(childObj.get("compareTypeCode")));
    			reqVo.setContinueTimeMinute(ObjectUtils.toString(childObj.get("continueTimeMinute")));
    			reqVo.setEventGradeTypeCode(ObjectUtils.toString(childObj.get("eventGradeTypeCode")));
    			reqVo.setCriticalValueContent(ObjectUtils.toString(childObj.get("criticalValueContent")));
    			reqVo.setCriticalValueUnit(ObjectUtils.toString(childObj.get("criticalValueUnit")));
    			reqVo.setObserveConfigDetailContent(ObjectUtils.toString(childObj.get("observeConfigDetailContent")));

    			this.registAlamConfigs(reqVo);
    		}
    	}

    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;

    			ReqVO reqVo = new ReqVO();
    			reqVo.setAlarmGroupId(ObjectUtils.toString(childObj.get("alarmGroupId")));
    			reqVo.setObserveItemCode(ObjectUtils.toString(childObj.get("observeItemCode")));
    			reqVo.setCompareTypeCode(ObjectUtils.toString(childObj.get("compareTypeCode")));
    			reqVo.setContinueTimeMinute(ObjectUtils.toString(childObj.get("continueTimeMinute")));
    			reqVo.setEventGradeTypeCode(ObjectUtils.toString(childObj.get("eventGradeTypeCode")));
    			reqVo.setCriticalValueContent(ObjectUtils.toString(childObj.get("criticalValueContent")));
    			reqVo.setObserveConfigDetailContent(ObjectUtils.toString(childObj.get("observeConfigDetailContent")));

    			this.deleteAlarmConfigs(reqVo);
    		}
    	}
	}
	
	/**
	  * @Method Name : saveAlarmInstance
	  * @작성일 : 2023. 3. 30.
	  * @작성자 : bhs
	  * @Method 설명 : 알림-인스턴스연동 저장
	  * @param : 
	  * @return :
	  */
	@Override
	public void saveAlarmInstance(GridParameterMap gridParameterMap) throws Exception {
		JSONArray createArr = gridParameterMap.getCreate();
    	JSONArray deleteArr = gridParameterMap.getDelete();
    	
    	String instanceIds1[] = new String[createArr.size()];
    	String instanceIds2[] = new String[deleteArr.size()];

    	if(createArr.size() > 0) {
    		int loopCnt = 0;
    		ReqVO reqVo = new ReqVO();
    		for (Object obj : createArr) {
    			JSONObject childObj = (JSONObject) obj;

    			if(loopCnt == 0) {
    				reqVo.setAlarmGroupId(ObjectUtils.toString(childObj.get("alarmGroupId")));    			
    			}
    			
    			instanceIds1[loopCnt] = ObjectUtils.toString(childObj.get("instanceId"));
    			
    			loopCnt++;
    		}
    		reqVo.setInstanceIds(instanceIds1);
    		this.registInstances(reqVo);
    	}

    	if(deleteArr.size() > 0) {
    		int loopCnt = 0;
    		ReqVO reqVo = new ReqVO();
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;

    			if(loopCnt == 0) {
    				reqVo.setAlarmGroupId(ObjectUtils.toString(childObj.get("alarmGroupId")));    			
    			}
    			
    			instanceIds2[loopCnt] = ObjectUtils.toString(childObj.get("instanceId"));
    			
    			loopCnt++;
    		}
    		reqVo.setInstanceIds(instanceIds2);
    		this.deleteInstances(reqVo);
    	}
	}

	/**
	  * @Method Name : saveAlarmUserGroup
	  * @작성일 : 2023. 3. 30.
	  * @작성자 : bhs
	  * @Method 설명 : 알림-사용자그룹 연동 저장
	  * @param : 
	  * @return :
	  */
	@Override
	public void saveAlarmUserGroup(GridParameterMap gridParameterMap) throws Exception {
		JSONArray createArr = gridParameterMap.getCreate();
    	JSONArray deleteArr = gridParameterMap.getDelete();
    	
    	String userGroupIds1[] = new String[createArr.size()];
    	String userGroupIds2[] = new String[deleteArr.size()];

    	if(createArr.size() > 0) {
    		int loopCnt = 0;
    		ReqVO reqVo = new ReqVO();
    		for (Object obj : createArr) {
    			JSONObject childObj = (JSONObject) obj;

    			if(loopCnt == 0) {
    				reqVo.setAlarmGroupId(ObjectUtils.toString(childObj.get("alarmGroupId")));    			
    			}
    			
    			userGroupIds1[loopCnt] = ObjectUtils.toString(childObj.get("userGroupId"));
    			
    			loopCnt++;
    		}
    		reqVo.setUserGroupsIds(userGroupIds1);
    		this.registUserAlarmGroups(reqVo);
    	}

    	if(deleteArr.size() > 0) {
    		int loopCnt = 0;
    		ReqVO reqVo = new ReqVO();
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;

    			if(loopCnt == 0) {
    				reqVo.setAlarmGroupId(ObjectUtils.toString(childObj.get("alarmGroupId")));    			
    			}
    			
    			userGroupIds2[loopCnt] = ObjectUtils.toString(childObj.get("userGroupId"));
    			
    			loopCnt++;
    		}
    		reqVo.setUserGroupsIds(userGroupIds2);
    		this.deleteUserAlarmGroups(reqVo);
    	}
	}
	
	/**
	  * @Method Name : saveUserGroup
	  * @작성일 : 2023. 3. 30.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자그룹 저장
	  * @param : 
	  * @return :
	  */
	@Override
	public void saveUserGroup(GridParameterMap gridParameterMap) throws Exception {
		JSONArray createArr = gridParameterMap.getCreate();
		JSONArray updateArr = gridParameterMap.getUpdate();
    	JSONArray deleteArr = gridParameterMap.getDelete();

    	if(createArr.size() > 0) {
    		for (Object obj : createArr) {
    			JSONObject childObj = (JSONObject) obj;

    			ReqVO reqVo = new ReqVO();
    			reqVo.setName(ObjectUtils.toString(childObj.get("name")));
    			
    			this.registUserGroups(reqVo);
    		}
    	}

    	if(updateArr.size() > 0) {
    		for (Object obj : updateArr) {
    			JSONObject childObj = (JSONObject) obj;

    			ReqVO reqVo = new ReqVO();
    			reqVo.setName(ObjectUtils.toString(childObj.get("name")));
    			reqVo.setUserGroupId(ObjectUtils.toString(childObj.get("id")));
    			
    			this.modiUserGrpups(reqVo);
    		}
    	}

    	if(deleteArr.size() > 0) {
    		for (Object obj : deleteArr) {
    			JSONObject childObj = (JSONObject) obj;

    			ReqVO reqVo = new ReqVO();
    			reqVo.setName(ObjectUtils.toString(childObj.get("name")));
    			reqVo.setUserGroupId(ObjectUtils.toString(childObj.get("id")));
    			
    			this.deleteUserGroups(reqVo);
    		}
    	}
	}

	/**
	  * @Method Name : setPathVariable
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : PathVariable setting
	  * @param : String
	  * @return : String
	  */
	private String setPathVariable(String url, String param) {
		url = url.replace("{p1}", param);
		return url;
	}
	
	/**
	  * @Method Name : setPathVariables
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 :  PathVariable setting
	  * @param : String
	  * @return : String
	  */
	private String setPathVariables(String url, String param1, String param2) {
		url = url.replace("{p1}", param1).replace("{p2}", param2);
		return url;
	}

	
	/**
	  * @Method Name : checkError
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : 에러코드 체크
	  * @param : int
	  * @return : boolean
	  */
	private boolean checkError(int resultCode) {
	    boolean result = false;
		switch(resultCode) {
			case 2000 : result = true;
			case 2001 : result = true;
			case 3002 : result = true;
			case 1000 : result = true;
			case 998   : result = true;
			case 4001 : result = true;
		}
		return result;
	}

}
