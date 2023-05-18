package kcure.portal.sys.usr.bfn.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import kcure.portal.sys.usr.stt.service.impl.UsrVO;

/**
  * @Project : kcure-portal-web
  * @package_name        : kcure.portal.sys.usr.bfn.service.impl
  * @FileName : UsrBfnDAO.java
  * @since : 2023. 1. 30.
  * @version 1.0
  * @author : hjjeon
  * @프로그램 설명 : Email 발송이력 현황에 관한 DAO 클래스를 정의한다.
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("usrBfnDAO")
public class UsrBfnDAO extends EgovComAbstractDAO {

	/**
	  * @Method Name : selectBfntHstList
	  * @작성일 : 2023. 2. 1.
	  * @작성자 : hjjeon
	  * @Method 설명 : Email발송이력현황 조회
	  *  <p>
	  *  </p>
	  * @param : usrVO UsrVO
	  * @return : List<UsrVO>
	  */
	public List<UsrVO> selectBfntHstList(UsrVO usrVO) throws Exception {
		return selectList("Usr.selectBfntHstList", usrVO);
	}

	/**
	  * @Method Name : selectBfntHstListTotCnt
	  * @작성일 : 2023. 2. 1.
	  * @작성자 : hjjeon
	  * @Method 설명 : Email발송이력현황 총 갯수
	  *  <p>
	  *  </p>
	  * @param : usrVO UsrVO
	  * @return : int
	  */
	public int selectBfntHstListTotCnt(UsrVO usrVO) throws Exception {
		return selectOne("Usr.selectBfntHstListTotCnt", usrVO);
	}
}
