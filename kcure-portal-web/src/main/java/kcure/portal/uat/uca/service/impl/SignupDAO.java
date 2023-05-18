package kcure.portal.uat.uca.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;


/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.uca.service.impl
 * @FileName : UcaDAO.java
 * @since : 2023. 1. 31.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	회원가입에 대한 DAO 클래스를 정의한다.
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  </pre>
 */
@Repository("SignupDAO")
public class SignupDAO extends EgovComAbstractDAO {
	
	/**
	  * @Method Name : selectUserByMobile
	  * @date : 2023. 2. 1.
	  * @Method 설명 :
	  *  <p>	
	  *     휴대폰 가입정보를 조회한다.
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public HashMap<String, Object> selectUserByMobile(String param) throws Exception {
		return selectOne("SignupUsr.selectUserByMobile", param);
	}
	
	/**
	  * @Method Name : selectUserByEmail
	  * @date : 2023. 2. 1.
	  * @Method 설명 :
	  *  <p>	
	  *     이메일 중복여부를 조회한다.
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public int selectCntByEmail(String email) throws Exception {
		return selectOne("SignupUsr.selectCntByEmail", email);
	}
	
	/**
	  * @Method Name : insertUser
	  * @date : 2023. 2. 1.
	  * @Method 설명 :
	  *  <p>	
	  *    신규 회원정보를 등록한다.
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public int insertUser(SignupVO signupVO) throws Exception {
		return insert("SignupUsr.insertUser", signupVO);
	}
	
	/**
	  * @Method Name : selectCmbPrtiList
	  * @date : 2023. 3. 23.
	  * @Method 설명 :
	  *  <p>	
	  *    참여기관 콤보정보를 조회한다.
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public List<?> selectCmbPrtiList() throws Exception {
		return selectList("SignupUsr.selectCmbPrtiList");
	}

}
