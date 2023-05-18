package kcure.portal.uat.uca.service;

import java.util.HashMap;
import java.util.List;

import kcure.portal.uat.uca.service.impl.SignupVO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.uca.service
 * @FileName : UcaService.java
 * @since : 2023. 1. 31.
 * @version 1.0
 * @author : bhs
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
public interface SignupService {
	
	public int  selectCntByEmail(String checkEmail)  throws Exception;
	
	public HashMap<String, Object> selectUserByMobile(String mobileNo) throws Exception;
	
	public int insertUser(SignupVO signupVO) throws Exception;
	
	public List<?> selectCmbPrtiList() throws Exception;

}
