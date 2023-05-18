package kcure.portal.uat.uia.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
  * @Project : kcure-portal-web
  * @package_name : kcure.portal.uat.uia.service.impl
  * @FileName : LoginDAO.java
  * @since : 2023. 1. 31.
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 :	일반 로그인을 처리하는 DAO 클래스
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
@Repository("kcureLoginDAO")
public class LoginDAO extends EgovComAbstractDAO {

	/** ID Generation */
	@Resource(name="egovLoginLogIdGnrService")
	private EgovIdGnrService egovLoginLogIdGnrService;

	/**
	  * @Method Name : selectLoginIncorrect
	  * @date : 2023. 1. 31.
	  * @Method 설명 :
	  *  <p>
	  *     로그인인증제한 내역을 조회한다.
	  *  </p>
	  * @param :
	  * @return :
	  */
	public Map<?,?> getLoginIncorrect(KcureLoginVO vo) throws Exception {
    	return (Map<?,?>)selectOne("KcureLoginUsr.getLoginIncorrect", vo);
    }

	/**
	 * 로그인인증제한 내역을 업데이트 한다.
	 * @param vo LoginVO
	 * @return vod
	 * @exception Exception
	 */
    public void updateLoginIncorrect(Map<?,?> map) throws Exception {
    	update("KcureLoginUsr.updateLoginIncorrect", map);
    }



	/**
	  * @Method Name : getAuthList
	  * @작성일 : 2023. 2. 17.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	api
	  *  </p>
	  * @param :
	  * @return :
	  */
	public List<Map<String,Object>> getAuthList(KcureLoginVO loginVO) {
		return selectList("KcureLoginUsr.getAuthList",loginVO) ;
	}
}
