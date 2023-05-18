package kcure.portal.uat.uia.pwd.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.uat.uia.pwd.service.impl
 * @FileName : UatUiaPwdDAO.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 : 비밀번호 찾기 처리를 위한 DAO 클래스를 정의한다.
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
@Repository("uatUiaPwdDAO")
public class UatUiaPwdDAO extends EgovComAbstractDAO {
	
	private static final String sqlNameSpace = "uatUiaPwd.";
	
	/**
	 * @Method Name : selectPswdRsetTknIdDupl
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  비밀번호 토큰 중복 확인
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectPswdRsetTknIdDupl(HashMap<String, Object> paramMap) throws Exception {
		return (Map<String, Object>)selectOne(sqlNameSpace + "selectPswdRsetTknIdDupl", paramMap);
	}
	
	/**
	 * @Method Name : insertPswdRset
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  비밀번호 토큰 저장
	 * @param : model
	 * @return :
	 */
	public void insertPswdRset(HashMap<String, Object> paramMap) throws Exception {
		insert(sqlNameSpace + "insertPswdRset", paramMap);
	}
	
	/**
	 * @Method Name : selectPswdRset
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  비밀번호 토큰 조회
	 * @param : model
	 * @return :
	 */
	public Map<String, Object> selectPswdRset(HashMap<String, Object> paramMap) throws Exception {
		return (Map<String, Object>)selectOne(sqlNameSpace + "selectPswdRset", paramMap);
	}
	
	/**
	 * @Method Name : updatePswdRset
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  비밀번호 토큰 수정
	 * @param : model
	 * @return :
	 */
	public void updatePswdRset(HashMap<String, Object> paramMap) throws Exception {
		insert(sqlNameSpace + "updatePswdRset", paramMap);
	}
	
	/**
	 * @Method Name : updateUsrPswdRset
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :  사용자 비밀번호 수정
	 * @param : model
	 * @return :
	 */
	public void updateUsrPswdRset(HashMap<String, Object> paramMap) throws Exception {
		insert(sqlNameSpace + "updateUsrPswdRset", paramMap);
	}
}
