package kcure.portal.sys.usr.stt.service;

import java.util.List;
import java.util.Map;

import kcure.portal.sys.usr.stt.service.impl.UsrVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.usr.service
  * @FileName : UsrService.java
  * @since : 2023. 1. 30.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	사용자 관리에 관한 Service interface를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface UsrSttService {
	/**
	  * @Method Name : selectUserList
	  * @작성일 : 2023. 1. 30.
	  * @작성자 : hjjeon
	  * @Method 설명 : 사용자 현황 목록 조회
	  *  <p>
	  *  </p>
	  * @param : usrVO UsrVO
	  * @return : List<UsrVO>
	  */
	public List<UsrVO> selectUserList(UsrVO usrVO) throws Exception;

	/**
	  * @Method Name : selectUserListTotCnt
	  * @작성일 : 2023. 1. 30.
	  * @작성자 : hjjeon
	  * @Method 설명 : 사용자 현황 목록 총갯수
	  *  <p>
	  *  </p>
	  * @param : usrVO UsrVO
	  * @return : int
	  */
	public int selectUserListTotCnt(UsrVO usrVO) throws Exception;

	/**
	  * @Method Name : selectUsrHstList
	  * @작성일 : 2023. 1. 30.
	  * @작성자 : hjjeon
	  * @Method 설명 : 사용자 이력 조회
	  *  <p>
	  *  </p>
	  * @param : usrVO UsrVO
	  * @return : List<UsrVO>
	  */
	public List<Map<String,Object>> selectUsrHstList(UsrVO usrVO) throws Exception;

	/**
	  * @Method Name : selectUsrHstListTotCnt
	  * @작성일 : 2023. 2. 7.
	  * @작성자 : hjjeon
	  * @Method 설명 : 사용자 이력 목록 총 갯수
	  *  <p>
	  *  </p>
	  * @param : usrVO UsrVO
	  * @return : int
	  */
	public int selectUsrHstListTotCnt(UsrVO usrVO) throws Exception;

	/**
	  * @Method Name : selectUsrAuthList
	  * @작성일 : 2023. 1. 30.
	  * @작성자 : hjjeon
	  * @Method 설명 : 사용자 권한 조회
	  *  <p>
	  *  </p>
	  * @param : usrVO UsrVO
	  * @return : List<String>
	  */
	public List<?> selectUsrAuthList(UsrVO usrVO) throws Exception;

	/**
	  * @Method Name : updateUsr
	  * @작성일 : 2023. 1. 30.
	  * @작성자 : hjjeon
	  * @Method 설명 : 사용자 정보 업데이트
	  *  <p>
	  *  </p>
	  * @param : usrVO UsrVO
	  * @return :
	  */
	public void updateUsr(UsrVO usrVO) throws Exception;

	/**
	  * @Method Name : viewCdCbo
	  * @작성일 : 2023. 1. 31.
	  * @작성자 : hjjeon
	  * @Method 설명 : 공통 코드 콤보 조회
	  *  <p>
	  *  </p>
	  * @param : String : 코드 값
	  * @return : List
	  */
	public List<?> selectCdCbo(String param) throws Exception;

	/**
	  * @Method Name : selectUserChanRsn
	  * @date : 2023. 3. 31.
	  * @Method 설명 :
	  *  <p>
	  *     사용자 처리 사유 select ( 반려 )
	  *  </p>
	  * @param :
	  * @return :
	  */
	public UsrVO selectUserChanRsn(UsrVO usrVO);

}
