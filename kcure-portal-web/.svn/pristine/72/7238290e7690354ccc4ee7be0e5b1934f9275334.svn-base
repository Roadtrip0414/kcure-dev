package kcure.portal.cmn.api.dsz.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.api.dsz.service.impl
 * @FileName : DszDAO.java
 * @since : 2023. 02. 13.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	안심활용센터 예약 API 에 대한 DAO 클래스를 정의한다.
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일            수정자            수정내용
 *  ----------      --------   ---------------------------
 *  2023.02.13  bhs        최초생성 
 *  </pre>
 */
@Repository("dszDAO")
public class DszDAO extends EgovComAbstractDAO {

	/**
	  * @Method Name : insertReserve
	  * @작성일 : 2023. 02. 13.
	  * @작성자 : bhs
	  * @Method 설명 : 안심활용센터 기관의 예약정보를 데이터베이스에 저장
	  *  <p>
	  *  </p>
	  * @param : dszVO DszVO
	  * @return :
	  */
	public int insertReserve(ResvVO resvVO) throws Exception {
		return insert("Dsz.insertReserve", resvVO);
	}
	
	/**
	  * @Method Name : checkPrtiIdValid
	  * @작성일 : 2023. 04. 05.
	  * @작성자 : bhs
	  * @Method 설명 : 안심활용센터 기관코드 유효성 체크
	  *  <p>
	  *  </p>
	  * @param : String
	  * @return :
	  */
	public int checkPrtiIdValid(String param) throws Exception {
		return selectOne("Dsz.checkPrtiIdValid", param);
	}
	
}
