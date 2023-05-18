package kcure.portal.cmn.api.prt.service;

import java.util.Map;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.cmn.api.prt.service
  * @FileName : ApiPrtService.java
  * @since : 2023. 3. 2.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	참여기관 API Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface ApiPrtService {

	/**
	  * @Method Name : dataAplyExist
	  * @작성일 : 2023. 3. 2.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	참여기관 파일경로 가져오기
	  *  </p>
	  * @param : 참여기관ID, 연구No
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> dataAplyExist(String priId, String dataAplyNo) throws Exception;

	/**
	  * @Method Name : insertAplyFile
	  * @작성일 : 2023. 3. 15.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	반출신청 첨부파일 저장
	  *  </p>
	  * @param : requestMap Map<String, Object>
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> insertAplyFile(Map<String, Object> requestMap) throws Exception;
}
