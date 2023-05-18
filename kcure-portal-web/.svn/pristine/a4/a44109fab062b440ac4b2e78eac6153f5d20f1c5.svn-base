package kcure.portal.sys.mnu.dvz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.cmm.ComDefaultVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.mnu.dvz.service.impl
  * @FileName : MnuDvzDAO.java
  * @since : 2023. 3. 27.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 :	시각화 메뉴 관리 DAO
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("mnuDvzDAO")
public class MnuDvzDAO extends EgovComAbstractDAO{

	/**
	  * @Method Name : selectMenuManageList
	  * @작성일 : 2023. 3. 27.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	시각화 메뉴 관리 목록 조회
	  *  </p>
	  * @param : ComDefaultVO comDefaultVO
	  * @return : List<Map<String,Object>>
	  */
	public List<Map<String,Object>> selectMenuManageList(ComDefaultVO comDefaultVO) throws Exception {
        return selectList("MnuDvz.selectMenuManageList", comDefaultVO);
    }

    /**
      * @Method Name : selectMenuManageListTotCnt
      * @작성일 : 2023. 3. 27.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	시각화 메뉴 관리 목록 총 갯수
      *  </p>
      * @param : ComDefaultVO comDefaultVO
      * @return : int
      */
    public int selectMenuManageListTotCnt(ComDefaultVO comDefaultVO)  throws Exception {
        return selectOne("MnuDvz.selectMenuManageListTotCnt", comDefaultVO);
    }

    /**
      * @Method Name : insertMenuManage
      * @작성일 : 2023. 3. 27.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	시각화 메뉴 관리 저장
      *  </p>
      * @param : Map<String,Object> map
      * @return :
      */
    public void insertMenuManage(Map<String,Object> map) throws Exception {
        insert("MnuDvz.insertMenuManage", map);
    }

    /**
      * @Method Name : deleteMenuManage
      * @작성일 : 2023. 3. 27.
      * @작성자 : hjjeon
      * @Method 설명 :
      *  <p>
      *  	시각화 메뉴 관리 삭제
      *  </p>
      * @param : Map<String,Object> map
      * @return :
      */
    public void deleteMenuManage(Map<String,Object> map) throws Exception {
        delete("MnuDvz.deleteMenuManage", map);
    }
}
