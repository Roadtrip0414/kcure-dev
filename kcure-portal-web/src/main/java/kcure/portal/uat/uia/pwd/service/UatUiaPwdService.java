package kcure.portal.uat.uia.pwd.service;

import java.util.HashMap;
import java.util.Map;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.uat.uia.pwd.service
 * @FileName : UatUiaPwdService.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	비밀번호 찾기에 대한 Service Interface를 정의한다.
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  2023.02.01   kyh           최초생성
 *  </pre>
 */
public interface UatUiaPwdService {
	/**
	 * @Method Name : selectPswdRsetTknIdDupl
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  비밀번호 토큰 중복 확인
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectPswdRsetTknIdDupl(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : insertPswdRset
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  비밀번호 토큰 저장
	 * @param : model
	 * @return :
	 */
	public void insertPswdRset(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * @Method Name : selectPswdRset
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  비밀번호 토큰 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectPswdRset(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : updatePswdRset
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  비밀번호 토큰 수정
	 * @param : model
	 * @return :
	 */
	public void updatePswdRset(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * @Method Name : updateUsrPswdRset
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  사용자 비밀번호 수정
	 * @param : model
	 * @return :
	 */
	public void updateUsrPswdRset(HashMap<String, Object> paramMap) throws Exception;
}
