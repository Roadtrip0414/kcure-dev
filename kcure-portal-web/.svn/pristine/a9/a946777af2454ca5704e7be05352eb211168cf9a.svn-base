package kcure.portal.cmn.alm.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.alm.service.impl
 * @FileName : DszDAO.java
 * @since : 2023. 03. 23.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	사용자 알람에 대한 DAO 클래스를 정의한다.
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일            수정자            수정내용
 *  ----------      --------   ---------------------------
 *  2023.03.23  bhs        최초생성 
 *  </pre>
 */
@Repository("almDAO")
public class AlmDAO extends EgovComAbstractDAO {

	/**
	  * @Method Name : insertSvcNtce
	  * @작성일 : 2023. 03. 23.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자 알람 정보를 데이터베이스에 저장
	  *  <p>
	  *  </p>
	  * @param : almVO AlmVO
	  * @return :
	  */
	public int insertSvcNtce(AlmVO almVO) throws Exception {
		return insert("Alm.insertSvcNtce", almVO);
	}
	
	/**
	  * @Method Name : selectNtceMessage
	  * @작성일 : 2023. 03. 31.
	  * @작성자 : bhs
	  * @Method 설명 : 알람메세지 조회
	  *  <p>
	  *  </p>
	  * @param : String
	  * @return :
	  */
	public MsgVO selectNtceMessage(AlmVO almVO) throws Exception {
		return selectOne("Alm.selectNtceMessage", almVO);
	}
	
	/**
	  * @Method Name : selectAuthNm
	  * @작성일 : 2023. 03. 23.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자 권한정보 조회
	  *  <p>
	  *  </p>
	  * @param : String
	  * @return :
	  */
	public AlmVO selectAuthNm(String param) throws Exception {
		return selectOne("Alm.selectAuthNm", param);
	}
	
	/**
	  * @Method Name : selectDataAplcInfo
	  * @작성일 : 2023. 03. 23.
	  * @작성자 : bhs
	  * @Method 설명 : 데이터 신청정보 조회
	  *  <p>
	  *  </p>
	  * @param : String
	  * @return :
	  */
	public AlmVO selectDataAplcInfo(String param) throws Exception {
		return selectOne("Alm.selectDataAplcInfo", param);
	}
	
	/**
	  * @Method Name : selectUserInfo
	  * @작성일 : 2023. 03. 23.
	  * @작성자 : bhs
	  * @Method 설명 : 사용자 정보 조회
	  *  <p>
	  *  </p>
	  * @param : String
	  * @return :
	  */
	public AlmVO selectUserInfo(String param) throws Exception {
		return selectOne("Alm.selectUserInfo", param);
	}
	
	/**
	  * @Method Name : selectDataAplc
	  * @작성일 : 2023. 05. 02.
	  * @작성자 : psj
	  * @Method 설명 : 데이터 신청 조회
	  *  <p>
	  *  </p>
	  * @param : String
	  * @return :
	  */
	public MsgVO selectDataAplc(String param2) throws Exception {
		return selectOne("Alm.selectDataAplc", param2);
	}
	
	/**
	  * @Method Name : selectRvwPrncList
	  * @작성일 : 2023. 05. 02.
	  * @작성자 : psj
	  * @Method 설명 : 데이터 제공 기관 심의자 조회
	  *  <p>
	  *  </p>
	  * @param : String
	  * @return :
	  */
	public List<EgovMap> selectRvwPrncList(String param2) throws Exception {
		return selectList("Alm.selectRvwPrncList", param2);
	}
}
