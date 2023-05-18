package kcure.portal.myp.usr.dtl.service.impl;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.usr.dtl.service.impl
 * @FileName : MypUsrDtlDAO.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	마이페이지 나의정보관리에 대한 DAO 클래스를 정의한다.
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
@Repository("mypUsrDtlDAO")
public class MypUsrDtlDAO extends EgovComAbstractDAO {
	
	private static final String sqlNameSpace = "mypUsrDtl.";

	/**
	 * @Method Name : updateMypUsrDtlInfo
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   회원정보 수정
	 * @param : model
	 * @return :
	 */
	public void updateMypUsrDtlInfo(HashMap<String, Object> paramMap) throws Exception {
		update(sqlNameSpace + "updateMypUsrDtlInfo", paramMap);
	}
}
