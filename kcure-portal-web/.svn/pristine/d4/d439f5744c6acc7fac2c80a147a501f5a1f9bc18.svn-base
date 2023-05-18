package kcure.portal.sys.aum.mnu.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

import org.springframework.stereotype.Repository;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.aum.mnu.service.impl
  * @FileName : AumDAO.java
  * @since : 2023. 1. 3.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	권한별 메뉴관리에 대한 DAO 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("aumMnuDAO")
public class AumMnuDAO extends EgovComAbstractDAO {

    /**
     * @Method Name : selectAuthorMenuList
     * @작성일 : 2023. 1. 4.
     * @작성자 : hjjeon
     * @Method 설명 : 권한 메뉴 맵핑 목록을 조회한다.
     *  <p>
     *  </p>
     * @param : comDefaultVO ComDefaultVO
     * @return : List<Map<String,Object>>
     */
	public List<Map<String,Object>> selectAuthorMenuList(ComDefaultVO comDefaultVO) throws Exception {
       return selectList("Aum.selectAuthorMenuList", comDefaultVO);
   }

   /**
     * @Method Name : selectAuthorMenuListTotCnt
     * @작성일 : 2023. 1. 4.
     * @작성자 : hjjeon
     * @Method 설명 : 권한목록 총 갯수를 조회한다.
     *  <p>
     *  </p>
     * @param : comDefaultVO ComDefaultVO
     * @return : int
     */
   public int selectAuthorMenuListTotCnt(ComDefaultVO comDefaultVO)  throws Exception {
       return (Integer)selectOne("Aum.selectAuthorMenuListTotCnt", comDefaultVO);
   }

	/**
	  * @Method Name : insertAuthorMenu
	  * @작성일 : 2023. 1. 5.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한 메뉴 관계정보를 화면에서 입력하여 입력항목의 정합성을 체크하고 데이터베이스에 저장
	  *  <p>
	  *  </p>
	  * @param : map Map<String,Object>
	  * @return :
	  */
	public void insertAuthorMenu(Map<String,Object> map) throws Exception {
		insert("Aum.insertAuthorMenu", map);
	}

	/**
	  * @Method Name : deleteAuthorMenu
	  * @작성일 : 2023. 1. 5.
	  * @작성자 : hjjeon
	  * @Method 설명 : 권한 메뉴 관계정보를 화면에 조회하여 데이터베이스에서 삭제
	  *  <p>
	  *  </p>
	  * @param : map Map<String,Object>
	  * @return :
	  */
	public void deleteAuthorMenu(Map<String,Object> map) throws Exception {
		delete("Aum.deleteAuthorMenu", map);
	}

}
