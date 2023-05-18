package kcure.portal.sys.usr.stt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.usr.service.impl
  * @FileName : UsrDAO.java
  * @since : 2023. 1. 30.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : 사용자관리에 관한 DAO 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("usrSttDAO")
public class UsrSttDAO extends EgovComAbstractDAO {

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
	public List<UsrVO> selectUserList(UsrVO usrVO) throws Exception {
		return selectList("Usr.selectUserList", usrVO);
	}

	/**
	  * @Method Name : selectUserListTotCnt
	  * @작성일 : 2023. 1. 30.
	  * @작성자 : hjjeon
	  * @Method 설명 : 사용자 현황 목록 총 갯수
	  *  <p>
	  *  </p>
	  * @param : usrVO UsrVO
	  * @return : int
	  */
	public int selectUserListTotCnt(UsrVO usrVO) throws Exception {
		return selectOne("Usr.selectUserListTotCnt", usrVO);
	}

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
	public List<Map<String,Object>> selectUsrHstList(UsrVO usrVO) throws Exception {
		return selectList("Usr.selectUsrHstList", usrVO);
	}

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
	public int selectUsrHstListTotCnt(UsrVO usrVO) throws Exception {
		return selectOne("Usr.selectUsrHstListTotCnt", usrVO);
	}

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
	public List<?> selectUsrAuthList(UsrVO usrVO) throws Exception {
		return selectList("Usr.selectUsrAuthList", usrVO);
	}

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
	public void updateUsr(UsrVO usrVO) throws Exception {
		update("Usr.updateUsr", usrVO);
	}

	/**
	  * @Method Name : insertUsrHst
	  * @작성일 : 2023. 1. 30.
	  * @작성자 : hjjeon
	  * @Method 설명 : 사용자 이력 저장
	  *  <p>
	  *  </p>
	  * @param : usrVO UsrVO
	  * @return :
	  */
	public void insertUsrHst(UsrVO usrVO) throws Exception {
		update("Usr.insertUsrHst", usrVO);
	}

	/**
	  * @Method Name : selectCdCbo
	  * @작성일 : 2023. 1. 31.
	  * @작성자 : hjjeon
	  * @Method 설명 : 공통 코드 콤보 조회
	  *  <p>
	  *  </p>
	  * @param : String : 코드 값
	  * @return : List
	  */
	public List<?> selectCdCbo(String param) throws Exception {
		return selectList("Usr.selectCdCbo", param);
	}

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
	public UsrVO selectUserChanRsn(UsrVO param) {
		return selectOne("Usr.selectUserChanRsn", param);
	}
}
