package kcure.portal.sys.aum.usr.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.springframework.stereotype.Repository;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.aum.usr.service.impl
  * @FileName : AumUsrDAO.java
  * @since : 2023. 1. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	권한 유저 관리에 대한 DAO 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("aumUsrDAO")
public class AumUsrDAO extends EgovComAbstractDAO {

	/**
	  * @Method Name : viewAuthorUserManage
	  * @작성일 : 2023. 1. 25.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한 유저 맵핑 목록 조회
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectAuthorUserList(ComDefaultVO comDefaultVO) throws Exception {
		return selectList("Aum.selectAuthorUserList", comDefaultVO);
	}

	/**
	  * @Method Name : viewAuthorUserManageTotCnt
	  * @작성일 : 2023. 1. 25.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한 유저 맵핑 목록 총 갯수
	  *  <p>
	  *  </p>
	  * @param : comDefaultVO ComDefaultVO
	  * @return : int
	  */
	public int selectAuthorUserListTotCnt(ComDefaultVO comDefaultVO) throws Exception {
		return (Integer)selectOne("Aum.selectAuthorUserListTotCnt", comDefaultVO);
	}

	/**
	  * @Method Name : insertAuthUser
	  * @작성일 : 2023. 1. 26.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한유저 등록
	  *  <p>
	  *  </p>
	  * @param : map Map<String,Object>
	  * @return :
	  */
	public void insertAuthUser(Map<String,Object> map) throws Exception {
		insert("Aum.insertAuthUser", map);
	}

	/**
	  * @Method Name : deleteAuthUser
	  * @작성일 : 2023. 1. 26.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한 유저 삭제
	  *  <p>
	  *  </p>
	  * @param : map Map<String,Object>
	  * @return :
	  */
	public void deleteAuthUser(Map<String,Object> map) throws Exception {
		delete("Aum.deleteAuthUser", map);
	}

	/**
	  * @Method Name : selectPrtiAdmin
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	참여기관 관리자 정보
	  *  </p>
	  * @param : 기관ID String
	  * @return : 관리자 정보 List
	  */
	public List<?> selectPrtiAdmin(String prtiId) throws Exception {
		return selectList("Aum.selectPrtiAdminExist",prtiId) ;
	}

	/**
	  * @Method Name : selectUserAuthList
	  * @작성일 : 2023. 4. 3.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	유저가 가진 권한 목록
	  *  </p>
	  * @param : Map<String,Object> map
	  * @return : List<String>
	  */
	public List<String> selectUserAuthList(Map<String,Object> map) throws Exception {
		return selectList("Aum.selectUserAuthList",map);
	}

	/**
	  * @Method Name : selectAuthorUser
	  * @작성일 : 2023. 4. 3.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	유저의 권한 정보 조회
	  *  </p>
	  * @param : Map<String,Object> map
	  * @return : Map<String,Object>
	  */
	public Map<String,Object> selectAuthorUser(Map<String,Object> map) throws Exception {
		return selectOne("Aum.selectAuthorUser",map);
	}
}
