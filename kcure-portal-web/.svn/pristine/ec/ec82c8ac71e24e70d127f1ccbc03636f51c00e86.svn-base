package kcure.portal.sys.mnu.mng.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.mnu.service.impl
  * @FileName : MnuDAO.java
  * @since : 2023. 2. 14.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	메뉴관리 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("mnuMngDAO")
public class MnuMngDAO extends EgovComAbstractDAO{
    /**
      * @Method Name : selectMenuManageList
      * @작성일 : 2023. 1. 17.
      * @작성자 : hjjeon
      * @Method 설명 : 메뉴 관리 목록 조회
      *  <p>
      *  </p>
      * @param : mnuVO MnuVO
      * @return : List<MnuVO>
      */
	public List<MnuVO> selectMenuManageList(MnuVO mnuVO) throws Exception {
        return selectList("Mnu.selectMenuManageList", mnuVO);
    }

    /**
      * @Method Name : selectMenuManageListTotCnt
      * @작성일 : 2023. 1. 18.
      * @작성자 : hjjeon
      * @Method 설명 : 메뉴 관리 목록 총 갯수
      *  <p>
      *  </p>
      * @param : mnuVO MnuVO
      * @return : int
      */
    public int selectMenuManageListTotCnt(MnuVO mnuVO)  throws Exception {
        return (Integer)selectOne("Mnu.selectMenuManageListTotCnt", mnuVO);
    }

    /**
      * @Method Name : insertMenuManage
      * @작성일 : 2023. 1. 18.
      * @작성자 : hjjeon
      * @Method 설명 : 메뉴관리 등록
      *  <p>
      *  </p>
      * @param : mnuVO MnuVO
      * @return :
      */
    public void insertMenuManage(MnuVO mnuVO) throws Exception {
        insert("Mnu.insertMenuManage", mnuVO);
    }

    /**
      * @Method Name : updateMenuManage
      * @작성일 : 2023. 1. 18.
      * @작성자 : hjjeon
      * @Method 설명 : 메뉴 관리 수정
      *  <p>
      *  </p>
      * @param : mnuVO MnuVO
      * @return :
      */
    public void updateMenuManage(MnuVO mnuVO) throws Exception {
        update("Mnu.updateMenuManage", mnuVO);
    }

    /**
      * @Method Name : deleteMenuManage
      * @작성일 : 2023. 1. 18.
      * @작성자 : hjjeon
      * @Method 설명 : 메뉴 관리 삭제
      *  <p>
      *  </p>
      * @param : mnuVO MnuVO
      * @return :
      */
    public void deleteMenuManage(MnuVO mnuVO) throws Exception {
        delete("Mnu.deleteMenuManage", mnuVO);
    }

    /**
	  * @Method Name : selectGnbMenuList
	  * @작성일 : 2023. 2. 14.
	  * @작성자 : kyh
	  * @Method 설명 : 상단 GNB 메뉴 조회
	  *  <p>
	  *  </p>
	  * @param : HashMap<String, Object> paramMap
	  * @return : List<MnuVO>
	  */
	public List<MnuVO> selectGnbMenuList(HashMap<String, Object> paramMap) throws Exception {
        return selectList("Mnu.selectGnbMenuList", paramMap);
    }

	/**
	  * @Method Name : selectNavMenuList
	  * @작성일 : 2023. 2. 14.
	  * @작성자 : kyh
	  * @Method 설명 : 상단 navigation 메뉴 조회
	  *  <p>
	  *  </p>
	  * @param : HashMap<String, Object> paramMap
	  * @return : List<MnuVO>
	  */
	public List<MnuVO> selectNavMenuList(HashMap<String, Object> paramMap) throws Exception {
        return selectList("Mnu.selectNavMenuList", paramMap);
    }

	/**
	  * @Method Name : selectNowMenuInfo
	  * @작성일 : 2023. 2. 14.
	  * @작성자 : kyh
	  * @Method 설명 : 상단 메뉴 타이틀 조회
	  *  <p>
	  *  </p>
	  * @param : HashMap<String, Object> paramMap
	  * @return : Map<String, Object>
	  */
	public Map<String, Object> selectNowMenuInfo(HashMap<String, Object> paramMap) throws Exception {
        return (Map<String, Object>)selectOne("Mnu.selectNowMenuInfo", paramMap);
    }
}
