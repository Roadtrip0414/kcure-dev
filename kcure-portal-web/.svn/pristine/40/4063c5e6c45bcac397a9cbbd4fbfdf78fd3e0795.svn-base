package kcure.portal.uat.uca.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kcure.portal.uat.uca.service.SignupService;


/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.uca.service.impl
 * @FileName : UcaServiceImpl.java
 * @since : 2023. 1. 31.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	회원가입에 관한 ServiceImpl 클래스를 정의한다.
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  </pre>
 */
@Service("SignupService")
public class SignupServiceImpl implements SignupService{
	
	@Resource(name="SignupDAO")
	private SignupDAO signupDAO;

	@Override
	public int selectCntByEmail(String email) throws Exception {
		return signupDAO.selectCntByEmail(email);
	}

	@Override
	public HashMap<String, Object> selectUserByMobile(String mobileNo) throws Exception {
		return signupDAO.selectUserByMobile(mobileNo);
	}

	@Override
	public int insertUser(SignupVO signupVO) throws Exception {
		return signupDAO.insertUser(signupVO);
	}

	@Override
	public List<?> selectCmbPrtiList() throws Exception {
		return signupDAO.selectCmbPrtiList();
	}

}
