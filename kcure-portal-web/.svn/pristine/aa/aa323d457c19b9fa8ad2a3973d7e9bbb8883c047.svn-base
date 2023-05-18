package kcure.portal.uat.uia.service;

import java.util.Map;

import egovframework.com.cmm.LoginVO;
import kcure.portal.cmn.api.lgn.service.impl.LgnPrtiVO;
import kcure.portal.cmn.api.lgn.service.impl.LgnVdiVO;
import kcure.portal.uat.uia.service.impl.KcureLoginVO;


/**
  * @Project : kcure-portal-web
  * @package_name : kcure.portal.uat.uia.service
  * @FileName : KcureLoginService.java
  * @since : 2023. 1. 31.
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 :	일반 로그인을 처리하는 비즈니스 인터페이스 클래스
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface KcureLoginService {


	/**
	 * 로그인인증제한을 조회한다.
	 * @param vo LoginVO
	 * @return Map
	 * @exception Exception
	 */
    Map<?,?> getLoginIncorrect(KcureLoginVO vo) throws Exception;


    /**
	 * 로그인인증제한을 처리한다.
	 * @param vo LoginVO
	 * @param Map mapLockUserInfo
	 * @return String
	 * @exception Exception
	 */
    String processLoginIncorrect(KcureLoginVO vo, Map<?,?> mapLockUserInfo) throws Exception;

	

	/**
	  * @Method Name : apiPrtiLoginCheck
	  * @작성일 : 2023. 2. 28.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	참여기관 로그인 체크
	  *  </p>
	  * @param : 참여기관id, 유저id, 비밀번호 String
	  * @return : lgnPrtiVO LgnPrtiVO
	  */
	LgnPrtiVO apiPrtiLoginCheck(String prtiId, String userId, String passWord);

	/**
	  * @Method Name : apiVdiLoginCheck
	  * @작성일 : 2023. 2. 28.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	vdi 로그인 검증
	  *  </p>
	  * @param : 유저id, 비밀번호 String
	  * @return : lgnVdiVO LgnVdiVO
	  */
	LgnVdiVO apiVdiLoginCheck(String userId, String passWord);
}
