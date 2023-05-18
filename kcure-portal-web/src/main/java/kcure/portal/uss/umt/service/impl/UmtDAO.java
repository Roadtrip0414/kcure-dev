package kcure.portal.uss.umt.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("umtDAO")
public class UmtDAO extends EgovComAbstractDAO {
	/**
	  * @Method Name : viewUser
	  * @작성일 : 2023. 1. 6.
	  * @작성자 : hjjeon
	  * @Method 설명 : 사용자 목록 조회
	  *  <p>
	  *  </p>
	  * @param : umtVO UmtVO
	  * @return : List<UmtVO
	  */
	public List<UmtVO> viewUser(UmtVO umtVO) throws Exception {
		return selectList("Umt.selectUserList", umtVO);
	}

    /**
     * @Method Name : viewUserTotCnt
     * @작성일 : 2023. 1. 6.
     * @작성자 : hjjeon
     * @Method 설명 : 사용자 목록 총 갯수를 조회
     *  <p>
     *  </p>
     * @param :  umtVO UmtVO
     * @return : int
     */
   public int viewUserTotCnt(UmtVO umtVO) throws Exception {
       return (Integer)selectOne("Umt.selectUserListTotCnt", umtVO);
   }
}
