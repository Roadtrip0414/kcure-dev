package kcure.portal.sys.aum.usr.service;

import java.util.List;
import java.util.Map;

import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.aum.usr.service
  * @FileName : AumUsrService.java
  * @since : 2023. 1. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : 권한유저관리 Service
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public interface AumUsrService {

	/**
	  * @Method Name : selectAuthorUserList
	  * @작성일 : 2023. 1. 25.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한 유저 맵핑관리 목록
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectAuthorUserList(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : selectAuthorUserListTotCnt
	  * @작성일 : 2023. 1. 25.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한 유저 맵핑관리 목록 총 갯수
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : int
	  */
	public int selectAuthorUserListTotCnt(ComDefaultVO comDefaultVO) throws Exception;

	/**
	  * @Method Name : saveAuthorUser
	  * @작성일 : 2023. 1. 25.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한 유저 맵핑 저장
	  *  <p>
	  *  </p>
	  * @param : gridParameterMap GridParameterMap
	  * @return :
	  */
	public void saveAuthorUser(Map<String,Object> map) throws Exception;

	/**
	  * @Method Name : selectPrtiAdmin
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	참여기관 기관관리자 존재여부
	  *  </p>
	  * @param : 참여기관ID String
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectPrtiAdmin(String prtiId) throws Exception;

	/**
	  * @Method Name : selectAuthorUser
	  * @작성일 : 2023. 4. 3.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	유저의 권한 조회
	  *  </p>
	  * @param : Map<String,Object> map
	  * @return : Map<String,Object>
	  */
	public Map<String,Object> selectAuthorUser(Map<String,Object> map) throws Exception;

}
