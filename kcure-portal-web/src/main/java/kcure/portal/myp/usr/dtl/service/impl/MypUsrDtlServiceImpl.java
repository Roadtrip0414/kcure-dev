package kcure.portal.myp.usr.dtl.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kcure.portal.myp.usr.dtl.service.MypUsrDtlService;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.myp.usr.dtl.service.impl
 * @FileName : MypUsrDtlServiceImpl.java
 * @since : 2023. 02. 01. 
 * @version 1.0
 * @author : kyh
 * @프로그램 설명 :	마이페이지 나의정보관리에 대한 비즈니스 구현 클래스를 정의한다.
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
@Service("mypUsrDtlService")
public class MypUsrDtlServiceImpl extends EgovAbstractServiceImpl implements MypUsrDtlService {
	
	@Resource(name="mypUsrDtlDAO")
	private MypUsrDtlDAO mypUsrDtlDAO;

	/**
	 * @Method Name : updateMypUsrDtlInfo
	 * @작성일 : 2023. 02. 01.
	 * @작성자 : kyh
	 * @Method 설명 :   회원정보 수정
	 * @param : model
	 * @return :
	 */
	@Override
	public void updateMypUsrDtlInfo(HashMap<String, Object> paramMap) throws Exception {
		mypUsrDtlDAO.updateMypUsrDtlInfo(paramMap);
	}
}
